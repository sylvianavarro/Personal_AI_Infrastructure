---
name: Project Management Skills
pack-id: sylvianavarro-pm-skills-core-v1.0.0
version: 1.0.0
author: sylvianavarro
description: Nine workflow skills for complete PM lifecycle — PRDs, user stories, acceptance criteria, estimation, prioritization, sprint planning, status reports, RAID logs, and architectural decision records.
type: skill
purpose-type: [productivity, development]
platform: agnostic
dependencies: [danielmiessler-core-install-core-v1.0.0]
keywords: [pm, prd, stories, acceptance, estimation, prioritization, sprint, status, raid, decisions, planning, backlog]
---

<!-- NOTE: Pack icon generation is a TODO — see PR notes -->

# Project Management Skills

> Nine workflow skills for complete PM lifecycle — from PRD to sprint review

## Installation Prompt

You are receiving a PAI Pack - a modular upgrade for AI agent systems.

**What is PAI?** See: [PAI Project Overview](../README.md#what-is-pai)

**What is a Pack?** See: [Pack System](../README.md#the-journey-pai-v1x--v20)

This pack adds a complete project management skill set to your AI agent. Nine interconnected skills that cover the full PM lifecycle:

- **Planning**: PRDs, user stories, acceptance criteria
- **Estimation**: Story point estimation with complexity analysis
- **Prioritization**: RICE framework scoring
- **Execution**: Sprint planning, status reports
- **Governance**: RAID logs, architectural decision records

Each skill is a standalone markdown workflow that your AI invokes when the task matches. No infrastructure dependencies — just skill files that teach your agent PM best practices.

Please follow the installation instructions below to integrate this pack into your infrastructure.

---

## What's Included

| Component | File | Purpose |
|-----------|------|---------|
| PRD Skill | `skills/prd/SKILL.md` | Product requirements documents |
| Stories Skill | `skills/stories/SKILL.md` | User story creation |
| Acceptance Skill | `skills/acceptance/SKILL.md` | Acceptance criteria with Given-When-Then |
| Estimate Skill | `skills/estimate/SKILL.md` | Story point estimation |
| Prioritize Skill | `skills/prioritize/SKILL.md` | RICE framework prioritization |
| Sprint Skill | `skills/sprint/SKILL.md` | Sprint planning and tracking |
| Status Skill | `skills/status/SKILL.md` | Status report generation |
| RAID Skill | `skills/raid/SKILL.md` | Risk, Assumption, Issue, Dependency tracking |
| Decision Record Skill | `skills/decision-record/SKILL.md` | Architectural decision records |

**Summary:**
- **Files created:** 9 skill files
- **Hooks registered:** 0 (skill-based, no hooks needed)
- **Dependencies:** core-install (for skill routing)

---

## The Concept

### The Problem

AI agents are powerful coding assistants but weak project managers. Without structured PM workflows, they:

1. **Write vague requirements** — No template discipline leads to ambiguous PRDs
2. **Skip acceptance criteria** — Stories lack testable completion definitions
3. **Estimate inconsistently** — No framework means wildly varying estimates
4. **Lose project context** — No RAID tracking means risks and blockers go unrecorded
5. **Can't report status** — No structured format for stakeholder communication

### Who Needs This

- Solo developers managing their own projects
- Tech leads who use AI agents for PM tasks
- Anyone who wants their AI to follow PM best practices instead of winging it

---

## The Solution

This pack solves PM chaos through **structured workflow skills** — markdown templates that teach your AI agent exactly how to perform each PM task.

**Core Architecture:**

```
User Intent → Skill Router → PM Skill → Structured Output
                                ↓
                    Templates + Checklists + Integration Tables
```

Each skill contains:
- **When to Use** — Trigger conditions for the skill
- **Templates** — Structured output formats (PRD, story, RAID log, etc.)
- **Process** — Step-by-step workflow
- **Checklists** — Quality gates before completion
- **Integration Table** — How this skill connects to others

**The Key Insight:** PM skills are interconnected. A PRD feeds stories, stories get acceptance criteria, acceptance criteria inform estimates, estimates feed sprint planning, sprints generate status reports, and RAID logs track risks throughout. This pack preserves those connections through cross-skill integration tables.

## What Makes This Different

This sounds similar to "PM prompt templates" which also provide structured project management formats. What makes this approach different?

These aren't static templates — they're interconnected workflow skills with explicit routing, integration tables linking each skill to related skills, quality checklists, and process guidance. The AI doesn't just fill in blanks; it follows a methodology where each skill's output feeds the next skill's input, creating a complete PM lifecycle.

- Skills connect through explicit integration tables always
- Quality checklists prevent incomplete or vague output
- Process steps guide the AI through methodology
- Cross-skill references maintain project context continuously

---

## Installation

### Prerequisites

- **Claude Code** (or compatible AI agent with skill support)
- **core-install** (for skill directory structure and routing)

### Step 1: Create Skill Directories

```bash
SKILLS_DIR="${PAI_DIR:-$HOME/.config/pai}/skills"
mkdir -p "$SKILLS_DIR/prd"
mkdir -p "$SKILLS_DIR/stories"
mkdir -p "$SKILLS_DIR/acceptance"
mkdir -p "$SKILLS_DIR/estimate"
mkdir -p "$SKILLS_DIR/prioritize"
mkdir -p "$SKILLS_DIR/sprint"
mkdir -p "$SKILLS_DIR/status"
mkdir -p "$SKILLS_DIR/raid"
mkdir -p "$SKILLS_DIR/decision-record"
```

### Step 2.1: Create prd/SKILL.md

Create file: `$SKILLS_DIR/prd/SKILL.md`

```markdown
name: prd
description: Create Product Requirements Documents. Use when defining new features, documenting product decisions, or aligning stakeholders on scope.

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
```

### Step 2.2: Create stories/SKILL.md

Create file: `$SKILLS_DIR/stories/SKILL.md`

```markdown
name: stories
description: Create user stories from requirements. Use when breaking down features into implementable units or preparing backlog items.

# User Stories

Create clear, implementable user stories.

## When to Use

- Breaking down PRD into backlog items
- Preparing sprint work
- Clarifying requirements with team
- Creating tickets for development

---

## User Story Format

```
As a [user type],
I want to [action],
So that [benefit].
```

**Example:**
```
As a project manager,
I want to export reports to PDF,
So that I can share them with clients who don't have system access.
```

---

## Story Creation Process

### Step 1: Identify Users

```markdown
## User Types

| User Type | Description | Key Needs |
|-----------|-------------|-----------|
| [Type] | [Who they are] | [What they need] |
```

### Step 2: Extract Actions

From requirements, identify:
- What users need to DO
- What users need to SEE
- What users need to UNDERSTAND

### Step 3: Write Stories

```markdown
## User Stories

### Story 1: [Short title]

**As a** [user type]
**I want to** [action]
**So that** [benefit]

**Acceptance Criteria:**
- [ ] Given [context], when [action], then [result]
- [ ] Given [context], when [action], then [result]

**Notes:**
- [Technical considerations]
- [Edge cases]

---
```

---

## Story Components

### INVEST Criteria

Good stories are:

| Letter | Meaning | Check |
|--------|---------|-------|
| **I** | Independent | Can be built separately? |
| **N** | Negotiable | Details flexible? |
| **V** | Valuable | Delivers user value? |
| **E** | Estimable | Can size it? |
| **S** | Small | Fits in a sprint? |
| **T** | Testable | Can verify completion? |

### Acceptance Criteria (Given-When-Then)

```markdown
**Given** [precondition/context]
**When** [action/trigger]
**Then** [expected result]
```

**Examples:**
```markdown
Given I am logged in as an admin
When I click "Export PDF"
Then a PDF file downloads containing the current report

Given the report has no data
When I click "Export PDF"
Then I see a message "No data to export"
```

---

## Story Types

### Feature Stories
```
As a [user],
I want to [new capability],
So that [benefit].
```

### Bug Fix Stories
```
As a [user],
I want [broken thing] to work correctly,
So that [impact of bug being fixed].

**Current Behavior:** [What happens now]
**Expected Behavior:** [What should happen]
```

### Technical Stories
```
As a developer,
I want to [technical improvement],
So that [technical benefit/user impact].

**Technical Context:** [Why this matters]
```

### Spike Stories
```
As a team,
We need to investigate [unknown],
So that we can [decision/estimation].

**Timebox:** [X] hours/days
**Output:** [What we'll produce]
```

---

## Story Splitting

When a story is too big, split by:

| Strategy | Example |
|----------|---------|
| **Workflow steps** | "Create" → Create draft, Validate, Publish |
| **Business rules** | Handle valid input, Handle invalid input |
| **Data variations** | Support type A, Support type B |
| **Operations** | Create, Read, Update, Delete |
| **User types** | Admin version, User version |
| **Platforms** | Web, Mobile, API |

### Splitting Example

**Before (too big):**
```
As a user, I want to manage my profile
```

**After (split):**
```
1. As a user, I want to view my profile
2. As a user, I want to edit my basic info
3. As a user, I want to change my password
4. As a user, I want to upload a profile photo
5. As a user, I want to delete my account
```

---

## Story Template

```markdown
## [TICKET-###]: [Short Title]

### User Story
**As a** [user type]
**I want to** [action]
**So that** [benefit]

### Acceptance Criteria
- [ ] Given [context], when [action], then [result]
- [ ] Given [context], when [action], then [result]
- [ ] Given [context], when [action], then [result]

### Technical Notes
- [Implementation consideration]
- [Dependency]

### Out of Scope
- [What this story does NOT include]

### Design
[Link to mockups/wireframes if applicable]

### Estimate
[X] story points

### Dependencies
- [Blocker or related ticket]
```

---

## Common Mistakes

| Mistake | Example | Fix |
|---------|---------|-----|
| Too vague | "User can manage data" | Specify what "manage" means |
| Too technical | "Implement REST endpoint" | Focus on user value |
| No benefit | "I want to click button" | Add "so that" clause |
| Multiple stories | "Create and edit and delete" | Split into separate stories |
| No acceptance criteria | Story with no testable criteria | Add Given-When-Then |

---

## Story Review Checklist

- [ ] Follows As/I want/So that format
- [ ] User type is specific (not "user")
- [ ] Action is concrete and observable
- [ ] Benefit explains the "why"
- [ ] Has acceptance criteria
- [ ] Criteria use Given-When-Then
- [ ] Story is INVEST compliant
- [ ] Can complete in one sprint
- [ ] Edge cases considered

---

## Batch Story Generation

From a PRD or feature list:

```markdown
## Stories for: [Feature Name]

### Core Stories
| # | Title | User | Action | Priority |
|---|-------|------|--------|----------|
| 1 | [Title] | [Type] | [Action] | Must |
| 2 | [Title] | [Type] | [Action] | Should |

### Edge Case Stories
| # | Title | Scenario |
|---|-------|----------|
| 1 | [Title] | [Edge case] |

### Error Handling Stories
| # | Title | Error Condition |
|---|-------|-----------------|
| 1 | [Title] | [What can go wrong] |
```

---

## Integration with Other Skills

| Skill | Integration |
|-------|-------------|
| **prd** | PRD requirements → stories |
| **acceptance** | Stories → detailed acceptance criteria |
| **estimate** | Stories get point estimates |
| **sprint** | Stories populate sprint backlog |
```

### Step 2.3: Create acceptance/SKILL.md

Create file: `$SKILLS_DIR/acceptance/SKILL.md`

```markdown
name: acceptance
description: Write acceptance criteria for stories. Use when defining done for user stories or creating test cases.

# Acceptance Criteria

Write clear, testable acceptance criteria.

## When to Use

- Defining "done" for user stories
- Creating test case foundation
- Clarifying requirements with stakeholders
- QA handoff preparation

---

## Given-When-Then Format

```markdown
**Given** [precondition/initial context]
**When** [action/trigger]
**Then** [expected outcome]
```

**Extended format (with And):**
```markdown
**Given** [context]
  **And** [additional context]
**When** [action]
  **And** [additional action]
**Then** [outcome]
  **And** [additional outcome]
```

---

## Writing Process

### Step 1: Identify Scenarios

```markdown
## Story: [Story title]

### Happy Path
[Main success scenario]

### Variations
- [Alternative success path]
- [Edge case]

### Error Cases
- [What can go wrong]
- [Invalid input handling]
```

### Step 2: Write Criteria

For each scenario:

```markdown
### Scenario: [Name]

**Given** [setup state]
**When** [user action]
**Then** [expected result]

**Test Notes:** [How to verify]
```

### Step 3: Review Completeness

- [ ] Happy path covered
- [ ] All user types covered
- [ ] Error cases handled
- [ ] Edge cases included
- [ ] Performance criteria (if applicable)

---

## Acceptance Criteria Types

### Functional Criteria
```markdown
Given I am logged in as an admin
When I click "Delete User"
Then the user is removed from the system
  And I see a confirmation message
  And the action is logged in audit trail
```

### Validation Criteria
```markdown
Given I am on the registration form
When I enter an email without @ symbol
Then I see error "Please enter a valid email"
  And the form is not submitted
  And the email field is highlighted in red
```

### Performance Criteria
```markdown
Given 1000 users are in the system
When I search by name
Then results appear within 500ms
  And pagination shows max 50 results per page
```

### Security Criteria
```markdown
Given I am logged in as a regular user
When I try to access admin URL directly
Then I am redirected to 403 Forbidden page
  And the attempt is logged
```

### Accessibility Criteria
```markdown
Given I am using a screen reader
When I navigate to the login form
Then all form fields are properly labeled
  And focus order is logical
  And error messages are announced
```

---

## Criteria Templates

### CRUD Operations

**Create:**
```markdown
Given I am authorized to create [entity]
When I submit valid [entity] data
Then a new [entity] is created
  And I see confirmation message
  And I am redirected to [entity] detail page
```

**Read:**
```markdown
Given [entity] exists with ID [X]
When I navigate to [entity] detail page
Then I see all [entity] attributes displayed
  And related [entities] are shown
```

**Update:**
```markdown
Given I am viewing [entity] detail page
When I modify [field] and save
Then [entity] is updated with new [field]
  And I see success message
  And last modified date is updated
```

**Delete:**
```markdown
Given I am viewing [entity] with no dependencies
When I click Delete and confirm
Then [entity] is removed from system
  And I am redirected to [entity] list
  And [entity] no longer appears in searches
```

### Form Validation

```markdown
# Required Field
Given [field] is required
When I submit form with empty [field]
Then I see error "[Field] is required"
  And form is not submitted

# Format Validation
Given [field] requires [format]
When I enter invalid [format]
Then I see error "Please enter valid [format]"

# Length Validation
Given [field] max length is [N]
When I enter more than [N] characters
Then input is truncated to [N] characters
  Or I see error "[Field] must be [N] characters or less"
```

### Authentication/Authorization

```markdown
# Login Success
Given I have valid credentials
When I submit login form
Then I am authenticated
  And redirected to dashboard
  And session is created

# Login Failure
Given I have invalid credentials
When I submit login form
Then I see error "Invalid email or password"
  And I remain on login page
  And no session is created

# Authorization
Given I am logged in as [role]
When I access [protected resource]
Then I [can/cannot] view/edit the resource
```

---

## Common Patterns

### State Transitions
```markdown
Given [entity] is in [state A]
When [trigger action]
Then [entity] transitions to [state B]
  And [side effects occur]
  And [notifications sent]
```

### Pagination
```markdown
Given there are [X] results
When I view the list
Then I see [N] results per page
  And pagination shows [X/N] pages
  And I can navigate between pages
```

### Search/Filter
```markdown
Given [entities] exist with various [attribute]
When I filter by [attribute] = [value]
Then I see only [entities] matching [value]
  And result count is updated
  And filter is reflected in URL
```

---

## Criteria Quality Checklist

| Quality | Check |
|---------|-------|
| **Specific** | No ambiguous terms ("fast", "user-friendly") |
| **Testable** | Can write a test for it |
| **Complete** | All outcomes specified |
| **Independent** | Each criterion standalone |
| **Consistent** | No contradictions |

---

## Anti-Patterns

| Anti-Pattern | Example | Fix |
|--------------|---------|-----|
| Vague outcome | "User is satisfied" | Specify observable behavior |
| Implementation detail | "Database updated" | Focus on user-visible result |
| Missing context | "Button works" | Add Given clause |
| Compound criteria | "A and B and C happen" | Split into separate criteria |
| Untestable | "System is secure" | Specify testable security behavior |

---

## Output Format

```markdown
## Acceptance Criteria: [Story Title]

### Scenario 1: [Happy Path Name]
**Given** [context]
**When** [action]
**Then** [outcome]

### Scenario 2: [Variation Name]
**Given** [context]
**When** [action]
**Then** [outcome]

### Scenario 3: [Error Case Name]
**Given** [context]
**When** [invalid action]
**Then** [error handling]

---

**Coverage Check:**
- [x] Happy path
- [x] Edge cases
- [x] Error handling
- [x] Authorization
- [ ] Performance (N/A)
```

---

## Integration with Other Skills

| Skill | Integration |
|-------|-------------|
| **stories** | Stories receive acceptance criteria |
| **prd** | PRD requirements → acceptance criteria |
| **estimate** | Criteria complexity informs estimates |
| **test-patterns** | Criteria become test cases |
```

### Step 2.4: Create estimate/SKILL.md

Create file: `$SKILLS_DIR/estimate/SKILL.md`

```markdown
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
```

### Step 2.5: Create prioritize/SKILL.md

Create file: `$SKILLS_DIR/prioritize/SKILL.md`

```markdown
name: prioritize
description: Prioritize work using RICE framework. Use when deciding what to work on next, ordering backlogs, or making trade-off decisions.

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
```

### Step 2.6: Create sprint/SKILL.md

Create file: `$SKILLS_DIR/sprint/SKILL.md`

```markdown
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
```

### Step 2.7: Create status/SKILL.md

Create file: `$SKILLS_DIR/status/SKILL.md`

```markdown
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

### Daily Standup

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
```

### Step 2.8: Create raid/SKILL.md

Create file: `$SKILLS_DIR/raid/SKILL.md`

```markdown
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
```

### Step 2.9: Create decision-record/SKILL.md

Create file: `$SKILLS_DIR/decision-record/SKILL.md`

```markdown
name: decision-record
description: Document significant technical decisions. Use when making architectural choices, technology selections, or establishing patterns that affect system design.

# Decision Record

Document significant technical decisions for future reference.

## When to Use

- Choosing between technologies or frameworks
- Changing system architecture
- Establishing patterns that others must follow
- Deprecating existing approaches
- Making trade-offs with long-term implications

**Not for:**
- Implementation details
- Bug fixes
- Minor refactors
- Obvious choices with no alternatives

---

## Decision Record Template

```markdown
# DR-[NNN]: [Title]

**Status:** Proposed | Accepted | Deprecated | Superseded by DR-XXX
**Date:** YYYY-MM-DD
**Deciders:** [Names/roles involved]

## Context

[What is the situation? What forces are at play? What constraints exist?]

## Decision

[What is the decision? Be specific and unambiguous.]

**We will [do X].**

## Alternatives Considered

### Option A: [Name]
- **Pros:** [list]
- **Cons:** [list]
- **Why rejected:** [reason]

### Option B: [Name]
- **Pros:** [list]
- **Cons:** [list]
- **Why rejected:** [reason]

## Consequences

### Positive
- [benefit 1]
- [benefit 2]

### Negative
- [trade-off 1]
- [trade-off 2]

### Neutral
- [side effect that's neither good nor bad]

## Implementation Notes

[Any guidance for implementing this decision]

## Related Decisions

- [DR-XXX]: [relationship]
- [DR-YYY]: [relationship]
```

---

## Decision Record Process

### Step 1: Identify Decision Point

**Triggers:**
- "Should we use X or Y?"
- "How should we approach Z?"
- "This affects multiple components..."
- "We need to standardize on..."
- "Future developers will need to know why..."

### Step 2: Gather Context

```bash
# Check existing decision records
ls docs/decisions/ 2>/dev/null

# Check knowledge base for related decisions
cat ~/.claude/knowledge/decisions.md | grep -i "[topic]"

# Get next record number
ls docs/decisions/*.md 2>/dev/null | wc -l
```

### Step 3: Draft Record

| Section | Key Questions |
|---------|---------------|
| Context | What's the situation? Why decide now? |
| Decision | What specifically are we doing? |
| Alternatives | What else was considered? Why not? |
| Consequences | What changes because of this? |

### Step 4: Review and Approve

- [ ] Context accurately describes the situation
- [ ] Decision is clear and actionable
- [ ] Alternatives were genuinely considered
- [ ] Consequences are honest (including negatives)
- [ ] Stakeholders have reviewed

### Step 5: Record

```bash
# Create decision record file
mkdir -p docs/decisions
cat > docs/decisions/NNNN-title.md << 'EOF'
[Decision record content]
EOF

# Also add summary to knowledge base
# See knowledge-accumulation skill
```

---

## Record Lifecycle

```
Proposed → Accepted → [Active]
                  |
            Deprecated
                  |
            Superseded by DR-XXX
```

**Status Transitions:**
| From | To | When |
|------|-----|------|
| Proposed | Accepted | Team approves |
| Proposed | Rejected | Team rejects (don't delete, mark rejected) |
| Accepted | Deprecated | No longer applies |
| Accepted | Superseded | Replaced by new decision |

---

## Good vs Bad Records

### Good Record Characteristics
- Explains WHY, not just WHAT
- Acknowledges trade-offs honestly
- Lists alternatives actually considered
- Specific enough to be actionable
- Written for future reader who wasn't there

### Bad Record Patterns
| Pattern | Problem |
|---------|---------|
| "We decided to use React" | No context or alternatives |
| "After much discussion..." | Vague, no specifics |
| Only lists positives | Dishonest about trade-offs |
| Too detailed | Implementation, not architecture |
| Too vague | Can't be acted upon |

---

## Decision Categories

| Category | Examples |
|----------|----------|
| **Technology Selection** | Database, framework, language, library |
| **Architecture Pattern** | Microservices vs monolith, event-driven, CQRS |
| **Integration Approach** | API design, message format, auth mechanism |
| **Data Management** | Schema design, caching strategy, backup |
| **Security** | Auth flow, encryption, access control |
| **DevOps** | Deployment strategy, monitoring, scaling |
| **Standards** | Coding conventions, testing requirements |

---

## Quick Decision Record (Lightweight)

For smaller decisions that still warrant documentation:

```markdown
# DR-[NNN]: [Title]

**Status:** Accepted | **Date:** YYYY-MM-DD

**Context:** [1-2 sentences]

**Decision:** We will [specific choice].

**Why:** [1-2 sentences explaining rationale]

**Trade-offs:** [What we're giving up]
```

---

## Storage Locations

**Project-specific:**
```
docs/decisions/
├── 0001-use-postgresql.md
├── 0002-adopt-event-sourcing.md
├── 0003-api-versioning-strategy.md
└── template.md
```

**Cross-project (add to knowledge base):**
```bash
# For decisions that apply everywhere
echo "[Decision summary]" >> ~/.claude/knowledge/decisions.md
```

---

## Integration with Other Skills

| Skill | Integration |
|-------|-------------|
| **brainstorming** | Decision records formalize decisions from brainstorming |
| **writing-plans** | Plans reference relevant decisions |
| **knowledge-accumulation** | Records feed into decision log |
| **requesting-code-review** | Reviewer checks if decision record needed |

---

## Example Record

```markdown
# DR-0042: Use PostgreSQL for Primary Database

**Status:** Accepted
**Date:** 2024-01-15
**Deciders:** Engineering team

## Context

We need a primary database for our new application. Requirements:
- Relational data with complex queries
- ACID compliance for financial transactions
- JSON support for flexible metadata
- Strong ecosystem and tooling

## Decision

**We will use PostgreSQL 15+ as our primary database.**

## Alternatives Considered

### MySQL 8
- **Pros:** Familiar to team, good performance
- **Cons:** Weaker JSON support, less advanced features
- **Why rejected:** PostgreSQL's JSON capabilities better fit our hybrid data needs

### MongoDB
- **Pros:** Flexible schema, horizontal scaling
- **Cons:** No ACID transactions across documents, less query power
- **Why rejected:** Financial data requires strong consistency

## Consequences

### Positive
- Strong data integrity guarantees
- Excellent JSON/JSONB support for metadata
- Rich ecosystem (pg_stat, extensions)
- Team has experience

### Negative
- Vertical scaling limits
- More complex sharding if needed later
- Requires more upfront schema design

## Implementation Notes

- Use connection pooling (PgBouncer)
- Enable pg_stat_statements for query analysis
- Use JSONB, not JSON, for indexed access
```

---

## When NOT to Write a Decision Record

- The choice is obvious and uncontested
- It's easily reversible with no cost
- It only affects one file/component
- It's already covered by an existing record
- It's implementation detail, not architecture

**Rule of thumb:** If future developers won't wonder "why did they do it this way?", you probably don't need a decision record.
```

### Step 3: Verify Installation

```bash
SKILLS_DIR="${PAI_DIR:-$HOME/.config/pai}/skills"

# Check all 9 skill files exist
for skill in prd stories acceptance estimate prioritize sprint status raid decision-record; do
  if [ -f "$SKILLS_DIR/$skill/SKILL.md" ]; then
    echo "✓ $skill installed"
  else
    echo "✗ $skill MISSING"
  fi
done
```

---

## Example Usage

### Example 1: Creating a PRD

```
User: "Write a PRD for adding dark mode to our app"
AI: [Invokes prd skill, produces structured PRD with problem statement, requirements table, success metrics]
```

### Example 2: Sprint Planning Flow

```
User: "Plan the next sprint"
AI: [Invokes sprint skill]
  → Reviews backlog (stories skill output)
  → Checks estimates (estimate skill output)
  → Reviews risks (raid skill output)
  → Produces sprint plan with capacity allocation
```

### Example 3: Full PM Lifecycle

```
1. /prd → Define the feature
2. /stories → Break into user stories
3. /acceptance → Add acceptance criteria
4. /estimate → Size each story
5. /prioritize → RICE score the backlog
6. /sprint → Plan the sprint
7. /status → Report progress
8. /raid → Track risks and blockers
9. /decision-record → Document key decisions
```

---

## Configuration

No configuration required. Skills activate automatically when task intent matches skill descriptions.

---

## Customization

### Recommended Customization

**What to Customize:** Integration tables in each skill

**Why:** Your project may use different tools or workflows that should be referenced in the integration tables.

**Process:**
1. Review each skill's "Integration with Other Skills" table
2. Add references to your project-specific tools or workflows
3. Update trigger conditions in "When to Use" if your team has specific conventions

**Expected Outcome:** Skills reference your actual project context, making outputs more relevant.

---

## Credits

- **Author**: sylvianavarro — developed during production use of PAI system
- **Built on**: Daniel Miessler's PAI framework and Kai skill architecture

## Related Work

*None specified.*

## Works Well With

- **engineering-skills** — Engineering workflow skills that complement PM workflows
- **core-install** — Required foundation for skill routing

## Recommended

*None specified.*

## Relationships

### Parent Of
*None specified.*

### Child Of
*None specified.*

### Sibling Of
- engineering-skills (same author, complementary domain)

### Part Of Collection
*None specified.*

## Changelog

### 1.0.0 - 2026-02-06
- Initial release
- Nine PM workflow skills
- Cross-skill integration tables
- Complete PM lifecycle coverage
