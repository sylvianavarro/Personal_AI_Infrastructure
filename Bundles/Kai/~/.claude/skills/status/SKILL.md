---
name: status
description: >
  Generate project status reports with multi-dimensional health assessment. Use when preparing
  standups, stakeholder updates, project health checks, or documenting current state. Supports
  traffic-light dashboards, executive summaries, and detailed analysis.
  Trigger phrases: "status report", "project health", "stakeholder update", "weekly summary",
  "health assessment", "project status".
  Do NOT use for sprint tracking (use sprint skill) or risk-only analysis (use raid skill).
---

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

## Project Health Assessment (6 Dimensions)

For comprehensive health status. Each dimension gets a traffic light.

### Dimensions

**1. Technical Health**
- Development velocity (actual vs planned), technical debt, test coverage, performance benchmarks, integration stability
- Key question: Are we meeting technical targets?

**2. Schedule Health**
- Milestone achievement, sprint completion %, critical path status, buffer consumption, dependency resolution
- Key question: Are we on track for delivery?

**3. Team Health**
- Capacity vs workload, velocity trends, knowledge distribution, communication effectiveness
- Key question: Is the team operating sustainably?

**4. Stakeholder Health**
- Client responsiveness, decision velocity, requirement stability, expectation alignment
- Key question: Are stakeholders engaged and decisions timely?

**5. Risk Health**
- Active risk count by severity, mitigation effectiveness, new vs closed ratio, contingency readiness
- Key question: Are risks under control?

**6. Financial Health**
- Burn rate vs plan, budget remaining vs work remaining, resource utilization
- Key question: Are we within budget?

### Traffic Light Logic

**GREEN (ALL must be true):**
- Schedule variance < 5%, no unmitigated critical risks, team capacity > 80%
- Client dependencies resolved within 48 hours, technical metrics on target, budget variance < 10%

**YELLOW (ANY triggers):**
- Schedule variance 5-15%, 1-2 critical risks with mitigation plans, team capacity 60-80%
- Client response delays 48-72 hours, budget variance 10-20%

**RED (ANY triggers):**
- Schedule variance > 15%, unmitigated critical risks, team capacity < 60%
- Client non-responsive > 72 hours, budget variance > 20%, launch date at risk

---

## Output Levels

### Level 1: Traffic Light (5 seconds)
```
Overall: [GREEN|YELLOW|RED] — [One-line summary] — [Critical action if any]
```

### Level 2: Executive Dashboard (30 seconds)
```markdown
Overall: [GREEN|YELLOW|RED] | Trend: [Improving|Stable|Declining] | Confidence: [High|Med|Low]

| Dimension | Status | Summary |
|-----------|--------|---------|
| Technical | [G/Y/R] | [brief] |
| Schedule | [G/Y/R] | [brief] |
| Team | [G/Y/R] | [brief] |
| Stakeholder | [G/Y/R] | [brief] |
| Risk | [G/Y/R] | [brief] |
| Financial | [G/Y/R] | [brief] |

**Critical Items (Top 3):**
1. [BLOCKER/RISK]: [Description] | Owner: [Name] | Due: [Date]
```

### Level 3: Full Analysis (5 minutes)
Use the Full Status Report template below with dimensional detail, trend analysis, and recommendations.

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

## Special Situations

### Client Dependency Cascade
IF multiple client items overdue > 5 days: Flag as PRIMARY RISK, include escalation recommendation, provide scope reduction options, calculate timeline impact.

### Technical Debt Avalanche
IF velocity declining + defect rate rising: Recommend stabilization sprint, calculate long-term velocity impact, identify critical refactoring needs.

### Timeline Compression
IF buffer consumed > 50% + risks increasing: Present scope reduction options, resource augmentation analysis, realistic timeline adjustments.

### Death by Thousand Cuts
IF multiple yellow items but no single red: Perform aggregate impact analysis, recommend systemic fix rather than item-by-item response.

---

## Anti-Patterns

**Never:**
- Report green when dependencies are blocked
- Hide negative trends
- Use vague language ("might," "could," "possibly")
- Forget to assign action owners
- Assume best-case scenarios
- Ignore compound risk effects

**Always:**
- Quantify impacts
- Assign owners to actions
- Provide timeline implications
- Consider compound risks
- Include confidence level
- Validate with recent data

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
