name: status
description: Generate project status reports. Use when preparing for standups, stakeholder updates, or documenting current project state.

# Status Report

Generate comprehensive project status reports.

## When to Use

- Daily standup preparation
- Weekly stakeholder updates
- End-of-day progress summary
- Handoff to another developer
- Sprint progress check

---

## Quick Status (30 seconds)

```bash
git log --oneline --since="yesterday" --author="$(git config user.name)" && \
git status --short && \
echo "--- Active branches ---" && \
git branch --list | head -5
```

---

## Full Status Report

### Step 1: Gather Data

```bash
# Recent commits (your work)
git log --oneline --since="1 week ago" --author="$(git config user.name)"

# Current branch state
git status

# Open branches
git branch -a --no-merged main

# Recent changes (files modified)
git diff HEAD~10 --stat

# Stashed work
git stash list
```

### Step 2: Check Project State

```bash
# Test status (if applicable)
npm test 2>&1 | tail -5
# or
pytest --tb=no -q 2>&1 | tail -5

# Build status
npm run build 2>&1 | tail -3
# or
python -m py_compile src/**/*.py 2>&1
```

### Step 3: Review Knowledge Base

```bash
# Recent decisions
tail -20 ~/.claude/knowledge/decisions.md

# Any blockers documented
grep -i "blocker\|blocked" docs/*.md 2>/dev/null
```

---

## Status Report Template

```markdown
# Status Report: [Date]

## Summary
[1-2 sentence overview of current state]

## Completed Since Last Update
- [x] [Task/feature completed]
- [x] [Task/feature completed]

## In Progress
| Task | Status | ETA | Blockers |
|------|--------|-----|----------|
| [Task] | [X]% | [date] | [none/description] |

## Blockers
- [ ] [Blocker description] — Waiting on: [who/what]

## Next Steps
1. [Next priority task]
2. [Following task]

## Risks / Concerns
- [Any emerging risks or concerns]

## Metrics (if applicable)
| Metric | Current | Target |
|--------|---------|--------|
| Test coverage | X% | Y% |
| Open bugs | X | Y |
| Sprint velocity | X | Y |
```

---

## Status Report Formats

### Solo Developer Update

When working solo, skip standup theater. Use git as your record:

```markdown
## [Date] Progress

**Done:** [commits/features completed — pull from git log]
**Next:** [top 1-2 priorities for next session]
**Blocked:** [None / what's stopping progress]
**Debt noted:** [shortcuts taken that need future cleanup]
```

**Generate automatically:**
```bash
echo "## $(date +%Y-%m-%d) Progress"
echo "**Done:**"
git log --oneline --since="yesterday" --author="$(git config user.name)" | sed 's/^/- /'
echo "**WIP:**"
git status --short | head -5 | sed 's/^/- /'
```

### Daily Standup (Team)

```markdown
## [Date] Standup

**Yesterday:** [What was accomplished]
**Today:** [What's planned]
**Blockers:** [None / Description]
```

### Weekly Summary

```markdown
## Week of [Date Range]

### Highlights
- [Major accomplishment 1]
- [Major accomplishment 2]

### Progress
| Goal | Target | Actual | Notes |
|------|--------|--------|-------|
| [Goal] | [X] | [Y] | [context] |

### Challenges
- [Challenge faced and how addressed]

### Next Week Focus
1. [Priority 1]
2. [Priority 2]
```

### Stakeholder Update

```markdown
## Project Update: [Date]

### Executive Summary
[2-3 sentences for non-technical audience]

### Progress Against Milestones
| Milestone | Due | Status | Notes |
|-----------|-----|--------|-------|
| [Milestone] | [date] | On Track/At Risk/Delayed | [context] |

### Key Decisions Made
- [Decision 1]: [Impact]

### Upcoming Risks
| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| [Risk] | High/Med/Low | High/Med/Low | [Plan] |

### Resource Needs
- [Any additional resources needed]
```

---

## Automated Status Generation

```bash
#!/bin/bash
# Generate status report from git history

echo "# Status Report: $(date +%Y-%m-%d)"
echo ""
echo "## Completed Today"
git log --oneline --since="midnight" --author="$(git config user.name)" | sed 's/^/- /'
echo ""
echo "## Files Changed"
git diff HEAD~5 --stat | tail -10
echo ""
echo "## Current State"
git status --short
echo ""
echo "## Open Branches"
git branch --list | grep -v "^\*" | head -5 | sed 's/^/- /'
```

---

## Status Levels

| Level | Color | Meaning | Action |
|-------|-------|---------|--------|
| **On Track** | Green | Proceeding as planned | Continue |
| **At Risk** | Yellow | Potential delays/issues | Monitor closely, escalate if needed |
| **Blocked** | Red | Cannot proceed | Immediate escalation required |
| **Complete** | Blue | Done, verified | Close out, document |

---

## Best Practices

### Do
- Be honest about blockers and risks
- Quantify progress where possible
- Focus on outcomes, not activities
- Flag issues early
- Reference tickets/PRs

### Don't
- Hide problems until last minute
- Use vague language ("making progress")
- Report activities without outcomes
- Skip mentioning blockers
- Over-promise on timelines

---

## Integration with Other Skills

| Skill | Integration |
|-------|-------------|
| **catchup** | Status follows catchup at session start |
| **estimate** | Status references estimates |
| **executing-plans** | Status shows plan progress |
| **knowledge-accumulation** | Blockers become gotchas if recurring |

---

## Quick Reference

```bash
# What did I do today?
git log --oneline --since="midnight" --author="$(git config user.name)"

# What's the current state?
git status && git stash list

# What's blocked?
git branch -a --no-merged main | wc -l  # Open branches count

# Generate quick report
echo "Done: $(git log --oneline --since='midnight' | wc -l) commits"
echo "Open: $(git status --short | wc -l) files changed"
```

---

Ready to generate status reports.
