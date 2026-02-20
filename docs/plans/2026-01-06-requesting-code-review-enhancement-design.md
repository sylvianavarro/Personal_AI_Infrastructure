# Requesting Code Review Enhancement Design

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Enhance the requesting-code-review skill with structured pre-merge review, severity classification, coverage categories, and human review flagging.

**Architecture:** Four-tier severity system, six core review categories with four optional domain-specific categories, review depth scaling based on change size, structured report template with explicit "Requires Human Review" section.

**Tech Stack:** Claude Code skills system, markdown templates, git integration

---

## Overview

**Current state:** `requesting-code-review` dispatches a code-reviewer subagent with Critical/Important/Minor severity levels. Works well but lacks systematic coverage categories and explicit human-review flagging.

**Enhanced design adds:**
1. **Severity tiers** — 🔴 BLOCKING, 🟡 SUGGESTION, 🔵 NITPICK, ⚪ QUESTION
2. **Coverage categories** — Compliance, Documentation, Quality, Testing, Security, Performance
3. **"Requires Human Review"** — Explicit flagging of architectural/business decisions
4. **Review depth scaling** — Quick (<100 lines), Standard (100-500), Deep (500+)

**Flow:**
```
Changes ready → Determine review depth → Run review →
Generate report with categories + severities →
Flag items for human judgment → Act on findings
```

**Key principle:** LLM catches mechanical issues (style, docs, obvious bugs). Humans focus on architecture, business logic, and ambiguous cases.

---

## Severity Classification System

### Four-Tier Model

| Level | Meaning | Action Required |
|-------|---------|-----------------|
| 🔴 **BLOCKING** | Must fix before merge | PR cannot proceed |
| 🟡 **SUGGESTION** | Recommended improvement | Fix now or create follow-up ticket |
| 🔵 **NITPICK** | Style/preference | Optional, author's discretion |
| ⚪ **QUESTION** | Needs human judgment | Human reviewer must decide |

### Classification Rules

**🔴 BLOCKING — Stop the PR:**
- Security vulnerabilities (injection, auth bypass, secrets exposed)
- Obvious bugs that will crash/corrupt
- Missing error handling on critical paths
- Breaking changes without migration
- Tests failing or missing for new functionality

**🟡 SUGGESTION — Should fix:**
- Missing docstrings on public APIs
- Test gaps (edge cases not covered)
- Error messages unhelpful for debugging
- Performance issues (N+1 queries, missing indexes)
- Code duplication that will cause drift

**🔵 NITPICK — Nice to have:**
- Naming could be clearer
- Comment could be more precise
- Slight style inconsistency
- Minor optimization opportunity

**⚪ QUESTION — Can't determine:**
- Architectural trade-offs (need domain context)
- Business logic correctness (need requirements knowledge)
- Backward compatibility decisions
- "Is this the right approach?" questions

---

## Coverage Categories

### Core Categories (Always Checked)

#### 1. COMPLIANCE
- Follows project patterns in CLAUDE.md / codebase conventions?
- Naming conventions followed?
- Error handling matches existing patterns?
- Commit messages follow format?

#### 2. DOCUMENTATION
- New functions have docstrings?
- Docstrings follow project style (Google/NumPy/JSDoc)?
- README updated if behavior changed?
- Breaking changes documented?
- Ticket/issue referenced where applicable?

#### 3. CODE QUALITY
- Logic errors or obvious bugs?
- Null/undefined handling?
- Edge cases considered?
- Magic numbers or hardcoded values?
- Functions under complexity threshold?
- DRY violations?

#### 4. TESTING
- New code has corresponding tests?
- Tests actually test logic (not just mocks)?
- Edge cases tested?
- Test names descriptive?
- Red-green verified for bug fixes?

#### 5. SECURITY
- Input validation present?
- No secrets or credentials in code?
- SQL injection prevention?
- XSS prevention (if frontend)?
- Auth/authz properly checked?
- Sensitive data not logged?

#### 6. PERFORMANCE
- N+1 query patterns?
- Unnecessary loops or iterations?
- Large objects held in memory?
- Missing pagination on list endpoints?
- Missing indexes (based on query patterns)?

### Domain-Specific Categories (Enable as Needed)

#### 7. API COMPATIBILITY (Backend/API projects)
- Breaking changes to existing endpoints?
- Versioning strategy followed?
- Response schema changes documented?
- Deprecation warnings added before removal?
- Rate limiting considered?
- OpenAPI/Swagger updated?

#### 8. MOBILE FRIENDLY (Frontend/Web projects)
- Responsive design maintained?
- Touch targets adequate (44px minimum)?
- Loading states for slow connections?
- Offline behavior considered?
- Bundle size impact acceptable?
- Accessibility (a11y) maintained?

#### 9. DATA INTEGRITY (Database/ETL projects)
- Migrations reversible?
- Data backfill strategy for existing records?
- Foreign key constraints appropriate?
- Indexes support new query patterns?
- Transaction boundaries correct?

#### 10. INTEGRATION HEALTH (External API projects)
- Rate limits respected?
- Retry/backoff implemented?
- Timeouts configured?
- Circuit breaker for failures?
- API changes monitored?

### Category Selection

**Default (all projects):** 1-6 (Compliance → Performance)

**Enable by project type:**
- Flask/FastAPI backend → +7 (API Compatibility)
- React/Next.js frontend → +8 (Mobile Friendly)
- Database migrations → +9 (Data Integrity)
- Productive/HubSpot integration → +10 (Integration Health)

---

## "Requires Human Review" Section

### What Gets Flagged

**Architectural Decisions:**
- New patterns introduced (is this the right abstraction?)
- Technology choices (should we use X library?)
- Trade-offs between approaches (performance vs. readability)
- Deviations from existing architecture

**Business Logic:**
- Domain correctness (does this match requirements?)
- Edge case behavior (what SHOULD happen here?)
- Calculation accuracy (is this formula right?)
- Workflow correctness (is this the right state machine?)

**Ambiguous Requirements:**
- Spec doesn't cover this case
- Multiple valid interpretations
- Implicit assumptions made

**Context-Dependent:**
- Backward compatibility impact
- User-facing behavior changes
- Cross-team dependencies
- Deployment sequencing

### Output Format

```markdown
## Requires Human Review

### 1. Architectural Decision
**File:** `src/core/scoring.py:78`
**Question:** New scoring uses recursive approach. Previous was iterative. Verify no stack issues with large inputs.
**Context:** [Why this matters]

### 2. Business Logic Verification
**File:** `src/api/pricing.py:45`
**Question:** Discount calculation assumes taxes apply after discount. Confirm this matches finance requirements.
**Context:** [What the code does]
```

**Key principle:** Better to flag and be wrong than miss something requiring judgment.

---

## Review Depth Scaling

### Quick Review (<100 lines changed)
**Time:** 1-2 minutes
**Focus:** Obvious issues only

```
Run quick review:
- Any obvious bugs?
- Documentation present?
- Tests included?
- Security red flags?

Output: One paragraph summary + blocking issues only
```

### Standard Review (100-500 lines)
**Time:** 5-10 minutes
**Focus:** Full category coverage

```
Run standard review:
- All 6 core categories
- Domain categories if applicable
- Severity classification for all findings
- "Requires Human Review" section

Output: Full structured report
```

### Deep Review (500+ lines or architectural changes)
**Time:** 15-20 minutes
**Focus:** Comprehensive analysis

```
Run deep review:
1. Summarize what this change does overall
2. Review each file individually
3. Check for integration issues between files
4. Verify test coverage proportional to change size
5. Map all architectural decisions
6. Flag ALL ambiguous items for human review

Output: Detailed report with file-by-file analysis
```

### Depth Selection

**Auto-detect based on:**
```bash
LINES_CHANGED=$(git diff --stat BASE..HEAD | tail -1 | grep -oE '[0-9]+' | head -1)

if [ $LINES_CHANGED -lt 100 ]; then
  DEPTH="quick"
elif [ $LINES_CHANGED -lt 500 ]; then
  DEPTH="standard"
else
  DEPTH="deep"
fi
```

**Override:** User can request specific depth regardless of size

---

## Implementation Tasks

### Task 1: Update SKILL.md

**Files:**
- Modify: `~/.claude/skills/requesting-code-review/SKILL.md`

Replace with enhanced version containing severity tiers, categories, depth scaling, and integration instructions.

### Task 2: Update code-reviewer.md

**Files:**
- Modify: `~/.claude/skills/requesting-code-review/code-reviewer.md`

Replace with enhanced subagent prompt with structured review process and report template generation.

### Task 3: Create review-categories.md

**Files:**
- Create: `~/.claude/skills/requesting-code-review/review-categories.md`

Reference doc for all 10 categories, classification rules, domain category selection guide.

### Task 4: Create report-template.md

**Files:**
- Create: `~/.claude/skills/requesting-code-review/report-template.md`

Copy-paste template for manual reviews, example filled-in report.

### Task 5: Verify Implementation

Run test review on recent changes to verify:
- Report generates with all sections
- Severity classification works correctly
- "Requires Human Review" items are appropriate

---

*Design validated: 2026-01-06*
