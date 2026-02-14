name: raid
description: Track Risks, Assumptions, Issues, and Dependencies. Use when managing project risks, surfacing blockers, or maintaining project health visibility.

# RAID Log

Track Risks, Assumptions, Issues, and Dependencies.

## When to Use

- Project kickoff (identify initial RAID items)
- Sprint planning (review current state)
- Status meetings (update stakeholders)
- When blocked or uncertain
- Risk assessment for new work

---

## RAID Overview

| Letter | Category | Definition | Action |
|--------|----------|------------|--------|
| **R** | Risks | Potential problems that might happen | Mitigation plan |
| **A** | Assumptions | Things we believe true but haven't verified | Validate |
| **I** | Issues | Current problems blocking progress | Resolve |
| **D** | Dependencies | External things we need to proceed | Track/Escalate |

---

## RAID Log Template

```markdown
# RAID Log: [Project Name]

**Last Updated:** [Date]
**Owner:** [Name]

---

## Risks

| ID | Risk | Likelihood | Impact | Mitigation | Owner | Status |
|----|------|------------|--------|------------|-------|--------|
| R1 | [Description] | H/M/L | H/M/L | [Plan] | [Name] | Open/Mitigated/Closed |

---

## Assumptions

| ID | Assumption | Validated? | Impact if Wrong | Validation Plan |
|----|------------|------------|-----------------|-----------------|
| A1 | [Description] | Yes/No | [Impact] | [How to validate] |

---

## Issues

| ID | Issue | Severity | Impact | Resolution | Owner | Status | Due |
|----|-------|----------|--------|------------|-------|--------|-----|
| I1 | [Description] | Critical/High/Med/Low | [Impact] | [Plan] | [Name] | Open/In Progress/Resolved | [Date] |

---

## Dependencies

| ID | Dependency | Owner | Status | Needed By | Escalation |
|----|------------|-------|--------|-----------|------------|
| D1 | [Description] | [Name/Team] | On Track/At Risk/Blocked | [Date] | [Contact] |
```

---

## Working with Risks

### Risk Assessment Matrix

```
           LOW IMPACT    MEDIUM IMPACT    HIGH IMPACT
         +--------------+-----------------+--------------+
HIGH     |   MEDIUM     |     HIGH        |  CRITICAL    |
LIKELY   |   Monitor    |  Active Plan    |  Priority    |
         +--------------+-----------------+--------------+
MEDIUM   |    LOW       |    MEDIUM       |    HIGH      |
LIKELY   |   Accept     |   Monitor       | Active Plan  |
         +--------------+-----------------+--------------+
LOW      |    LOW       |     LOW         |   MEDIUM     |
LIKELY   |   Accept     |   Accept        |   Monitor    |
         +--------------+-----------------+--------------+
```

### Risk Response Strategies

| Strategy | When to Use | Example |
|----------|-------------|---------|
| **Avoid** | Can eliminate cause | Change approach |
| **Mitigate** | Can reduce likelihood/impact | Add testing |
| **Transfer** | Someone else can handle | Insurance, outsource |
| **Accept** | Low priority or unavoidable | Monitor only |

### Writing Risk Statements

**Format:** "If [condition], then [consequence], resulting in [impact]"

**Example:**
"If the API provider changes their rate limits, then our batch processing will fail, resulting in delayed reports for customers."

---

## Working with Assumptions

### Assumption Categories

| Category | Examples |
|----------|----------|
| **Technical** | "System can handle X load" |
| **Resource** | "Team will have Y capacity" |
| **Timeline** | "Dependency delivered by Z date" |
| **Business** | "Users want feature A" |
| **External** | "API will remain stable" |

### Validation Approaches

| Approach | When |
|----------|------|
| **Prototype** | Technical uncertainty |
| **User research** | User behavior assumption |
| **Spike** | Feasibility questions |
| **Ask stakeholder** | Business assumptions |
| **Load test** | Performance assumptions |

---

## Working with Issues

### Issue Severity

| Severity | Definition | Response Time |
|----------|------------|---------------|
| **Critical** | Work stopped, no workaround | Immediate |
| **High** | Major impact, workaround exists | Within 24 hours |
| **Medium** | Moderate impact | Within sprint |
| **Low** | Minor inconvenience | When convenient |

### Issue Resolution Flow

```
Open → In Progress → Resolved → Closed
         |
      Escalated → [External resolution]
```

---

## Working with Dependencies

### Dependency Types

| Type | Example | Management |
|------|---------|------------|
| **Technical** | API from another team | Integration contract |
| **Resource** | Person with expertise | Capacity planning |
| **External** | Third-party service | SLA, fallback plan |
| **Sequential** | Task A before Task B | Schedule coordination |
| **Approval** | Sign-off required | Timeline, escalation path |

### Dependency Status

| Status | Meaning | Action |
|--------|---------|--------|
| **On Track** | Expected on time | Monitor |
| **At Risk** | Might be late | Escalate, plan B |
| **Blocked** | Cannot proceed | Immediate escalation |
| **Delivered** | Received | Verify and close |

---

## RAID Review Process

### Weekly Review

```markdown
## RAID Review: [Date]

### New Items
- [Any new R/A/I/D items]

### Status Changes
- [Items that changed status]

### Escalations Needed
- [Items requiring leadership attention]

### Closed This Week
- [Resolved items]
```

### RAID Meeting Agenda

1. Review critical/high items (5 min)
2. Update status of in-progress items (5 min)
3. Add new items (5 min)
4. Identify escalations (5 min)
5. Assign owners for unowned items (5 min)

---

## Quick RAID Check

For rapid project health assessment:

```markdown
## Quick RAID: [Date]

**Top Risk:** [Description] — [Status]
**Key Assumption:** [Description] — [Validated?]
**Active Issue:** [Description] — [Owner]
**Critical Dependency:** [Description] — [On Track?]

**Overall Health:** Green/Yellow/Red
```

---

## Integration with Other Skills

| Skill | Integration |
|-------|-------------|
| **sprint** | RAID items affect sprint planning |
| **status** | RAID feeds into status reports |
| **writing-plans** | Plans address identified risks |
| **prd** | PRD risk section from RAID |
| **estimate** | Dependencies affect estimates |

---

## Anti-Patterns

| Anti-Pattern | Problem | Fix |
|--------------|---------|-----|
| Stale log | Not updated | Weekly review cadence |
| No owners | Items orphaned | Assign at creation |
| Too many items | Analysis paralysis | Focus on top 5 per category |
| No action plans | Risk without mitigation | Require plan for High+ |
| Hidden dependencies | Surprised by blockers | Active discovery |

---

Ready to track project health.
