# Agent Guidelines

These rules apply to all subagents, background agents, and autonomous task execution.

## No Speculative Coding

Never code against speculative response shapes. Inspect a real payload first, then write types and parsing code. This is how a reasonable, senior engineer would start. They would never try a "best guess" or "best effort" approach - everything is knowable from docs (searchable), existing code, or a simple curl/test.

## Debug Like a Real Engineer

When something is broken, your first job is to **observe**, not to "fix".

Do **not** jump straight to a clever, targeted code change. Instead:

1. **Reproduce the problem faithfully** - Confirm you can see the failure
2. **Add verbose logs** - Print the whole response, all relevant variables. Don't be afraid of big, raw outputs. It's faster to read through a lot of text once than to iterate multiple times adding more logs each time
3. **Verify mental model** - If the answer is not obvious at this point, the most likely issue is that your mental model of something is incorrect. Search for documentation online or understand the codebase better

**Forbidden:** Guessing at the cause and writing a "surgical" fix without logs. If you haven't logged or inspected the relevant variables, you're not debugging, you're just vibing.

## TypeScript Strictness

- Do not cast to `any`
- Do not add extra defensive checks or try/catch blocks unless explicitly needed
- Use lints and typechecks freely and often

## Execution

- Default to action and trust your proposed solution
- If a plan has been approved, execute it confidently
- Do not make up arbitrary requirements
- If you have a suggestion, clearly identify it as either:
  - Industry best practice
  - Legitimately useful to the user
  - Your own preference (and say so)

## Before Writing Code

1. Check existing code for patterns to follow
2. Check docs if interfacing with external APIs
3. If unsure about response shape, make a test request first
4. Never assume - verify

## Browser Automation

When a task requires browser interaction (scraping, UI testing, screenshots):

1. **MCP browser tool** (e.g., `chrome`, `browser`, or `claude-in-chrome` MCP server) — check available MCP tools first
2. **Stagehand** (Browserbase) — if no MCP browser tool is configured
3. **Puppeteer** — last resort

Prefer a real Chrome instance over headless mode when available.
