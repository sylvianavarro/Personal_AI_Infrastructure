---
name: prioritize
description: >
  Prioritize work using RICE framework. Use when deciding what to build next, ordering backlogs,
  or making trade-off decisions between competing priorities.
  Trigger phrases: "prioritize", "RICE", "MoSCoW", "what should we build", "backlog order".
  Do NOT use for sprint planning (use sprint skill) or estimation (use estimate skill).
---

# Prioritization (RICE Framework)

Objectively prioritize work items.

## When to Use

- Ordering product backlog
- Deciding between competing features
- Making trade-off decisions
- Justifying priority choices to stakeholders

---

## RICE Framework

**RICE Score = (Reach x Impact x Confidence) / Effort**

| Factor | Definition | Scale |
|--------|------------|-------|
| **Reach** | How many users affected per quarter | Number (users, transactions, etc.) |
| **Impact** | Effect on each user | 3=Massive, 2=High, 1=Medium, 0.5=Low, 0.25=Minimal |
| **Confidence** | How sure are we | 100%=High, 80%=Medium, 50%=Low |
| **Effort** | Person-months to complete | Number (in person-months) |

---

## Prioritization Process

### Step 1: List Items

```markdown
## Items to Prioritize

| ID | Description | Requester | Current Priority |
|----|-------------|-----------|------------------|
| 1 | [Feature A] | [Source] | [Gut feel] |
| 2 | [Feature B] | [Source] | [Gut feel] |
| 3 | [Bug C] | [Source] | [Gut feel] |
```

### Step 2: Score Each Factor

**For each item:**

```markdown
### Item: [Description]

**Reach:** [X] users/quarter
- How: [calculation method]

**Impact:** [0.25-3]
- 3 = Massive (game-changer)
- 2 = High (significant improvement)
- 1 = Medium (noticeable)
- 0.5 = Low (minor)
- 0.25 = Minimal (barely noticeable)
- Reasoning: [why this score]

**Confidence:** [50-100]%
- 100% = Have data, proven concept
- 80% = Strong signals, some validation
- 50% = Gut feel, unvalidated
- Reasoning: [why this score]

**Effort:** [X] person-months
- Breakdown: [tasks and estimates]
```

### Step 3: Calculate RICE

```markdown
## RICE Scores

| Item | Reach | Impact | Confidence | Effort | RICE Score |
|------|-------|--------|------------|--------|------------|
| [A] | [X] | [X] | [X]% | [X] | [Score] |
| [B] | [X] | [X] | [X]% | [X] | [Score] |
| [C] | [X] | [X] | [X]% | [X] | [Score] |

**Formula:** (Reach x Impact x Confidence) / Effort
```

### Step 4: Final Priority

```markdown
## Prioritized Backlog

| Priority | Item | RICE | Notes |
|----------|------|------|-------|
| 1 | [Highest] | [X] | |
| 2 | [Second] | [X] | |
| 3 | [Third] | [X] | |
```

---

## Quick Prioritization (MoSCoW)

For rapid prioritization without full RICE:

| Category | Definition | Rule of Thumb |
|----------|------------|---------------|
| **Must Have** | Critical for success | Ship fails without it |
| **Should Have** | Important but not critical | Significant value, deferrable |
| **Could Have** | Nice to have | Only if time permits |
| **Won't Have** | Out of scope | Explicit exclusion |

---

## Priority Matrices

### Urgency vs Importance (Eisenhower)

```
              URGENT          NOT URGENT
           +--------------+--------------+
IMPORTANT  | DO FIRST     | SCHEDULE     |
           | Crises,      | Planning,    |
           | Deadlines    | Improvement  |
           +--------------+--------------+
NOT        | DELEGATE     | ELIMINATE    |
IMPORTANT  | Interrupts,  | Time waste,  |
           | Some emails  | Distractions |
           +--------------+--------------+
```

### Value vs Effort

```
              LOW EFFORT      HIGH EFFORT
           +--------------+--------------+
HIGH       | QUICK WINS   | MAJOR        |
VALUE      | Do these     | PROJECTS     |
           | immediately  | Plan these   |
           +--------------+--------------+
LOW        | FILL-INS     | AVOID        |
VALUE      | If time      | Don't do     |
           | permits      | these        |
           +--------------+--------------+
```

---

## Scoring Guidelines

### Reach Examples

| Scenario | Reach Value |
|----------|-------------|
| All users see it | Total active users |
| Feature for segment | Segment size |
| Internal tool | Internal users |
| One-time use | Users who hit feature once |

### Reach Proxies (Non-User-Facing Work)

When the work isn't directly user-facing (infrastructure, tech debt, internal tools, platform systems), "users affected per quarter" doesn't apply directly. Use a proxy:

| Work Type | Reach Proxy | How to Calculate |
|-----------|-------------|------------------|
| **Platform/infrastructure** | Downstream features enabled | Count features/games/products that depend on this system |
| **Tech debt** | Developer hours saved per quarter | Estimate hours lost to the debt × frequency |
| **Internal tooling** | Internal users × usage frequency | Team size × daily/weekly uses |
| **Prerequisite system** | Users of ALL systems that require this | Sum reach of dependent features |
| **Test coverage** | Features protected from regression | Count features covered by the tests |
| **Reusable component** | Products that will use it | Count current + planned consumers |

**Example:** A reusable `TimerSystem` used by 5 future games, each played by 3 users = reach of 15. A prerequisite system blocking 4 features with combined reach of 200 = reach of 200.

**Rule:** When scoring reach for infrastructure, use the reach of whatever it unblocks, not the reach of the infrastructure itself.

### Impact Scale

| Score | Description | Example |
|-------|-------------|---------|
| 3 | Massive | Core workflow transformed |
| 2 | High | Significant time saved |
| 1 | Medium | Noticeable improvement |
| 0.5 | Low | Minor convenience |
| 0.25 | Minimal | Cosmetic improvement |

### Confidence Adjustments

| Confidence | When to Use |
|------------|-------------|
| 100% | A/B test data, customer contracts |
| 80% | User research, analytics support |
| 50% | Intuition, no validation |

### Effort Estimation

| Effort | Typical Work |
|--------|-------------|
| 0.5 month | Simple feature, 1 dev |
| 1 month | Standard feature, 1-2 devs |
| 3 months | Complex feature, team |
| 6+ months | Major initiative |

---

## Common Mistakes

| Mistake | Problem | Fix |
|---------|---------|-----|
| Inflating impact | Everything is "massive" | Force rank against past features |
| 100% confidence | Over-certainty | Require evidence for >80% |
| Underestimating effort | Optimistic planning | Use past actuals as baseline |
| Ignoring reach | Focusing on "cool" | Quantify user impact |

---

## Output Format

```markdown
## Priority Decision: [Context]

### RICE Analysis

| Item | Reach | Impact | Confidence | Effort | Score |
|------|-------|--------|------------|--------|-------|
| [A] | X | X | X% | X | **X** |

### Recommendation

**Priority Order:**
1. [Item]: [RICE score] — [one-line rationale]
2. [Item]: [RICE score] — [one-line rationale]

**Trade-off Notes:**
- [Any considerations that might override pure RICE]
```

---

## Integration with Other Skills

| Skill | Integration |
|-------|-------------|
| **estimate** | Provides effort component |
| **sprint** | Prioritized items feed into sprint |
| **prd** | Priority informs feature scope |
| **stories** | Priority orders story creation |
