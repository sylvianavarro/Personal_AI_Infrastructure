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
