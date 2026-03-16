---
name: sprint
description: >
  Sprint planning and management including pre-planning meetings, ticket breakdown, and launch readiness.
  Use when starting a sprint, preparing pre-planning with tech lead, creating sprint tickets, reviewing
  capacity, or tracking sprint progress. Trigger phrases: "sprint planning", "pre-planning meeting",
  "sprint tickets", "sprint capacity", "sprint retro", "launch readiness".
  Do NOT use for project status reports (use status skill) or backlog prioritization (use prioritize skill).
---

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

## Pre-Planning Meeting (PM + Tech Lead)

Hold this 60-minute meeting BEFORE sprint planning with the full team.

### Agenda Template

1. **Previous Sprint Assessment** (10 min)
   - Sprint completion percentage
   - Key deliverables achieved vs planned
   - Carryover items with root cause
   - Performance against SOW/benchmarks

2. **Risk & Dependency Review** (10 min)
   - Active risks with current status
   - New risks identified
   - Dependency resolution timeline
   - External blocker status

3. **Upcoming Sprint Scope** (20 min)
   - Sprint goal definition (one sentence)
   - Key deliverables and milestones
   - Team composition and availability changes
   - Technical focus areas

4. **Work Breakdown Discussion** (15 min)
   - High-priority items walkthrough
   - Estimation validation
   - Cross-team coordination needs
   - Definition of done alignment

5. **Action Items** (5 min)
   - Items needing follow-up before planning
   - Communication to team

---

## Work Breakdown by Role

When creating sprint tickets, break down by team member:

### Per-Member Ticket Template

| Field | Content |
|-------|---------|
| Title | [Verb] [specific deliverable] |
| Assignee | [Name] |
| Points | [Fibonacci estimate] |
| Dependencies | [Ticket IDs or "none"] |
| Acceptance Criteria | [Testable conditions] |
| Sprint Goal Link | [How this advances the sprint goal] |

### Role-Based Focus Areas

- **Tech Lead**: Architecture decisions, code review, performance validation, testing oversight
- **Frontend Dev**: UI implementation, cross-platform parity, UX polish
- **Backend Dev**: API optimization, service reliability, integration stability
- **QA/Tester**: Test case execution, regression, SOW compliance validation
- **PM/Scrum Master**: Ceremony facilitation, blocker escalation, stakeholder comms

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

## Solo Developer Mode

When team size is 1, simplify everything:

### Capacity (Solo)

```markdown
## Sprint Capacity (Solo)

**Sprint Duration:** [X] days
**Developer:** [Name]
**Availability:** [X]% (account for meetings, context-switching)

**Base velocity:** [X] points/sprint (use last 3 sprints avg)
**Adjusted:** [X] points (availability × base)
**Buffer:** 20% (solo = no backup, need more buffer)
**Committable:** [X] points
```

### Ceremonies (Solo)

| Ceremony | Solo Adaptation | Duration |
|----------|----------------|----------|
| Planning | Morning intent — pick today's work from backlog | 10 min |
| Daily Standup | **Skip** — no audience. Use git log as record. | 0 min |
| Review | Self-review: does it work? Ship it or note debt. | 15 min |
| Retrospective | End-of-sprint journal: what slowed me down? | 15 min |

### Tracking (Solo)

Replace daily standups with morning intent / evening actual:

```markdown
### Day [X]
**Intent:** [What I plan to work on]
**Actual:** [What I got done]
**Blocker:** [None / what stopped me]
**Carry:** [What rolls to tomorrow]
```

### Solo Anti-Patterns

| Pattern | Problem | Fix |
|---------|---------|-----|
| No sprint at all | Work drifts, no velocity data | Even 1-week sprints help |
| Over-planning | Ceremonies take longer than coding | Keep total ceremony time < 1hr/sprint |
| No retrospective | Same mistakes repeat | 15-min journal is enough |
| Infinite WIP | 5 things in progress, 0 done | WIP limit of 2 |

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

## Launch Sprint Mode

When the sprint targets a release or milestone deadline:

### Launch Readiness Criteria

- [ ] All SOW/contract performance benchmarks consistently met
- [ ] User acceptance testing complete
- [ ] Deployment pipeline validated
- [ ] Rollback plan documented
- [ ] Client sign-off obtained or scheduled
- [ ] Post-launch monitoring in place

### Scope Protection Rules

- No new features after sprint midpoint
- Bug fixes only in final 2 days
- Scope changes require PM + Tech Lead + Client approval
- Document any scope deferrals with rationale

---

## Integration with Other Skills

| Skill | Integration |
|-------|-------------|
| **estimate** | Provides point values for sprint items |
| **prioritize** | Orders backlog for sprint selection |
| **status** | Daily sprint status reporting |
| **stories** | Creates sprint-ready user stories |
