name: sprint
description: Sprint planning and management. Use when starting a sprint, reviewing capacity, or tracking sprint progress.

# Sprint Planning

Plan and manage sprint work effectively.

## When to Use

- Starting a new sprint
- Mid-sprint capacity check
- Sprint retrospective preparation
- Adjusting sprint scope

---

## Sprint Planning Process

### Step 1: Determine Capacity

```markdown
## Sprint Capacity

**Sprint Duration:** [X] days
**Team Members:** [List with availability]

| Team Member | Availability | Capacity (points) |
|-------------|--------------|-------------------|
| [Name] | 100% | [X] |
| [Name] | 80% (PTO) | [X] |
| **Total** | | **[X]** |

**Capacity Calculation:**
- Base velocity: [X] points/person/sprint
- Adjusted for availability
- Buffer for unknowns: 15-20%
```

### Step 2: Review Backlog

```markdown
## Backlog Review

**Prioritized Items:**
| Priority | Ticket | Points | Dependencies | Ready? |
|----------|--------|--------|--------------|--------|
| 1 | [ID] | [X] | [none/list] | Y/N |
| 2 | [ID] | [X] | [none/list] | Y/N |
| 3 | [ID] | [X] | [none/list] | Y/N |

**Definition of Ready:**
- [ ] Clear acceptance criteria
- [ ] Estimated
- [ ] No unresolved dependencies
- [ ] Design/UX approved (if applicable)
```

### Step 3: Commit to Sprint

```markdown
## Sprint Commitment

**Sprint Goal:** [One sentence describing the outcome]

**Committed Items:**
| Ticket | Points | Owner | Notes |
|--------|--------|-------|-------|
| [ID] | [X] | [Name] | |

**Total Committed:** [X] points
**Available Capacity:** [Y] points
**Buffer:** [Z] points ([%])

**Stretch Goals (if capacity allows):**
- [Ticket]: [Points]
```

---

## Sprint Tracking

### Daily Check

```markdown
## Sprint Day [X] of [Y]

**Progress:**
| Status | Count | Points |
|--------|-------|--------|
| Done | [X] | [X] |
| In Progress | [X] | [X] |
| Not Started | [X] | [X] |
| Blocked | [X] | [X] |

**Burndown:** [X]% complete, [Y]% of sprint elapsed
**On Track:** Yes/At Risk/No

**Blockers:**
- [Ticket]: [Blocker description]
```

### Mid-Sprint Review

```markdown
## Mid-Sprint Check

**Velocity Check:**
- Expected by now: [X] points
- Actual: [Y] points
- Delta: [+/-Z] points

**Risk Assessment:**
| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| [Risk] | H/M/L | H/M/L | [Plan] |

**Scope Adjustment Needed:** Yes/No
- If yes: [Items to add/remove]
```

---

## Sprint Metrics

| Metric | Formula | Target |
|--------|---------|--------|
| Velocity | Points completed/sprint | Stable |
| Commitment Accuracy | Completed/Committed | >80% |
| Carryover Rate | Carried items/Total | <10% |
| Bug Escape Rate | Bugs found post-sprint/Total | <5% |

---

## Sprint Ceremonies

| Ceremony | Duration | Purpose | Output |
|----------|----------|---------|--------|
| Planning | 1-2 hrs | Commit to work | Sprint backlog |
| Daily Standup | 15 min | Sync & blockers | Updated board |
| Review | 1 hr | Demo work | Feedback |
| Retrospective | 1 hr | Improve process | Action items |

---

## Common Patterns

### Over-commitment

**Symptoms:** Consistently carrying over items
**Fix:** Reduce commitment by 10-15%, track velocity

### Scope Creep

**Symptoms:** Sprint goal changes mid-sprint
**Fix:** Add new items to backlog, protect sprint

### Blocker Accumulation

**Symptoms:** Multiple blocked items
**Fix:** Daily escalation, clear ownership

---

## Sprint Template

```markdown
# Sprint [Number]: [Name]

**Dates:** [Start] - [End]
**Goal:** [One sentence]

## Capacity
| Member | Availability | Points |
|--------|--------------|--------|
| Total | | [X] |

## Committed Work
| Ticket | Points | Owner | Status |
|--------|--------|-------|--------|

## Stretch Goals
- [ ] [Ticket]

## Daily Updates
### Day 1
- Progress: [summary]
- Blockers: [list]

## Retrospective
### What went well
-
### What to improve
-
### Action items
- [ ] [Action] — Owner: [Name]
```

---

## Integration with Other Skills

| Skill | Integration |
|-------|-------------|
| **estimate** | Provides point values for sprint items |
| **prioritize** | Orders backlog for sprint selection |
| **status** | Daily sprint status reporting |
| **stories** | Creates sprint-ready user stories |
