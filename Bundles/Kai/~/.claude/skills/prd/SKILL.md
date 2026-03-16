---
name: prd
description: >
  Create Product Requirements Documents. Use when defining new features, documenting product
  decisions, or aligning stakeholders on scope before implementation.
  Trigger phrases: "PRD", "product requirements", "feature spec", "requirements document".
  Do NOT use for user stories (use stories skill) or sprint planning (use sprint skill).
---

# Product Requirements Document (PRD)

Define features and product decisions clearly.

## When to Use

- Starting a new feature
- Aligning stakeholders on scope
- Documenting product decisions
- Handing off requirements to engineering

---

## PRD Template

```markdown
# PRD: [Feature Name]

**Author:** [Name]
**Date:** [YYYY-MM-DD]
**Status:** Draft | In Review | Approved | Implemented
**Version:** 1.0

---

## Overview

### Problem Statement
[What problem are we solving? Who has this problem?]

### Goal
[What does success look like? One sentence.]

### Non-Goals
[What are we explicitly NOT doing?]
- [Non-goal 1]
- [Non-goal 2]

---

## Background

### Context
[Why now? What led to this feature?]

### User Research
[What do we know about user needs?]
- [Finding 1]
- [Finding 2]

### Competitive Analysis
[How do competitors handle this?]
| Competitor | Approach | Strengths | Weaknesses |
|------------|----------|-----------|------------|
| [Name] | [How] | [Pros] | [Cons] |

---

## Requirements

### Functional Requirements

| ID | Requirement | Priority | Notes |
|----|-------------|----------|-------|
| FR-1 | [Requirement] | Must | |
| FR-2 | [Requirement] | Should | |
| FR-3 | [Requirement] | Could | |

### Non-Functional Requirements

| Category | Requirement | Target |
|----------|-------------|--------|
| Performance | [Requirement] | [Metric] |
| Security | [Requirement] | [Standard] |
| Accessibility | [Requirement] | [Standard] |
| Scale | [Requirement] | [Numbers] |

---

## User Stories

| As a... | I want to... | So that... |
|---------|--------------|------------|
| [User type] | [Action] | [Benefit] |

---

## Scope

### In Scope
- [Feature/capability included]

### Out of Scope
- [Feature/capability excluded]
- [Explicitly deferred item]

### Future Considerations
- [Potential future enhancement]

---

## Design

### User Flow
[Describe or link to user flow diagrams]

### Wireframes/Mockups
[Link to designs]

### Key Interactions
| Action | Expected Result |
|--------|-----------------|
| [User action] | [System response] |

---

## Technical Considerations

### Architecture Impact
[How does this affect system architecture?]

### Dependencies
| Dependency | Owner | Status |
|------------|-------|--------|
| [System/team] | [Name] | [Status] |

### Risks
| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| [Risk] | H/M/L | H/M/L | [Plan] |

---

## Success Metrics

| Metric | Current | Target | Measurement |
|--------|---------|--------|-------------|
| [KPI] | [Baseline] | [Goal] | [How measured] |

---

## Timeline

| Milestone | Target Date | Notes |
|-----------|-------------|-------|
| PRD Approved | [Date] | |
| Design Complete | [Date] | |
| Development Start | [Date] | |
| Beta | [Date] | |
| GA | [Date] | |

---

## Open Questions

- [ ] [Question 1]
- [ ] [Question 2]

---

## Appendix

### Glossary
| Term | Definition |
|------|------------|
| [Term] | [Definition] |

### References
- [Link to related docs]
```

---

## PRD Sections Guide

### Problem Statement

**Good:**
- Specific user pain point
- Quantified impact
- Clear who experiences it

**Bad:**
- Vague ("users want X")
- Solution-focused ("we need to build Y")
- No user context

### Requirements

**Writing Good Requirements:**
- Testable (can verify completion)
- Unambiguous (one interpretation)
- Complete (covers edge cases)
- Consistent (no conflicts)

**Priority Levels:**
| Priority | Meaning | Ship Without? |
|----------|---------|---------------|
| Must | Required for launch | No |
| Should | Expected but deferrable | Yes, with explanation |
| Could | Nice to have | Yes |
| Won't | Excluded from scope | N/A |

### Success Metrics

**SMART Metrics:**
- **S**pecific: Clear what's measured
- **M**easurable: Quantifiable
- **A**chievable: Realistic target
- **R**elevant: Tied to goal
- **T**ime-bound: When measured

---

## PRD Review Checklist

Before approval:

- [ ] Problem clearly stated
- [ ] Goal is measurable
- [ ] Non-goals are explicit
- [ ] Requirements are testable
- [ ] User stories cover key personas
- [ ] Scope is clear (in/out)
- [ ] Success metrics defined
- [ ] Risks identified
- [ ] Dependencies mapped
- [ ] Open questions resolved or tracked

---

## Quick PRD (Lightweight)

For smaller features:

```markdown
# PRD: [Feature Name]

**Problem:** [One sentence]
**Goal:** [One sentence]
**Non-Goals:** [Bulleted list]

## Requirements
| # | Requirement | Priority |
|---|-------------|----------|
| 1 | [Requirement] | Must |

## Success Metric
[One key metric with target]

## Timeline
Ship by: [Date]
```

---

## Integration with Other Skills

| Skill | Integration |
|-------|-------------|
| **brainstorming** | PRD formalizes brainstormed ideas |
| **prioritize** | RICE scoring for PRD items |
| **stories** | PRD drives story creation |
| **acceptance** | Requirements → acceptance criteria |
| **estimate** | PRD scoped before estimation |
