---
name: hooks-authoring
description: Use when creating, modifying, or debugging Claude Code hooks — covers exit code semantics, event types, input parsing, registration, and testing
---

# Hooks Authoring

## Overview

Hooks are middleware that run before/after tool calls, on stop, and on session events. They receive JSON on stdin, control flow via exit codes, and report via stdout/stderr.

**Core principle:** Hooks guard boundaries. They validate, block, or observe — they never modify tool inputs directly.

**Announce at start:** "I'm using the hooks-authoring skill to [create/modify/debug] a hook."

## When to Use

- Adding guardrails (block dangerous operations, detect secrets)
- Enforcing conventions (commit message format, file naming)
- Capturing telemetry (event logging, session summaries)
- Injecting context at session start

## When NOT to Use

- Modifying Claude's core behavior — use skills or CLAUDE.md instead
- One-off validations — just run the check inline
- Things better solved by permission settings in `settings.json`

## Exit Code Semantics

This is the #1 mistake source. Get this wrong and your hook silently fails.

| Exit Code | Meaning | stdout | stderr |
|-----------|---------|--------|--------|
| `0` | Allow | Shown in verbose mode; JSON processed for structured control | Logged only |
| `2` | **Block** | **Ignored** | **Fed back to Claude** as feedback |
| Other | Non-blocking error | Ignored | Logged in verbose mode |

**Key insight:** On exit 2, Claude sees **stderr**, not stdout. Always use `console.error()` for block messages.

On exit 0, stdout JSON can return structured decisions for finer control:
```json
{
  "hookSpecificOutput": {
    "hookEventName": "PreToolUse",
    "permissionDecision": "allow|deny|ask",
    "permissionDecisionReason": "Explanation"
  }
}
```

## Event Types

| Event | Can Block? | Blocking Effect | Common Use |
|-------|-----------|-----------------|------------|
| `PreToolUse` | Yes | Prevents tool execution | Security validation, command filtering |
| `PostToolUse` | No | stderr shown to Claude | Post-action validation, lint checks |
| `UserPromptSubmit` | Yes | Erases prompt | Input filtering |
| `Stop` | Yes | Prevents Claude from stopping | Completion enforcement |
| `SubagentStop` | Yes | Prevents subagent exit | Subagent completion enforcement |
| `SessionStart` | No | stderr shown to user | Context injection (stdout on exit 0) |
| `SessionEnd` | No | stderr shown to user | Summary capture |

**Matcher syntax:** Tool name string (`"Bash"`), pipe-separated (`"Edit|Write"`), or wildcard (`"*"`).

## Hook Input (stdin JSON)

All hooks receive JSON on stdin with common fields:

```json
{
  "session_id": "abc123",
  "transcript_path": "/path/to/transcript.jsonl",
  "cwd": "/current/working/dir",
  "hook_event_name": "PreToolUse"
}
```

Event-specific additions:
- **PreToolUse / PostToolUse:** `tool_name`, `tool_input` (shape varies by tool)
- **Stop:** `stop_hook_active`, `response`, `session_id`
- **UserPromptSubmit:** user prompt text

Tool input shapes (most common):
- **Bash:** `{ command, description }`
- **Write:** `{ file_path, content }`
- **Edit:** `{ file_path, old_string, new_string }`

## Boilerplate Template

Standard Bun/TypeScript pattern used by all existing hooks:

```typescript
#!/usr/bin/env bun

interface PreToolUsePayload {
  session_id: string;
  tool_name: string;
  tool_input: {
    command?: string;
    file_path?: string;
    content?: string;
    new_string?: string;
  };
}

async function main() {
  try {
    const stdinData = await Bun.stdin.text();
    if (!stdinData.trim()) process.exit(0);
    const payload: PreToolUsePayload = JSON.parse(stdinData);

    // 1. Early exit if not relevant tool
    if (payload.tool_name !== 'Bash') process.exit(0);

    // 2. Extract what you need
    const command = payload.tool_input.command ?? '';

    // 3. Validate
    if (isDangerous(command)) {
      console.error(`Blocked: ${reason}`); // stderr → Claude sees this
      process.exit(2);
    }
  } catch (error) {
    console.error('Hook error:', error);
    // Never crash — allow the operation on error
  }
  process.exit(0);
}

main();
```

**Conventions from existing hooks:**
- `Bun.stdin.text()` for input — not readline, not `process.stdin`
- Early exit on empty stdin or non-matching tool_name
- Try/catch wrapping everything — **never crash, always allow on error**
- `console.error` for block messages (stderr), `console.log` for informational (stdout)

## Registration

After writing the script, register in `~/.claude/settings.json`:

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Bash",
        "hooks": [
          {
            "type": "command",
            "command": "bun ~/.claude/hooks/my-validator.ts"
          }
        ]
      }
    ]
  }
}
```

**Rules:**
- Use absolute path or `$PAI_DIR` for the command
- Multiple hooks on same matcher execute sequentially — any exit 2 blocks
- Hooks within a matcher array run in order — put fast checks first
- Timeout default: 600s. Override with `"timeout": N` (seconds).
- Use `"statusMessage": "Checking..."` for hooks that take noticeable time

## Testing Hooks

Manual test by piping JSON to stdin:

```bash
echo '{"session_id":"test","tool_name":"Bash","tool_input":{"command":"rm -rf /"}}' \
  | bun ~/.claude/hooks/security-validator.ts
echo $?  # Should be 2
```

**Checklist before deploying:**
- [ ] Exit 0 on empty stdin (graceful no-op)
- [ ] Exit 0 on non-matching tool_name
- [ ] Exit 2 on violation (check stderr has message)
- [ ] Exit 0 on valid input
- [ ] No crash on malformed JSON
- [ ] Registered in settings.json under correct event + matcher

**Debug mode:** `claude --debug` shows full hook execution. `/hooks` lists all registered hooks.

## Common Mistakes

**Using stdout instead of stderr for block messages**
- On exit 2, stdout is ignored. Claude sees stderr only.
- Fix: `console.error()` for block reasons, not `console.log()`

**Using exit 1 expecting it to block**
- Exit 1 = non-blocking error. The operation proceeds anyway.
- Fix: Always `process.exit(2)` to block.

**Crashing on unexpected input**
- Unhandled exception → operation may behave unpredictably.
- Fix: Wrap everything in try/catch. On error, `process.exit(0)` (allow).

**Not filtering by tool_name**
- Hook registered on `*` but only checks Bash → runs on every tool call, wasting time.
- Fix: Use specific matchers (`"Bash"`, `"Edit|Write"`), or early-exit on non-matching tool.

**Modifying the operation instead of blocking it**
- Hooks can't change tool inputs. They allow, block, or provide feedback.
- Fix: Block + explain in stderr what Claude should do differently.

**Blocking PostToolUse**
- PostToolUse fires AFTER the tool ran. Exit 2 doesn't undo the action.
- Fix: Use PreToolUse for blocking. PostToolUse is for validation/feedback only.

## Existing Hook Inventory

Current hooks in `~/.claude/hooks/`:

| Script | Event | Matcher | Purpose |
|--------|-------|---------|---------|
| `security-validator.ts` | PreToolUse | Bash | 10-tier attack pattern detection |
| `commit-validator.ts` | PreToolUse | Bash | Conventional Commits enforcement |
| `write-security-validator.ts` | PreToolUse | Edit\|Write | Secret detection in file writes |
| `stop-hook.ts` | Stop | * | Session summary capture |
| `capture-all-events.ts` | Multiple | * | Universal event telemetry |
| `update-tab-titles.ts` | UserPromptSubmit | * | Terminal tab title from prompt |

Shared utilities in `~/.claude/hooks/lib/`:
- `observability.ts` — telemetry dispatch (POST to observability dashboard, fails silently)
- `metadata-extraction.ts` — agent instance ID extraction for multi-agent tracking

## Integration

| Relationship | Skill | How |
|-------------|-------|-----|
| Complements | `completion-promise-loop` | Stop hooks can enforce completion promises |
| Complements | `dispatching-parallel-agents` | capture-all-events hook tracks agent dispatches |
| References | `commit` | commit-validator hook enforces same Conventional Commits rules |
| References | `verification-before-completion` | Hooks provide automated verification at tool-call boundaries |

## Quick Reference

| Parameter | Value |
|-----------|-------|
| Block exit code | `2` (not 1, not other) |
| Allow exit code | `0` |
| Block message channel | stderr (`console.error`) |
| Input format | JSON on stdin |
| Input reader | `Bun.stdin.text()` |
| Error handling | Never crash — catch + exit 0 |
| Registration | `~/.claude/settings.json` → `hooks` |
| Debug | `claude --debug` or `/hooks` command |
