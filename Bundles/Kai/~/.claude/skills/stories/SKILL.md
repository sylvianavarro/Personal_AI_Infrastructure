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
