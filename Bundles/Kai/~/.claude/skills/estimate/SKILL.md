name: estimate
description: Estimate complexity and effort for tickets or features. Use when sizing work for sprint planning, providing estimates to stakeholders, or breaking down large tasks.

# Engineering Estimation

Estimate complexity and effort for implementation work.

## When to Use

- Sprint planning (sizing backlog items)
- Responding to "how long will this take?"
- Breaking down epics into manageable pieces
- Risk assessment for project planning

---

## Story Point Reference (Fibonacci)

| Points | Complexity | Time Estimate | Examples |
|--------|------------|---------------|----------|
| **1** | Trivial | < 2 hours | Config change, copy update, simple fix |
| **2** | Simple | 2-4 hours | Bug fix, add field, small refactor |
| **3** | Small | 4-8 hours | New endpoint, new component |
| **5** | Medium | 1-2 days | Feature with tests, moderate complexity |
| **8** | Large | 2-4 days | Multi-component feature, integration work |
| **13** | X-Large | 1 week | Major feature, significant refactor |
| **21** | Epic | 1-2 weeks | **Break this down further** |

---

## Estimation Process

### Step 1: Understand the Request

**Extract from ticket/description:**
- What needs to be built/changed
- Acceptance criteria
- Technical constraints
- Dependencies mentioned

**If unclear:** Ask clarifying questions before estimating.

---

### Step 2: Analyze Scope

**Files/Components Affected:**

```bash
# Identify likely files to modify
# Check existing patterns
# Note new files needed
```

| Area | Files | Type of Change |
|------|-------|----------------|
| [Component] | [file paths] | New / Modify / Delete |

**Technical Tasks Breakdown:**
1. [Task 1]: [Description]
2. [Task 2]: [Description]
3. [Task 3]: [Description]

---

### Step 3: Complexity Assessment

**Complexity Factors:**

| Factor | Present? | Impact |
|--------|----------|--------|
| New technology/framework | Yes/No | +2-3 points |
| External API integration | Yes/No | +2-3 points |
| Database schema changes | Yes/No | +1-2 points |
| UI/UX complexity | Yes/No | +1-3 points |
| Security considerations | Yes/No | +1-2 points |
| Performance requirements | Yes/No | +1-2 points |
| Legacy code modification | Yes/No | +1-2 points |
| Cross-team coordination | Yes/No | +1-2 points |
| Unclear requirements | Yes/No | +2-3 points |

---

### Step 4: Risk Assessment

**Risk Multipliers:**

| Risk | Multiplier | Applies? |
|------|------------|----------|
| First time with tech | 1.5x | Yes/No |
| External dependency | 1.3x | Yes/No |
| Unclear requirements | 1.5x | Yes/No |
| Legacy/untested code | 1.3x | Yes/No |
| Cross-team sync | 1.2x | Yes/No |

**Identified Risks:**
1. **[Risk]**: [Description] — Mitigation: [How to handle]
2. **[Risk]**: [Description] — Mitigation: [How to handle]

---

### Step 5: Dependencies

**Blockers (Must complete first):**
- [ ] [Dependency 1] — Owner: [Name/Team]
- [ ] [Dependency 2] — Owner: [Name/Team]

**Parallel Work (Can proceed independently):**
- [Related ticket] — [Relationship]

---

### Step 6: Final Estimate

**Summary:**

| Metric | Value |
|--------|-------|
| **Base Estimate** | [X] story points |
| **Risk Multiplier** | [X.X]x |
| **Adjusted Estimate** | [X] story points |
| **Confidence Level** | High / Medium / Low |
| **Time Estimate** | [X-Y] days |

**Confidence Factors:**
- **High**: Clear requirements, familiar tech, isolated change
- **Medium**: Some unknowns, moderate complexity
- **Low**: Many unknowns, new tech, unclear requirements

---

### Step 7: Breakdown Recommendation

**If estimate > 8 points, recommend splitting:**

```
Original: [TICKET] — 13 points
Split into:
  ├── [TICKET-A]: [Description] — 5 points
  ├── [TICKET-B]: [Description] — 5 points
  └── [TICKET-C]: [Description] — 3 points
```

---

## Estimate Output Format

```markdown
## Estimate: [TICKET-### or Description]

**Estimate:** [X] story points
**Confidence:** High / Medium / Low
**Time:** [X-Y] days

### Breakdown
| Task | Points |
|------|--------|
| [Task 1] | [X] |
| [Task 2] | [X] |
| Testing | [X] |
| **Total** | **[X]** |

### Risks
- [Risk 1]: [Impact and mitigation]

### Dependencies
- [Dependency]: [Owner]

### Notes
- [Any assumptions or caveats]
```

---

## Estimation Guidelines

### Include in Effort
- Development time
- Testing (30-40% of development)
- Code review cycles
- Documentation updates
- Deployment/rollout complexity

### When in Doubt
- Estimate higher, not lower
- Express uncertainty ("5-8 points, depending on X")
- Break down to reduce uncertainty
- Note assumptions explicitly

### Common Mistakes
- Forgetting testing time
- Ignoring code review cycles
- Not accounting for documentation
- Underestimating integration complexity
- Optimistic assumptions about existing code quality

---

## Quick Estimate Shortcut

For quick estimates without full analysis:

| Situation | Estimate |
|-----------|----------|
| "I've done this exact thing before" | Use past actual |
| "Similar to [X] we did" | Use [X] + buffer |
| "Never done this before" | Add 50% to gut feel |
| "Requirements unclear" | Estimate range, not point |

---

## Integration with Other Skills

| Skill | Integration |
|-------|-------------|
| **writing-plans** | Estimates inform task breakdown |
| **sprint** | Estimates feed into capacity planning |
| **prioritize** | Effort is key input to RICE scoring |
| **knowledge-accumulation** | Check if similar work was done before |
