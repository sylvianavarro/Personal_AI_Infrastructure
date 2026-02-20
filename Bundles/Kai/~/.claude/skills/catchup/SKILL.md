---
name: catchup
description: Restore context at session start. Use when starting a new session, returning to work after a break, or needing to understand current project state quickly.
---

# Catchup — Restore Context

Get up to speed on recent changes and current state quickly.

## When to Use

- Starting a new Claude Code session
- Returning after a break (hours, days, weeks)
- Switching between projects
- Before making changes to unfamiliar code
- After pulling latest changes

---

## Quick Catchup (30 seconds)

```bash
git status && git log --oneline -5 && git stash list
```

---

## Full Catchup Process

### Step 1: Repository State

```bash
# Current branch and status
git status
git branch -v

# Recent commits (last 15)
git log --oneline -15

# What's changed recently
git diff HEAD~10 --stat

# Any stashed work
git stash list
```

**Summary:**
| Item | Value |
|------|-------|
| Current branch | [branch] |
| Commits ahead of main | [X] |
| Uncommitted changes | Yes/No |
| Stashed work | [X] items |

---

### Step 2: Check Knowledge Base

**Before diving into code, check what we know:**

```bash
# Project knowledge
ls docs/knowledge/ 2>/dev/null

# Global knowledge
ls ~/.claude/knowledge/
```

**Review:**
- [ ] Recent Decision Log entries
- [ ] Known Gotchas for this area
- [ ] Solved Problems that might be relevant
- [ ] Integration Notes if working with external systems

---

### Step 3: Review Recent Changes

```bash
# Last 10 commits across all branches
git log --oneline -10 --all

# Files changed in last 5 commits
git diff HEAD~5 --stat

# What changed today
git log --since="midnight" --oneline

# My recent commits
git log --author="$(git config user.name)" --oneline -10
```

**Key Changes:**
| File | Change Type | Significance |
|------|-------------|--------------|
| [path] | Added/Modified/Deleted | [Brief note] |

---

### Step 4: Check for In-Progress Work

```bash
# Open branches not merged to main
git branch -a --no-merged main

# Work in progress files
ls -la *-progress.md 2>/dev/null
ls -la docs/*-progress.md 2>/dev/null
```

**Active Work:**
| Branch | Ticket | Status | Last Activity |
|--------|--------|--------|---------------|
| [branch] | [TICKET-###] | In Progress/Stalled | [date] |

---

### Step 5: Sync with Remote

```bash
# Fetch all changes
git fetch --all

# Check if behind
git log HEAD..origin/main --oneline

# Check for conflicts (dry run)
git merge origin/main --no-commit --no-ff 2>/dev/null && git merge --abort
```

---

### Step 6: Generate Summary

**Catchup Summary**

**Repository:** [name]
**As of:** [timestamp]

**Current State:**
- Branch: [current branch]
- Status: Clean / Has changes / Has stashed work
- Last commit: [date] - [message]

**Recent Activity (Last 5 commits):**
1. [commit summary]
2. [commit summary]
3. [commit summary]

**Work in Progress:**
- Active ticket: [TICKET-###] (if applicable)
- Branch purpose: [description]
- Completion: ~[X]% estimated

**Knowledge Base Highlights:**
- Recent decisions: [any relevant]
- Gotchas in this area: [any relevant]

**Recommended Next Steps:**
1. [Next action]
2. [Next action]

---

## Context-Specific Catchup

### Returning to Feature Work
```bash
git fetch origin main
git log HEAD..origin/main --oneline  # See what's new
git rebase origin/main               # Sync up (if no conflicts)
```

### Starting Fresh Session
```bash
git fetch --all
git status
git stash list
```

### Reviewing Someone Else's Work
```bash
git checkout [branch-name]
git log main..[branch-name] --oneline
git diff main...[branch-name]
```

### After Long Absence
```bash
# Full refresh
git fetch --all --prune
git log --oneline -20 --all
git status

# Check what major things changed
git diff HEAD~20 --stat | head -30

# Review any new knowledge entries
cat ~/.claude/knowledge/decisions.md | tail -50
```

---

## Catchup Checklist

- [ ] Understand current branch and its purpose
- [ ] Review recent commits
- [ ] Check for uncommitted/stashed work
- [ ] Sync with remote (fetch)
- [ ] Check knowledge base for relevant context
- [ ] Identify any blockers
- [ ] Know next steps

---

## Integration with Other Skills

| Skill | When to Use After Catchup |
|-------|---------------------------|
| **writing-plans** | If starting new feature work |
| **executing-plans** | If continuing existing plan |
| **systematic-debugging** | If investigating an issue |
| **knowledge-accumulation** | If you discover something worth documenting |

---

## Quick Commands Reference

```bash
# 30-second catchup
git status && git log --oneline -5

# Full catchup
git fetch -a && git status && git log --oneline -10 && git stash list

# What changed today
git log --since="midnight" --oneline

# My recent commits
git log --author="$(git config user.name)" --oneline -10

# See what's on a branch
git log main..[branch] --oneline
```

---

Ready to continue where you left off.
