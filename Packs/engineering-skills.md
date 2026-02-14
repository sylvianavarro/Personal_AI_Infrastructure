---
name: Engineering Skills
pack-id: sylvianavarro-engineering-skills-core-v1.0.0
version: 1.0.0
author: sylvianavarro
description: Eight workflow skills for engineering practices — smart commits, session catchup, knowledge accumulation, test suite repair, test patterns, API testing, React performance optimization, and UI accessibility review.
type: skill
purpose-type: [development, productivity, analysis]
platform: agnostic
dependencies: [danielmiessler-core-install-core-v1.0.0]
keywords: [engineering, testing, commits, performance, accessibility, react, api, knowledge, catchup, tdd]
---

<!-- NOTE: Pack icon generation is a TODO — see PR notes -->

# Engineering Skills

> Eight workflow skills for engineering best practices — from commits to performance optimization

## Installation Prompt

You are receiving a PAI Pack - a modular upgrade for AI agent systems.

**What is PAI?** See: [PAI Project Overview](../README.md#what-is-pai)

**What is a Pack?** See: [Pack System](../README.md#the-journey-pai-v1x--v20)

This pack adds engineering workflow skills to your AI agent:

- **Session Management**: Smart catchup to restore context at session start
- **Knowledge**: Accumulate institutional knowledge from every problem solved
- **Commits**: Pre-commit checks, conventional commits, documentation refresh
- **Testing**: Test patterns, test suite repair, API/GraphQL testing
- **Performance**: React/Next.js optimization with 100+ patterns
- **Accessibility**: UI review against WCAG and UX best practices

Each skill is a standalone markdown workflow. No infrastructure dependencies — just skill files that encode engineering best practices.

Please follow the installation instructions below to integrate this pack into your infrastructure.

---

## What's Included

| Component | File | Purpose |
|-----------|------|---------|
| Commit Skill | `skills/commit/SKILL.md` | Smart commits with pre-commit checks |
| Catchup Skill | `skills/catchup/SKILL.md` | Session context restoration |
| Knowledge Accumulation | `skills/knowledge-accumulation/SKILL.md` | Institutional knowledge capture |
| Fixing Test Suites | `skills/fixing-test-suites/SKILL.md` | Test suite repair patterns |
| Test Patterns | `skills/test-patterns/SKILL.md` | Testing conventions and organization |
| API Testing | `skills/api-testing/SKILL.md` | REST API testing + contract testing + GraphQL |
| React Performance | `skills/react-performance/SKILL.md` | React/Next.js optimization |
| UI Review | `skills/ui-review/SKILL.md` | Accessibility and UX audit |

**Summary:**
- **Files created:** 10 (8 main skills + 2 supplemental context files for api-testing)
- **Hooks registered:** 0 (skill-based, no hooks needed)
- **Dependencies:** core-install (for skill routing)

---

## The Concept

### The Problem

AI coding agents write code quickly but lack engineering discipline. Without structured workflows:

1. **Commits are messy** — No conventional format, missing pre-commit checks
2. **Context is lost** — Each session starts cold with no project state
3. **Knowledge evaporates** — Hard-won debugging insights disappear
4. **Tests break silently** — No systematic approach to test suite repair
5. **Performance degrades** — React anti-patterns accumulate unnoticed
6. **Accessibility ignored** — UI code ships without WCAG review

### Who Needs This

- Developers using AI agents for daily coding work
- Teams that want consistent engineering practices from AI-assisted development
- Anyone who wants their AI to follow engineering discipline, not just write code

---

## The Solution

Structured engineering skill files that encode best practices into repeatable workflows.

**Core Architecture:**

```
User Intent → Skill Router → Engineering Skill → Structured Action
                                    ↓
                        Checklists + Patterns + Integration Tables
```

**Skill Categories:**

| Category | Skills | Focus |
|----------|--------|-------|
| Session | catchup | Context restoration |
| Knowledge | knowledge-accumulation | Institutional memory |
| Quality | commit | Code quality at commit time |
| Testing | fixing-test-suites, test-patterns, api-testing | Test discipline |
| Performance | react-performance | Runtime optimization |
| Accessibility | ui-review | UI quality audit |

**The Key Insight:** Engineering discipline isn't about individual practices — it's about consistent application. These skills ensure your AI agent follows the same engineering standards every time, not just when you remember to ask.

## What Makes This Different

This sounds similar to "coding guidelines" which also provide engineering standards for AI agents. What makes this approach different?

These aren't static rules — they're active workflow skills that trigger contextually. When you commit, the commit skill runs pre-flight checks automatically. When you start a session, catchup restores context. When you fix a test, fixing-test-suites provides systematic debugging patterns. The AI doesn't just know the rules; it actively follows structured workflows at each engineering touchpoint.

- Skills trigger contextually based on task intent
- Each skill has checklists preventing incomplete work
- Knowledge accumulation creates permanent institutional memory
- Cross-skill integration tables maintain engineering coherence

---

## Installation

### Prerequisites

- **Claude Code** (or compatible AI agent with skill support)
- **core-install** (for skill directory structure and routing)

### Step 1: Create Skill Directories

```bash
SKILLS_DIR="${PAI_DIR:-$HOME/.config/pai}/skills"
mkdir -p "$SKILLS_DIR/commit"
mkdir -p "$SKILLS_DIR/catchup"
mkdir -p "$SKILLS_DIR/knowledge-accumulation"
mkdir -p "$SKILLS_DIR/fixing-test-suites"
mkdir -p "$SKILLS_DIR/test-patterns"
mkdir -p "$SKILLS_DIR/api-testing"
mkdir -p "$SKILLS_DIR/react-performance"
mkdir -p "$SKILLS_DIR/ui-review"
```

### Step 2.1: Create commit/SKILL.md

Create file: `$SKILLS_DIR/commit/SKILL.md`

```markdown
---
name: commit
description: Smart commit with pre-commit checks and documentation refresh. Use when ready to commit changes to ensure quality and documentation stay in sync.
---

# Smart Commit

Commit changes with quality checks and documentation updates.

## When to Use

- After completing a unit of work
- Before switching tasks
- When changes are ready for review
- After fixing issues from code review

---

## Project Setup: Use Husky for Pre-Commit Hooks

**Recommended:** Set up Husky to enforce quality gates automatically.

```bash
# Install
npm install -D husky
npx husky init

# Add pre-commit hook
echo "npm run typecheck && npm run lint && npm test" > .husky/pre-commit
```

**Why:** Prevents failed builds from forgotten typechecks. The hook runs automatically - no discipline required.

---

## Pre-Commit Checklist

Before committing, verify:

| Check | Command | Status |
|-------|---------|--------|
| Tests pass | `pytest` / `npm test` | ✅/❌ |
| Lint clean | `ruff check .` / `npm run lint` | ✅/❌ |
| Types check | `mypy .` / `npm run typecheck` | ✅/❌ |
| No secrets | `git diff --staged \| grep -E "(password\|secret\|api_key)"` | ✅/❌ |
| No debug code | Check for `console.log`, `print`, `debugger` | ✅/❌ |

**If any check fails, stop and fix before committing.**

---

## Commit Process

### Step 1: Pre-Commit Checks

```bash
# Run all checks
npm test && npm run lint && npm run typecheck
# or
pytest && ruff check . && mypy .

# Check for secrets (manual review output)
git diff --staged | grep -iE "(password|secret|api_key|token|credential)" || echo "No secrets detected"

# Check for debug code
git diff --staged | grep -E "(console\.log|print\(|debugger)" || echo "No debug code"
```

---

### Step 2: Analyze Staged Changes

```bash
git diff --staged --name-only
git diff --staged --stat
```

**Changed Files:**
| File | Type | Documentation Needed |
|------|------|---------------------|
| [path] | New/Modified | [What docs to update] |

---

### Step 3: Documentation Refresh

Based on changes, update relevant documentation:

**API Documentation** (if API files changed):
- [ ] Update API reference docs
- [ ] Update OpenAPI spec if exists
- [ ] Update request/response examples

**README Updates** (if significant changes):
- [ ] Verify README claims are accurate
- [ ] Update feature lists if needed
- [ ] Check setup instructions

**Configuration Documentation** (if config changed):
- [ ] Update .env.example
- [ ] Document new configuration options

**Code Documentation** (for new/modified code):
- [ ] Add/update docstrings (Google style)
- [ ] Add inline comments for complex logic
- [ ] Include ticket reference

---

### Step 4: Generate Commit Message

**Format:**
```
type(scope): description

- Detailed change 1
- Detailed change 2

Refs: TICKET-###
```

**Types:**
| Type | Use For |
|------|---------|
| `feat` | New feature |
| `fix` | Bug fix |
| `refactor` | Code restructuring (no behavior change) |
| `docs` | Documentation only |
| `test` | Test additions/changes |
| `chore` | Maintenance tasks |
| `perf` | Performance improvement |
| `security` | Security fix |
| `style` | Formatting only (no code change) |

**Rules:**
- Subject < 50 chars
- Imperative mood ("add" not "added")
- Reference ticket when applicable
- Body explains WHY, not just WHAT

---

### Step 5: Execute Commit

```bash
# Stage documentation updates alongside code
git add [doc files]

# Review final diff
git diff --staged

# Commit
git commit -m "$(cat <<'EOF'
type(scope): description

- Change 1
- Change 2

Refs: TICKET-###

Co-Authored-By: Claude <noreply@anthropic.com>
EOF
)"
```

---

### Step 6: Post-Commit Verification

```bash
git log -1 --stat
git show --name-only
```

**Verify:**
- [ ] Commit message follows convention
- [ ] All intended files included
- [ ] Documentation updated alongside code
- [ ] No unintended files committed
- [ ] Commit compiles and tests pass

---

## Documentation Triggers

| Changed Files | Documentation Action |
|---------------|---------------------|
| `src/api/`, `/routes/` | Update API docs, OpenAPI spec |
| `README.md` parent files | Verify README accuracy |
| `.env`, config files | Update .env.example |
| New functions/classes | Add docstrings |
| Complex logic | Add inline comments |
| User-facing changes | Update CHANGELOG |

---

## Commit Message Examples

**Feature:**
```
feat(auth): add OAuth2 login support

- Add Google OAuth2 provider
- Store tokens securely in session
- Add logout endpoint

Refs: TICKET-123
```

**Bug Fix:**
```
fix(api): handle null response from external service

- Add null check before parsing response
- Return empty array instead of crashing
- Add test for null case

Refs: TICKET-456
```

**Refactor:**
```
refactor(db): extract query builders to separate module

- Move complex queries from models to query_builders/
- No behavior change, just organization
- Improves testability

Refs: TICKET-789
```

**Documentation:**
```
docs(api): update authentication examples

- Fix outdated token format in examples
- Add OAuth2 flow documentation
- Update Postman collection
```

---

## Quick Commit (When Checks Already Passed)

```bash
# Quick commit for small changes
git add -A && git commit -m "fix(scope): brief description

Refs: TICKET-###"
```

---

## Integration with Other Skills

| Skill | Integration |
|-------|-------------|
| **fixing-test-suites** | Run tests before commit |
| **knowledge-accumulation** | Document learnings in commit or knowledge base |

---

## Anti-Patterns

**Don't:**
- Commit broken code
- Mix unrelated changes in one commit
- Use vague messages ("fix stuff", "updates", "wip")
- Commit secrets or credentials
- Skip documentation updates
- Commit without running tests

**Do:**
- Make atomic commits (one logical change)
- Write clear, descriptive messages
- Reference tickets in every commit
- Update docs in same commit as code
- Run checks before committing
```

### Step 2.2: Create catchup/SKILL.md

Create file: `$SKILLS_DIR/catchup/SKILL.md`

```markdown
---
name: catchup
description: Restore context at session start. Use when starting a new session, returning to work after a break, or needing to understand current project state quickly.
---

# Catchup — Restore Context

Get up to speed on recent changes and current state quickly.

## When to Use

- Starting a new Claude Code session
- Returning after a break (hours, days, weeks)
- Switching between projects
- Before making changes to unfamiliar code
- After pulling latest changes

---

## Quick Catchup (30 seconds)

```bash
git status && git log --oneline -5 && git stash list
```

---

## Full Catchup Process

### Step 1: Repository State

```bash
# Current branch and status
git status
git branch -v

# Recent commits (last 15)
git log --oneline -15

# What's changed recently
git diff HEAD~10 --stat

# Any stashed work
git stash list
```

**Summary:**
| Item | Value |
|------|-------|
| Current branch | [branch] |
| Commits ahead of main | [X] |
| Uncommitted changes | Yes/No |
| Stashed work | [X] items |

---

### Step 2: Check Knowledge Base

**Before diving into code, check what we know:**

```bash
# Project knowledge
ls docs/knowledge/ 2>/dev/null

# Global knowledge
ls $SKILLS_DIR/../knowledge/
```

**Review:**
- [ ] Recent Decision Log entries
- [ ] Known Gotchas for this area
- [ ] Solved Problems that might be relevant
- [ ] Integration Notes if working with external systems

---

### Step 3: Review Recent Changes

```bash
# Last 10 commits across all branches
git log --oneline -10 --all

# Files changed in last 5 commits
git diff HEAD~5 --stat

# What changed today
git log --since="midnight" --oneline

# My recent commits
git log --author="$(git config user.name)" --oneline -10
```

**Key Changes:**
| File | Change Type | Significance |
|------|-------------|--------------|
| [path] | Added/Modified/Deleted | [Brief note] |

---

### Step 4: Check for In-Progress Work

```bash
# Open branches not merged to main
git branch -a --no-merged main

# Work in progress files
ls -la *-progress.md 2>/dev/null
ls -la docs/*-progress.md 2>/dev/null
```

**Active Work:**
| Branch | Ticket | Status | Last Activity |
|--------|--------|--------|---------------|
| [branch] | [TICKET-###] | In Progress/Stalled | [date] |

---

### Step 5: Sync with Remote

```bash
# Fetch all changes
git fetch --all

# Check if behind
git log HEAD..origin/main --oneline

# Check for conflicts (dry run)
git merge origin/main --no-commit --no-ff 2>/dev/null && git merge --abort
```

---

### Step 6: Generate Summary

**Catchup Summary**

**Repository:** [name]
**As of:** [timestamp]

**Current State:**
- Branch: [current branch]
- Status: Clean / Has changes / Has stashed work
- Last commit: [date] - [message]

**Recent Activity (Last 5 commits):**
1. [commit summary]
2. [commit summary]
3. [commit summary]

**Work in Progress:**
- Active ticket: [TICKET-###] (if applicable)
- Branch purpose: [description]
- Completion: ~[X]% estimated

**Knowledge Base Highlights:**
- Recent decisions: [any relevant]
- Gotchas in this area: [any relevant]

**Recommended Next Steps:**
1. [Next action]
2. [Next action]

---

## Context-Specific Catchup

### Returning to Feature Work
```bash
git fetch origin main
git log HEAD..origin/main --oneline  # See what's new
git rebase origin/main               # Sync up (if no conflicts)
```

### Starting Fresh Session
```bash
git fetch --all
git status
git stash list
```

### Reviewing Someone Else's Work
```bash
git checkout [branch-name]
git log main..[branch-name] --oneline
git diff main...[branch-name]
```

### After Long Absence
```bash
# Full refresh
git fetch --all --prune
git log --oneline -20 --all
git status

# Check what major things changed
git diff HEAD~20 --stat | head -30

# Review any new knowledge entries
cat ~/projects/myapp/docs/knowledge/decisions.md | tail -50
```

---

## Catchup Checklist

- [ ] Understand current branch and its purpose
- [ ] Review recent commits
- [ ] Check for uncommitted/stashed work
- [ ] Sync with remote (fetch)
- [ ] Check knowledge base for relevant context
- [ ] Identify any blockers
- [ ] Know next steps

---

## Integration with Other Skills

| Skill | When to Use After Catchup |
|-------|---------------------------|
| **knowledge-accumulation** | If you discover something worth documenting |
| **commit** | If resuming work that needs committing |

---

## Quick Commands Reference

```bash
# 30-second catchup
git status && git log --oneline -5

# Full catchup
git fetch -a && git status && git log --oneline -10 && git stash list

# What changed today
git log --since="midnight" --oneline

# My recent commits
git log --author="$(git config user.name)" --oneline -10

# See what's on a branch
git log main..[branch] --oneline
```

---

Ready to continue where you left off.
```

### Step 2.3: Create knowledge-accumulation/SKILL.md

Create file: `$SKILLS_DIR/knowledge-accumulation/SKILL.md`

```markdown
---
name: knowledge-accumulation
description: Capture and reuse institutional knowledge. Use when solving tricky bugs, making architectural decisions, discovering integration quirks, or establishing reusable patterns. Every problem solved once is solved forever.
---

# Knowledge Accumulation

Capture and reuse institutional knowledge. Every problem solved once is solved forever.

**Core principle:** Document as you work, not after.

## When to Use

**Proactively invoke when:**
- Solving a tricky bug (→ Solved Problems Archive)
- Making an architectural decision (→ Decision Log)
- Discovering an integration quirk (→ Integration Notes)
- Establishing a reusable pattern (→ Code Patterns Registry)
- Finding a "gotcha" others will hit (→ Known Gotchas)

**Query when:**
- Starting work in unfamiliar area ("Any gotchas here?")
- Debugging ("Has this been solved before?")
- Integrating with external system ("What do we know about X API?")
- Making a decision ("Have we decided this before?")

---

## Knowledge Types

| Type | Purpose | When to Add |
|------|---------|-------------|
| Decision Log | Why we chose X over Y | After architectural decisions |
| Known Gotchas | Pitfalls that bite people | After getting bitten |
| Code Patterns | Reusable solutions | After establishing pattern |
| Solved Problems | Past bug fixes | After solving tricky bugs |
| Integration Notes | External system quirks | After integration learning |

---

## Decision Log

Track architectural and implementation decisions with context.

**Format:**
```markdown
### [Date] [Decision Title]

**Decision:** What we decided
**Context:** Why we needed to decide
**Alternatives Considered:**
- Option A: [description] — rejected because [reason]
- Option B: [description] — rejected because [reason]
**Ticket:** TICKET-### (if applicable)
**Revisit When:** [conditions that would change this decision]
```

**Example:**
```markdown
### 2026-01-06 Use Redis for Session Storage

**Decision:** Redis for session storage instead of in-memory or PostgreSQL
**Context:** Need distributed session state across multiple pods
**Alternatives Considered:**
- In-memory: Rejected — doesn't scale horizontally, sessions lost on pod restart
- PostgreSQL: Rejected — too slow for session reads on every request
**Ticket:** TICKET-456
**Revisit When:** If we move to single-instance deployment or adopt JWT
```

---

## Known Gotchas

Pitfalls that have bitten someone. Save others the pain.

**Categories:** Database, API, Frontend, Backend, DevOps, Testing, Security

**Format:**
```markdown
### [Category] [Short Title]

**Symptom:** What you see when you hit this
**Cause:** Why it happens
**Solution:** How to fix/avoid
**Discovered:** TICKET-### or date
```

**Example:**
```markdown
### Database: Connection Pool Exhaustion

**Symptom:** `QueuePool limit reached` errors under load
**Cause:** Uncommitted transactions holding connections
**Solution:** Always use `with db.session()` context manager, never manual commit/rollback
**Discovered:** TICKET-234, 2026-01-05
```

---

## Code Patterns Registry

Reusable patterns with context on when/why to use them.

**Format:**
```markdown
### Pattern: [Name]

**Use when:** [scenario]
**Location:** [file path to reference implementation]
**Example:**
```[language]
# code example
```
**Why this pattern:** [rationale]
**Anti-pattern:** [what NOT to do]
```

**Example:**
```markdown
### Pattern: Async Database Operations

**Use when:** Any database operation in async endpoints
**Location:** `src/db/async_session.py`
**Example:**
```python
from src.db import async_session

async def get_user(user_id: UUID) -> User:
    async with async_session() as session:
        result = await session.execute(
            select(User).where(User.id == user_id)
        )
        return result.scalar_one_or_none()
```
**Why this pattern:** Prevents connection leaks, handles rollback on exception
**Anti-pattern:** Manual session.close() without context manager
```

---

## Solved Problems Archive

Tricky bugs and their solutions. Check before debugging.

**Format:**
```markdown
### [Problem Title]

**Symptoms:** What we observed
**Root Cause:** Why it happened
**Solution:** What we did
**Files Changed:** [list]
**Ticket:** TICKET-###
**Date:** YYYY-MM-DD
```

**Example:**
```markdown
### Flaky Tests in CI Due to Database State

**Symptoms:** Tests pass locally, fail randomly in CI
**Root Cause:** Tests sharing database state, order-dependent
**Solution:**
1. Added `pytest-xdist` with `--dist loadfile`
2. Each test file gets isolated transaction that rolls back
3. See `conftest.py` fixture `db_session`
**Files Changed:** conftest.py, pytest.ini
**Ticket:** TICKET-234
**Date:** 2026-01-05
```

---

## Integration Notes

External system quirks and learnings.

**Format:**
```markdown
## [System Name] Integration

**Auth:** How authentication works
**Base URL:** API endpoint
**Rate Limits:** Limits and how we handle them
**Pagination:** How to paginate (cursor, offset, etc.)
**Gotchas:**
- [Undocumented quirk 1]
- [Undocumented quirk 2]
**Our Wrapper:** Path to our client code
**Contact:** Who to ask for help
**Last Updated:** YYYY-MM-DD
```

**Example:**
```markdown
## Example API Integration

**Auth:** Bearer token in header, tokens expire every 24h
**Base URL:** https://api.example.io/api/v2
**Rate Limits:** 100/min standard, 1000/min enterprise
**Pagination:** Uses `offset` and `limit`, max 100 per page
**Gotchas:**
- `factors` endpoint returns different schema than documented
- Returns 429 even under rate limit — use exponential backoff
- Allocation values are 0-1 scale, not 0-100
**Our Wrapper:** `src/integrations/example/client.py`
**Contact:** api-support@example.io
**Last Updated:** 2026-01-06
```

---

## Adding Knowledge

### Triggers — When to Add

| Event | Action |
|-------|--------|
| Solved tricky bug | Add to Solved Problems Archive |
| Made architectural decision | Add to Decision Log |
| Got bitten by gotcha | Add to Known Gotchas |
| Established reusable pattern | Add to Code Patterns Registry |
| Learned external system quirk | Add to Integration Notes |
| Spent >30 min debugging | Document regardless of cause |

### How to Add

**During work (preferred):**
```
"Adding to [Knowledge Type]: [content]"
```

**Post-hoc:**
```
"Document what we learned:
- Problem: [X]
- Solution: [Y]
- Add to: [Knowledge Type]"
```

---

## Storage Locations

### Project-Specific Knowledge
```
project/
└── docs/
    └── knowledge/
        ├── decisions.md
        ├── gotchas.md
        ├── patterns.md
        ├── solved-problems.md
        └── integrations/
            ├── example-api.md
            └── hubspot-api.md
```

### Cross-Project Knowledge
```
$SKILLS_DIR/../knowledge/
├── decisions.md
├── gotchas.md
├── patterns.md
└── solved-problems.md
```

### Where to Store (Decision Criteria)

| Store in... | When... |
|-------------|---------|
| **Project-specific** | Pattern only applies to this codebase, uses project-specific libraries, or relates to project architecture |
| **Cross-project** | Pattern applies to any project using this technology (Python, React, Flask, etc.) |

**Rule of thumb:** If you'd want this knowledge when starting a new project with the same tech stack, put it in cross-project.

---

## Querying Knowledge

### Before Starting Work
```
Check knowledge base for [area]:
- Any known gotchas?
- Relevant patterns?
- Past decisions?
```

### When Debugging
```
Check Solved Problems Archive:
- Similar symptoms seen before?
- Known root causes in this area?
```

### When Integrating
```
Check Integration Notes for [system]:
- Auth requirements?
- Rate limits?
- Known quirks?
```

### When Making Decisions
```
Check Decision Log:
- Have we decided this before?
- What was the context?
- Has context changed?
```

---

## Integration with Other Skills

| Skill | Integration |
|-------|-------------|
| **fixing-test-suites** | Check Solved Problems BEFORE investigating; add AFTER solving |
| **catchup** | Review knowledge base during session catchup |
| **commit** | Document learnings at commit time |

---

## Quick Reference

**Add knowledge:**
```
"Add to [Decision Log | Gotchas | Patterns | Solved Problems | Integration Notes]:
[formatted content]"
```

**Query knowledge:**
```
"Check [knowledge type] for [topic]"
"Any gotchas for [area]?"
"Has [problem] been solved before?"
"What do we know about [integration]?"
```

**Principle:** If you spent time learning it, document it. Future you will thank present you.

---

## Maintenance

### Review Cadence

| Knowledge Type | Review Frequency | Why |
|----------------|------------------|-----|
| Integration Notes | Quarterly | APIs change, rate limits update |
| Decisions | Annually | Context may have changed |
| Gotchas | When hit again | Verify still applies |
| Patterns | When using | Confirm still best practice |
| Solved Problems | When similar issue | Check if solution still works |

### Staleness Indicators

- Entry older than 1 year without "Last Updated"
- Referenced files no longer exist
- Technology/library no longer in use
- Contradicts newer entry

### Handling Outdated Knowledge

```
IF entry is outdated:
  - Update with current information, OR
  - Mark as deprecated with note, OR
  - Move to archived/ directory

NEVER just delete - context may be valuable for understanding history
```

### Conflict Resolution

If project-specific conflicts with cross-project:
1. Project-specific wins (local override)
2. Document why in project-specific entry
3. Consider if cross-project needs updating
```

### Step 2.4: Create fixing-test-suites/SKILL.md

Create file: `$SKILLS_DIR/fixing-test-suites/SKILL.md`

```markdown
---
name: fixing-test-suites
description: Use when fixing failing tests, especially auth mocking issues in Flask/pytest or React/Jest service mocking patterns
---

# Fixing Test Suites

## Overview

Patterns for fixing common test failures in Flask/pytest and React/Jest test suites.

**Core principle:** Test failures usually stem from mock timing, import order, or assertion mismatches - not the code under test.

## When to Use

- Fixing auth-related test failures (401 responses in tests)
- Fixing API/service mock issues in React tests
- Tests timing out waiting for elements
- Tests failing due to text not matching exactly

## Flask/Pytest Auth Mocking

### Problem: Tests return 401 Unauthorized

The `require_auth` decorator is applied at import time. Patching after import doesn't work.

### Solution: Patch at module level BEFORE import

```python
# test_my_feature.py
import pytest
from unittest.mock import patch

# Patch BEFORE importing the blueprint
_auth_patch = patch("api.middleware.auth.AUTH_SECRET_KEY", None)
_auth_patch.start()

# NOW import - decorator sees AUTH_SECRET_KEY as None and skips auth
from api.routes.resources import resources_bp

# Stop patch after import to avoid affecting other test files
_auth_patch.stop()


@pytest.fixture
def bypass_auth():
    """Keep auth bypassed during test execution."""
    with patch("api.middleware.auth.AUTH_SECRET_KEY", None):
        yield


@pytest.fixture
def app(bypass_auth):
    """Create test Flask app with auth bypassed."""
    from flask import Flask
    app = Flask(__name__)
    app.config["TESTING"] = True
    app.register_blueprint(resources_bp)
    return app


@pytest.fixture
def client(app):
    return app.test_client()
```

### Key Points

1. **Module-level patch**: Must happen BEFORE any imports that use the decorator
2. **Stop after import**: Prevents leaking to other test files
3. **Fixture chain**: `bypass_auth` → `app` → `client` ensures patch active during tests
4. **Use `yield`**: Keeps context manager active for test duration

### Anti-Pattern: Patching the decorator location

```python
# WRONG - decorator already applied when resources_bp loaded
with patch("api.middleware.auth.require_auth", lambda f: f):
    from api.routes.resources import resources_bp  # Too late!
```

## React/Jest Service Mocking

### Problem: API mocks not applied, tests timeout

Jest module mocks must use factory functions and be set up before component import.

### Solution: Explicit mock factory + inline mock setup

```javascript
// At top of test file - explicit mock factory
jest.mock("../../services/api", () => ({
  getClientEngagementsUtil: jest.fn(),
  getSalesPipelineDealsCount: jest.fn(),
}));

// In each test - set mock return value BEFORE render
test("displays data correctly", async () => {
  const { getClientEngagementsUtil } = require("../../services/api");
  getClientEngagementsUtil.mockResolvedValue(mockData);

  render(<Component />);

  await waitFor(() => {
    expect(screen.getByText(/expected text/)).toBeInTheDocument();
  });
});
```

### Key Points

1. **Factory function**: `jest.mock("path", () => ({ ... }))` - returns mock object
2. **Inline require**: Get mock in test, set return value before render
3. **Clear mocks**: Use `beforeEach(() => jest.clearAllMocks())`
4. **Order matters**: Mock setup → render → assertions

### Anti-Pattern: Auto-mock without factory

```javascript
// WRONG - jest.mock without factory may not mock all exports
jest.mock("../../services/api");

// Then in test
api.getClientEngagementsUtil.mockResolvedValue(data);  // May be undefined!
```

## Common Assertion Fixes

### Problem: Text appears but getByText fails

Component combines text: `"Project 1 / Project 1"` but test looks for `"Project 1"`

### Solution: Use regex or combined text

```javascript
// Option 1: Regex match
expect(screen.getByText(/Project 1/)).toBeInTheDocument();

// Option 2: More specific regex
expect(screen.getByText(/Project 1 \//)).toBeInTheDocument();

// Option 3: Exact combined text
expect(screen.getByText("Project 1 / Project 1")).toBeInTheDocument();
```

### Problem: Text appears multiple times

Summary cards and table both show "91.4%"

### Solution: Use getAllByText with length check

```javascript
// Check text appears at least once
expect(screen.getAllByText("91.4%").length).toBeGreaterThan(0);

// Or scope to specific container
const table = screen.getByRole("table");
expect(within(table).getByText("91.4%")).toBeInTheDocument();
```

### Problem: Element not displayed but test expects it

Company name used for filtering but not rendered in table

### Solution: Test actual behavior, not assumed behavior

```javascript
// WRONG - assumes company name is displayed
await waitFor(() => {
  expect(screen.getByText("Test Company")).toBeInTheDocument();
});

// RIGHT - check for what IS displayed
await waitFor(() => {
  expect(screen.getByText(/Test Project Alpha/)).toBeInTheDocument();
});
```

## Debugging Test Failures

### Step 1: Check what's actually rendered

```javascript
// Print DOM to console
screen.debug();

// Or with specific element
screen.debug(screen.getByRole("table"));
```

### Step 2: Check mock was called

```javascript
expect(mockFunction).toHaveBeenCalled();
expect(mockFunction).toHaveBeenCalledWith(expectedArgs);
console.log(mockFunction.mock.calls);
```

### Step 3: Check for async timing

```javascript
// Increase timeout for slow operations
await waitFor(() => {
  expect(screen.getByText("loaded")).toBeInTheDocument();
}, { timeout: 5000 });
```

## CI/CD Considerations

### Tests must not have `continue-on-error: true`

```yaml
# WRONG - tests don't block deployment
- name: Run tests
  continue-on-error: true
  run: npm test

# RIGHT - tests block deployment
- name: Run tests
  run: npm test
```

### Environment variables in CI

```yaml
env:
  TESTING: "true"  # Enables test mode in backend
  AUTH_SECRET_KEY: ""  # Empty = auth bypassed
```

## Verification Checklist

Before marking test fix complete:

- [ ] All tests pass locally
- [ ] No `continue-on-error: true` in CI workflow
- [ ] Mock cleanup in `beforeEach`/`afterEach`
- [ ] Module-level patches stopped after import
- [ ] Assertions match actual DOM output
- [ ] Async operations use `waitFor`

## Related Skills

- `test-patterns` - Testing conventions and organization
- `api-testing` - API-specific testing patterns
- `knowledge-accumulation` - Document test fixes for future reference
```

### Step 2.5: Create test-patterns/SKILL.md

Create file: `$SKILLS_DIR/test-patterns/SKILL.md`

```markdown
---
name: test-patterns
description: Use when writing tests, organizing test suites, creating mocks/fixtures, or establishing testing conventions for a project.
---

# Test Patterns

Industry best practices for writing maintainable, reliable tests.

## When to Use

- Setting up test structure for a project
- Writing new test suites
- Refactoring flaky or brittle tests
- Creating mocks, stubs, or fixtures
- Reviewing test code quality

---

## Core Principles

### 1. FIRST Properties (Robert Martin)

| Property | Meaning | Violation |
|----------|---------|-----------|
| **F**ast | Tests run quickly | Slow tests don't get run |
| **I**ndependent | No test depends on another | Order-dependent failures |
| **R**epeatable | Same result every time | Flaky tests erode trust |
| **S**elf-validating | Pass/fail, no manual check | Subjective interpretation |
| **T**imely | Written at the right time | Tests after = coverage gaps |

### 2. Test Pyramid (Mike Cohn)

```
        /\
       /  \  E2E (Few)
      /----\
     /      \  Integration (Some)
    /--------\
   /          \  Unit (Many)
  --------------
```

| Level | Speed | Scope | Count |
|-------|-------|-------|-------|
| Unit | Fast (ms) | Single function/class | 70% |
| Integration | Medium (s) | Multiple components | 20% |
| E2E | Slow (s-min) | Full user flow | 10% |

---

## AAA Pattern (Arrange-Act-Assert)

**Industry standard structure for every test.**

```typescript
test('calculates order total with discount', () => {
  // Arrange - Set up test data and dependencies
  const order = createOrder({ items: [{ price: 100 }] });
  const discount = { percent: 10 };

  // Act - Execute the behavior being tested
  const total = calculateTotal(order, discount);

  // Assert - Verify the expected outcome
  expect(total).toBe(90);
});
```

### Rules

- **One Act per test** - Multiple acts = multiple tests
- **Minimal Arrange** - Only what's needed for this test
- **Specific Assert** - Test one behavior, not everything

---

## Test Doubles (Gerard Meszaros)

| Type | Purpose | When to Use |
|------|---------|-------------|
| **Dummy** | Fill parameter lists | Never actually used |
| **Stub** | Provide canned answers | Control indirect inputs |
| **Spy** | Record calls for verification | Verify interactions |
| **Mock** | Verify expectations | Test collaboration |
| **Fake** | Working implementation | Simpler than real (in-memory DB) |

### Stub Example

```typescript
// Stub: Returns canned data, no verification
const userService = {
  getUser: jest.fn().mockReturnValue({ id: 1, name: 'Test' })
};

test('displays user name', () => {
  render(<Profile userService={userService} />);
  expect(screen.getByText('Test')).toBeInTheDocument();
});
```

### Mock Example

```typescript
// Mock: Verifies interactions
const emailService = { send: jest.fn() };

test('sends welcome email on registration', async () => {
  await registerUser({ email: 'test@example.com' }, emailService);

  expect(emailService.send).toHaveBeenCalledWith({
    to: 'test@example.com',
    template: 'welcome'
  });
});
```

### When to Use What

| Scenario | Use |
|----------|-----|
| Need specific return value | Stub |
| Need to verify method called | Mock/Spy |
| External service (API, DB) | Fake or Stub |
| Just filling a required param | Dummy |

---

## Test Organization

### File Structure

```
src/
├── components/
│   └── Button/
│       ├── Button.tsx
│       └── Button.test.tsx     # Co-located
├── services/
│   └── UserService.ts
└── __tests__/                   # Or separate
    └── services/
        └── UserService.test.ts
```

**Co-location preferred** - Tests next to implementation.

### Naming Conventions

```typescript
// File: [Component].test.ts or [Component].spec.ts

// Describe blocks: noun (what)
describe('UserService', () => {
  describe('createUser', () => {

    // Test names: should + behavior
    it('should create user with valid data', () => {});
    it('should throw error when email exists', () => {});
    it('should hash password before saving', () => {});
  });
});
```

### Given-When-Then (BDD Style)

```typescript
describe('Shopping Cart', () => {
  describe('given a cart with items', () => {
    describe('when applying a valid coupon', () => {
      it('then reduces total by coupon amount', () => {});
    });

    describe('when applying an expired coupon', () => {
      it('then shows error message', () => {});
      it('then keeps original total', () => {});
    });
  });
});
```

---

## Fixtures and Factories

### Factory Pattern (Recommended)

```typescript
// factories/user.ts
export function createUser(overrides: Partial<User> = {}): User {
  return {
    id: faker.string.uuid(),
    email: faker.internet.email(),
    name: faker.person.fullName(),
    createdAt: new Date(),
    ...overrides  // Allow overriding specific fields
  };
}

// In tests
const user = createUser({ email: 'specific@test.com' });
const admin = createUser({ role: 'admin' });
```

### Builder Pattern (Complex Objects)

```typescript
class OrderBuilder {
  private order: Partial<Order> = {};

  withItems(items: Item[]) {
    this.order.items = items;
    return this;
  }

  withDiscount(percent: number) {
    this.order.discount = { percent };
    return this;
  }

  build(): Order {
    return {
      id: faker.string.uuid(),
      items: [],
      ...this.order
    } as Order;
  }
}

// Usage
const order = new OrderBuilder()
  .withItems([{ sku: 'ABC', price: 100 }])
  .withDiscount(10)
  .build();
```

### Shared Fixtures

```typescript
// fixtures/index.ts
export const fixtures = {
  validUser: createUser({ email: 'valid@test.com' }),
  adminUser: createUser({ role: 'admin' }),
  expiredToken: 'expired.jwt.token',
};

// In tests
import { fixtures } from '../fixtures';
test('admin can delete users', () => {
  const result = deleteUser(fixtures.adminUser, targetId);
});
```

---

## Test Isolation

### Database Isolation

```typescript
// Transaction rollback (fastest)
beforeEach(async () => {
  await db.beginTransaction();
});

afterEach(async () => {
  await db.rollback();
});

// Or: Truncate tables
beforeEach(async () => {
  await db.truncateAll();
});

// Or: Separate test database
// DATABASE_URL_TEST=postgres://localhost/myapp_test
```

### Module Isolation

```typescript
// Reset modules between tests
beforeEach(() => {
  jest.resetModules();
});

// Clear all mocks
afterEach(() => {
  jest.clearAllMocks();
});
```

### Time Isolation

```typescript
// Control time in tests
beforeEach(() => {
  jest.useFakeTimers();
  jest.setSystemTime(new Date('2024-01-15'));
});

afterEach(() => {
  jest.useRealTimers();
});
```

---

## Common Patterns

### Testing Async Code

```typescript
// Async/await (preferred)
test('fetches user data', async () => {
  const user = await fetchUser(1);
  expect(user.name).toBe('John');
});

// With rejection
test('throws on invalid id', async () => {
  await expect(fetchUser(-1)).rejects.toThrow('Invalid ID');
});
```

### Testing Errors

```typescript
// Sync errors
test('throws on invalid input', () => {
  expect(() => validate(null)).toThrow('Input required');
});

// Async errors
test('rejects on network failure', async () => {
  mockFetch.mockRejectedValue(new Error('Network error'));

  await expect(fetchData()).rejects.toThrow('Network error');
});

// Error properties
test('throws ValidationError with details', () => {
  try {
    validate({ email: 'invalid' });
    fail('Should have thrown');
  } catch (error) {
    expect(error).toBeInstanceOf(ValidationError);
    expect(error.field).toBe('email');
  }
});
```

### Testing Events/Callbacks

```typescript
test('calls onSuccess after save', async () => {
  const onSuccess = jest.fn();

  await saveUser(userData, { onSuccess });

  expect(onSuccess).toHaveBeenCalledTimes(1);
  expect(onSuccess).toHaveBeenCalledWith({ id: expect.any(String) });
});
```

### Parameterized Tests

```typescript
// Test multiple cases with same logic
test.each([
  { input: '', expected: false },
  { input: 'a', expected: false },
  { input: 'abc@', expected: false },
  { input: 'test@example.com', expected: true },
])('validates email "$input" as $expected', ({ input, expected }) => {
  expect(isValidEmail(input)).toBe(expected);
});

// Table format
test.each`
  a    | b    | expected
  ${1} | ${2} | ${3}
  ${2} | ${3} | ${5}
`('adds $a + $b = $expected', ({ a, b, expected }) => {
  expect(add(a, b)).toBe(expected);
});
```

---

## Anti-Patterns

| Anti-Pattern | Problem | Fix |
|--------------|---------|-----|
| **Test interdependence** | Tests pass/fail based on order | Full isolation, no shared state |
| **Testing implementation** | Breaks when refactoring | Test behavior, not internals |
| **Excessive mocking** | Tests pass, code broken | Test real integration points |
| **Large Arrange blocks** | Hard to understand | Use factories, builders |
| **Multiple asserts** | Unclear what failed | One concept per test |
| **Magic values** | `expect(result).toBe(42)` | Named constants, clear intent |
| **Commented tests** | Hidden failures | Delete or fix |
| **Sleeping in tests** | `await sleep(1000)` | Wait for condition instead |
| **Test logic** | if/loops in tests | Parameterized tests |

---

## Coverage Guidelines

| Metric | Target | Notes |
|--------|--------|-------|
| Line coverage | 80%+ | Minimum for CI gate |
| Branch coverage | 75%+ | Test conditionals |
| Critical paths | 100% | Auth, payments, data integrity |

**Coverage is not quality** - 100% coverage with bad tests = false confidence.

---

## Quick Reference

```bash
# Run tests
npm test                    # All tests
npm test -- --watch         # Watch mode
npm test -- --coverage      # With coverage
npm test -- UserService     # Filter by name

# Jest flags
--runInBand                 # No parallelization (debugging)
--detectOpenHandles         # Find hanging async
--forceExit                 # Force exit after tests
```

---

## Integration with Other Skills

| Skill | Integration |
|-------|-------------|
| **api-testing** | API-specific patterns |
| **fixing-test-suites** | Debug failing tests |
| **commit** | Run tests before committing |
```

### Step 2.6: Create api-testing/SKILL.md

Create file: `$SKILLS_DIR/api-testing/SKILL.md`

```markdown
---
name: api-testing
description: Use when testing REST APIs, GraphQL endpoints, writing integration tests for backends, or setting up API test automation.
---

# API Testing

Industry best practices for testing APIs.

## When to Use

- Writing tests for REST/GraphQL endpoints
- Setting up API integration tests
- Testing authentication/authorization
- Contract testing between services
- Validating error responses

---

## API Test Pyramid

| Level | What to Test | Tools | Count |
|-------|--------------|-------|-------|
| Unit | Validators, serializers | Jest, pytest | 70% |
| Integration | Full endpoint behavior | Supertest, httpx | 20% |
| Contract | API shape compatibility | Pact, OpenAPI | 10% |

---

## REST API Testing

### Basic Pattern (Supertest/Jest)

```typescript
describe('GET /api/users/:id', () => {
  it('returns user when found', async () => {
    const response = await request(app)
      .get('/api/users/123')
      .set('Authorization', `Bearer ${token}`)
      .expect('Content-Type', /json/)
      .expect(200);

    expect(response.body).toMatchObject({
      id: '123',
      email: expect.any(String),
    });
  });

  it('returns 404 when not found', async () => {
    await request(app)
      .get('/api/users/nonexistent')
      .set('Authorization', `Bearer ${token}`)
      .expect(404);
  });
});
```

### Python (pytest + httpx)

```python
@pytest.mark.asyncio
async def test_get_user(client, auth_headers):
    response = await client.get("/api/users/123", headers=auth_headers)
    assert response.status_code == 200
    assert response.json()["id"] == "123"
```

---

## Status Code Coverage

**Required coverage for every API:**

| Status | Meaning | Test Scenario |
|--------|---------|---------------|
| 200 | OK | Successful GET/PUT |
| 201 | Created | Successful POST |
| 204 | No Content | Successful DELETE |
| 400 | Bad Request | Invalid JSON |
| 401 | Unauthorized | Missing/invalid token |
| 403 | Forbidden | Insufficient permissions |
| 404 | Not Found | Resource doesn't exist |
| 409 | Conflict | Duplicate resource |
| 422 | Unprocessable | Validation failed |
| 429 | Too Many Requests | Rate limited |
| 500 | Server Error | Unexpected failure |

---

## Authentication Testing

```typescript
describe('Authentication', () => {
  it('accepts valid token', async () => {
    await request(app)
      .get('/api/protected')
      .set('Authorization', `Bearer ${validToken}`)
      .expect(200);
  });

  it('rejects missing token', async () => {
    await request(app).get('/api/protected').expect(401);
  });

  it('rejects expired token', async () => {
    await request(app)
      .set('Authorization', `Bearer ${expiredToken}`)
      .get('/api/protected')
      .expect(401);
  });
});

describe('Authorization', () => {
  it('allows admin to admin routes', async () => {
    await request(app)
      .get('/api/admin/users')
      .set('Authorization', `Bearer ${adminToken}`)
      .expect(200);
  });

  it('denies user to admin routes', async () => {
    await request(app)
      .get('/api/admin/users')
      .set('Authorization', `Bearer ${userToken}`)
      .expect(403);
  });
});
```

---

## Request Validation Testing

```typescript
describe('POST /api/users validation', () => {
  it('requires email', async () => {
    const response = await request(app)
      .post('/api/users')
      .send({ name: 'Test' })
      .expect(422);

    expect(response.body.errors[0].field).toBe('email');
  });

  it('validates email format', async () => {
    await request(app)
      .post('/api/users')
      .send({ email: 'not-an-email', name: 'Test' })
      .expect(422);
  });

  it('sanitizes XSS', async () => {
    const response = await request(app)
      .post('/api/users')
      .send({ name: '<script>alert("xss")</script>', email: 'test@example.com' })
      .expect(201);

    expect(response.body.name).not.toContain('<script>');
  });
});
```

---

## Response Format Testing

```typescript
describe('Response format', () => {
  it('returns consistent error format', async () => {
    const response = await request(app)
      .get('/api/users/nonexistent')
      .expect(404);

    expect(response.body).toMatchObject({
      error: expect.any(String),
      code: expect.any(String),
    });
  });

  it('includes pagination meta', async () => {
    const response = await request(app)
      .get('/api/users')
      .expect(200);

    expect(response.body.meta).toMatchObject({
      total: expect.any(Number),
      page: expect.any(Number),
    });
  });
});
```

---

## GraphQL Testing

See `graphql-testing.md` for complete patterns including:
- Query/mutation testing
- Subscription testing
- N+1 query detection
- Field-level authorization

**Quick example:**

```typescript
const query = (q: string, variables = {}) =>
  request(app).post('/graphql').send({ query: q, variables });

it('fetches user', async () => {
  const response = await query(`
    query { user(id: "123") { id email } }
  `).expect(200);

  expect(response.body.errors).toBeUndefined();
});
```

---

## Contract Testing

See `contract-testing.md` for complete patterns including:
- Pact consumer/provider tests
- OpenAPI schema validation
- Backward compatibility testing

**Quick example (Pact):**

```typescript
await provider.addInteraction({
  state: 'user exists',
  uponReceiving: 'get user request',
  withRequest: { method: 'GET', path: '/api/users/123' },
  willRespondWith: {
    status: 200,
    body: { id: '123', email: Matchers.email() },
  },
});
```

---

## Test Data Management

### Factories

```typescript
export const createUserPayload = (overrides = {}) => ({
  email: faker.internet.email(),
  name: faker.person.fullName(),
  password: 'SecurePass123!',
  ...overrides,
});
```

### Database Isolation

```typescript
beforeEach(async () => {
  await db.beginTransaction();
});

afterEach(async () => {
  await db.rollback();
});
```

---

## Performance Testing

```typescript
it('responds within SLA', async () => {
  const start = Date.now();
  await request(app).get('/api/users').expect(200);
  expect(Date.now() - start).toBeLessThan(200);
});

it('handles concurrent requests', async () => {
  const requests = Array(100).fill(null).map(() =>
    request(app).get('/api/health')
  );
  const responses = await Promise.all(requests);
  expect(responses.every(r => r.status === 200)).toBe(true);
});
```

---

## Quick Checklist

- [ ] All CRUD operations tested
- [ ] All status codes covered
- [ ] Auth tested (valid, invalid, expired, missing)
- [ ] Authorization tested (roles, ownership)
- [ ] Validation tested (required, format, limits)
- [ ] Error format consistent
- [ ] Pagination tested
- [ ] Rate limiting tested
- [ ] No sensitive data in responses

---

## Integration

| Skill | Integration |
|-------|-------------|
| **test-patterns** | General testing patterns |
| **fixing-test-suites** | Debug failing tests |
| **commit** | Run tests before committing |
```

### Step 2.6.b: Create api-testing/contract-testing.md

Create file: `$SKILLS_DIR/api-testing/contract-testing.md`

```markdown
# Contract Testing Reference

## Pact (Consumer-Driven Contracts)

### Consumer Test (Frontend)

```typescript
import { Pact, Matchers } from '@pact-foundation/pact';

const provider = new Pact({
  consumer: 'frontend',
  provider: 'user-service',
  port: 1234,
});

describe('User Service Contract', () => {
  beforeAll(() => provider.setup());
  afterAll(() => provider.finalize());
  afterEach(() => provider.verify());

  describe('GET /api/users/:id', () => {
    it('returns user for valid ID', async () => {
      // Define expected interaction
      await provider.addInteraction({
        state: 'user 123 exists',
        uponReceiving: 'a request for user 123',
        withRequest: {
          method: 'GET',
          path: '/api/users/123',
          headers: { Authorization: 'Bearer valid-token' },
        },
        willRespondWith: {
          status: 200,
          headers: { 'Content-Type': 'application/json' },
          body: {
            id: '123',
            email: Matchers.email(),
            name: Matchers.string(),
            createdAt: Matchers.iso8601DateTime(),
          },
        },
      });

      // Make request against mock
      const response = await userClient.getUser('123');

      expect(response.id).toBe('123');
    });

    it('returns 404 for missing user', async () => {
      await provider.addInteraction({
        state: 'user does not exist',
        uponReceiving: 'a request for nonexistent user',
        withRequest: {
          method: 'GET',
          path: '/api/users/nonexistent',
        },
        willRespondWith: {
          status: 404,
          body: {
            error: Matchers.string(),
            code: 'USER_NOT_FOUND',
          },
        },
      });

      await expect(userClient.getUser('nonexistent')).rejects.toThrow();
    });
  });
});
```

### Provider Verification

```typescript
import { Verifier } from '@pact-foundation/pact';

describe('Provider Verification', () => {
  it('validates against consumer contracts', async () => {
    const verifier = new Verifier({
      provider: 'user-service',
      providerBaseUrl: 'http://localhost:3000',
      pactUrls: ['./pacts/frontend-user-service.json'],
      stateHandlers: {
        'user 123 exists': async () => {
          await db.users.create({ id: '123', email: 'test@example.com' });
        },
        'user does not exist': async () => {
          await db.users.deleteAll();
        },
      },
    });

    await verifier.verifyProvider();
  });
});
```

## OpenAPI Contract Testing

### Schema Validation

```typescript
import { OpenAPIValidator } from 'openapi-backend';

const validator = new OpenAPIValidator({
  definition: './openapi.yaml',
});

describe('OpenAPI Compliance', () => {
  it('response matches schema', async () => {
    const response = await request(app).get('/api/users/123');

    const validation = validator.validateResponse(
      response.body,
      'getUser',
      response.status
    );

    expect(validation.valid).toBe(true);
  });

  it('request matches schema', async () => {
    const requestBody = { email: 'test@example.com', name: 'Test' };

    const validation = validator.validateRequest({
      method: 'POST',
      path: '/api/users',
      body: requestBody,
    });

    expect(validation.valid).toBe(true);
  });
});
```

### Automated OpenAPI Testing

```typescript
import SwaggerParser from '@apidevtools/swagger-parser';

describe('OpenAPI Spec', () => {
  let spec;

  beforeAll(async () => {
    spec = await SwaggerParser.validate('./openapi.yaml');
  });

  it('spec is valid', () => {
    expect(spec).toBeDefined();
  });

  // Generate tests from spec
  Object.entries(spec.paths).forEach(([path, methods]) => {
    Object.entries(methods).forEach(([method, operation]) => {
      if (['get', 'post', 'put', 'delete'].includes(method)) {
        it(`${method.toUpperCase()} ${path} returns documented status`, async () => {
          const response = await request(app)[method](path);
          const expectedStatuses = Object.keys(operation.responses).map(Number);

          expect(expectedStatuses).toContain(response.status);
        });
      }
    });
  });
});
```

## API Compatibility Testing

```typescript
describe('Backward Compatibility', () => {
  it('v1 response still includes deprecated fields', async () => {
    const response = await request(app)
      .get('/api/v1/users/123')
      .expect(200);

    // Old field still present for v1
    expect(response.body.userName).toBeDefined();
    // New field also present
    expect(response.body.name).toBeDefined();
  });

  it('v2 response excludes deprecated fields', async () => {
    const response = await request(app)
      .get('/api/v2/users/123')
      .expect(200);

    // Old field removed in v2
    expect(response.body.userName).toBeUndefined();
    // New field only
    expect(response.body.name).toBeDefined();
  });
});
```
```

### Step 2.6.c: Create api-testing/graphql-testing.md

Create file: `$SKILLS_DIR/api-testing/graphql-testing.md`

```markdown
# GraphQL Testing Reference

## Basic Query Testing

```typescript
import request from 'supertest';

describe('GraphQL API', () => {
  const query = (q: string, variables = {}) =>
    request(app)
      .post('/graphql')
      .set('Authorization', `Bearer ${token}`)
      .send({ query: q, variables });

  describe('Queries', () => {
    it('fetches user by ID', async () => {
      const response = await query(`
        query GetUser($id: ID!) {
          user(id: $id) {
            id
            email
            name
          }
        }
      `, { id: '123' }).expect(200);

      expect(response.body.data.user).toMatchObject({
        id: '123',
        email: expect.any(String),
      });
      expect(response.body.errors).toBeUndefined();
    });

    it('returns null for nonexistent user', async () => {
      const response = await query(`
        query { user(id: "nonexistent") { id } }
      `).expect(200);

      expect(response.body.data.user).toBeNull();
    });
  });

  describe('Mutations', () => {
    it('creates user', async () => {
      const response = await query(`
        mutation CreateUser($input: CreateUserInput!) {
          createUser(input: $input) {
            id
            email
          }
        }
      `, {
        input: { email: 'new@example.com', name: 'New User' }
      }).expect(200);

      expect(response.body.data.createUser.id).toBeDefined();
    });
  });

  describe('Error handling', () => {
    it('returns validation errors', async () => {
      const response = await query(`
        mutation { createUser(input: { email: "invalid" }) { id } }
      `).expect(200);

      expect(response.body.errors).toHaveLength(1);
      expect(response.body.errors[0].extensions.code).toBe('VALIDATION_ERROR');
    });
  });
});
```

## Testing Subscriptions

```typescript
import { createClient } from 'graphql-ws';

describe('GraphQL Subscriptions', () => {
  let client;

  beforeEach(() => {
    client = createClient({
      url: 'ws://localhost:4000/graphql',
      connectionParams: { authToken: token },
    });
  });

  afterEach(() => {
    client.dispose();
  });

  it('receives real-time updates', (done) => {
    const subscription = client.subscribe(
      {
        query: `
          subscription OnMessageAdded($channelId: ID!) {
            messageAdded(channelId: $channelId) {
              id
              content
            }
          }
        `,
        variables: { channelId: '123' },
      },
      {
        next: (data) => {
          expect(data.data.messageAdded).toBeDefined();
          done();
        },
        error: done,
      }
    );

    // Trigger the subscription
    setTimeout(() => {
      sendMessage({ channelId: '123', content: 'Test' });
    }, 100);
  });
});
```

## Testing N+1 Queries

```typescript
describe('Query Performance', () => {
  it('avoids N+1 queries with DataLoader', async () => {
    const queryCount = { count: 0 };

    // Mock DB to count queries
    jest.spyOn(db, 'query').mockImplementation(async (sql) => {
      queryCount.count++;
      return originalQuery(sql);
    });

    await query(`
      query {
        users(limit: 10) {
          id
          posts { id title }
        }
      }
    `);

    // Should be 2 queries (users + posts), not 11 (users + 10 posts)
    expect(queryCount.count).toBeLessThanOrEqual(3);
  });
});
```

## Testing Authorization

```typescript
describe('Field-level Authorization', () => {
  it('hides email from non-owners', async () => {
    const response = await query(
      `query { user(id: "other-user") { id email } }`,
      {},
      { token: userToken }
    );

    expect(response.body.data.user.id).toBeDefined();
    expect(response.body.data.user.email).toBeNull();
  });

  it('shows email to owner', async () => {
    const response = await query(
      `query { user(id: "current-user") { id email } }`,
      {},
      { token: userToken }
    );

    expect(response.body.data.user.email).toBeDefined();
  });
});
```
```

### Step 2.7: Create react-performance/SKILL.md

Create file: `$SKILLS_DIR/react-performance/SKILL.md`

```markdown
---
name: react-performance
description: React and Next.js performance optimization. Use when writing, reviewing, or refactoring React/Next.js code, optimizing bundle size, or fixing performance issues.
---

# React Performance Optimization

45+ rules across 8 priority categories for React and Next.js.

## When to Use

- Writing new React components
- Reviewing React/Next.js code
- Debugging performance issues
- Optimizing bundle size
- Fixing slow renders or waterfalls

---

## Priority Categories

| Priority | Category | Impact |
|----------|----------|--------|
| CRITICAL | Eliminating Waterfalls | Seconds of delay |
| CRITICAL | Bundle Size | Initial load time |
| HIGH | Server-Side Performance | TTFB, data fetching |
| MEDIUM-HIGH | Client Data Fetching | Runtime efficiency |
| MEDIUM | Re-render Optimization | UI responsiveness |
| MEDIUM | Rendering Performance | Paint/layout |
| LOWER | JavaScript Performance | Micro-optimizations |
| LOWER | Advanced Patterns | Edge cases |

---

## CRITICAL: Eliminating Waterfalls

**Impact:** Can save seconds of load time.

### Rule 1: Parallel Data Fetching

```tsx
// BAD: Sequential (waterfall)
const user = await getUser();
const posts = await getPosts(user.id);
const comments = await getComments(posts[0].id);

// GOOD: Parallel where possible
const [user, posts] = await Promise.all([
  getUser(),
  getPosts(userId)
]);
```

### Rule 2: Use Suspense Boundaries

```tsx
// BAD: Parent waits for all children
function Page() {
  const data = await fetchAllData(); // blocks everything
  return <Content data={data} />;
}

// GOOD: Independent Suspense boundaries
function Page() {
  return (
    <>
      <Suspense fallback={<HeaderSkeleton />}>
        <Header />
      </Suspense>
      <Suspense fallback={<ContentSkeleton />}>
        <Content />
      </Suspense>
    </>
  );
}
```

### Rule 3: Avoid Fetch-Then-Render

```tsx
// BAD: Component fetches after mount
function Profile() {
  const [user, setUser] = useState(null);
  useEffect(() => {
    fetchUser().then(setUser);
  }, []);
}

// GOOD: Fetch at route level, pass down
// app/profile/page.tsx
async function ProfilePage() {
  const user = await fetchUser();
  return <Profile user={user} />;
}
```

---

## CRITICAL: Bundle Size

**Impact:** Directly affects initial load time.

### Rule 4: Dynamic Imports for Heavy Components

```tsx
// BAD: Always loaded
import { Chart } from 'heavy-chart-library';

// GOOD: Loaded only when needed
const Chart = dynamic(() => import('heavy-chart-library'), {
  loading: () => <ChartSkeleton />,
  ssr: false
});
```

### Rule 5: Avoid Barrel Files

```tsx
// BAD: Imports entire barrel (tree-shaking fails)
import { Button } from '@/components';
import { debounce } from 'lodash';

// GOOD: Direct imports
import { Button } from '@/components/Button';
import debounce from 'lodash/debounce';
```

### Rule 6: Defer Third-Party Scripts

```tsx
// BAD: Blocks rendering
<script src="https://analytics.com/script.js" />

// GOOD: Deferred loading
<Script
  src="https://analytics.com/script.js"
  strategy="lazyOnload"
/>
```

### Rule 7: Code Split by Route

```tsx
// Next.js does this automatically with app router
// For manual splitting:
const AdminDashboard = lazy(() => import('./AdminDashboard'));
```

---

## HIGH: Server-Side Performance

### Rule 8: Use React.cache() for Deduplication

```tsx
// BAD: Same data fetched multiple times
// Component A fetches user, Component B fetches user again

// GOOD: Cached at request level
import { cache } from 'react';

const getUser = cache(async (id: string) => {
  return db.user.findUnique({ where: { id } });
});

// Now multiple components can call getUser(id) - only one DB hit
```

### Rule 9: Parallel Route Segments

```tsx
// GOOD: Next.js parallel routes
// app/@analytics/page.tsx loads in parallel with
// app/@dashboard/page.tsx
```

### Rule 10: Streaming with Loading UI

```tsx
// app/dashboard/loading.tsx - shows immediately
export default function Loading() {
  return <DashboardSkeleton />;
}

// app/dashboard/page.tsx - streams when ready
export default async function Dashboard() {
  const data = await fetchDashboard();
  return <DashboardContent data={data} />;
}
```

---

## MEDIUM-HIGH: Client Data Fetching

### Rule 11: Use SWR/React Query for Deduplication

```tsx
// BAD: Multiple components fetch same data
useEffect(() => { fetch('/api/user') }, []);

// GOOD: Automatic deduplication and caching
const { data } = useSWR('/api/user', fetcher);
```

### Rule 12: Consolidate Event Listeners

```tsx
// BAD: Multiple listeners
useEffect(() => {
  window.addEventListener('resize', handleResize);
  window.addEventListener('scroll', handleScroll);
}, []);

// GOOD: Single consolidated listener or use hooks
import { useWindowSize } from '@/hooks/useWindowSize';
```

### Rule 13: Debounce Expensive Operations

```tsx
// BAD: Fires on every keystroke
<input onChange={(e) => search(e.target.value)} />

// GOOD: Debounced
const debouncedSearch = useMemo(
  () => debounce(search, 300),
  []
);
<input onChange={(e) => debouncedSearch(e.target.value)} />
```

---

## MEDIUM: Re-render Optimization

### Rule 14: Memoize Expensive Computations

```tsx
// BAD: Recalculates every render
const sorted = items.sort((a, b) => a.date - b.date);

// GOOD: Only recalculates when items change
const sorted = useMemo(
  () => items.sort((a, b) => a.date - b.date),
  [items]
);
```

### Rule 15: Use Functional setState

```tsx
// BAD: Stale closure risk
setCount(count + 1);
setCount(count + 1); // Still uses old count

// GOOD: Always uses latest state
setCount(c => c + 1);
setCount(c => c + 1); // Correctly increments twice
```

### Rule 16: useTransition for Non-Urgent Updates

```tsx
// BAD: Blocks UI during expensive update
setSearchResults(filterResults(query));

// GOOD: Keeps UI responsive
const [isPending, startTransition] = useTransition();
startTransition(() => {
  setSearchResults(filterResults(query));
});
```

### Rule 17: Avoid Inline Object/Array Props

```tsx
// BAD: New object every render, breaks memoization
<Component style={{ color: 'red' }} items={[1, 2, 3]} />

// GOOD: Stable references
const style = useMemo(() => ({ color: 'red' }), []);
const items = useMemo(() => [1, 2, 3], []);
<Component style={style} items={items} />
```

---

## MEDIUM: Rendering Performance

### Rule 18: Virtualize Long Lists

```tsx
// BAD: Renders all 10,000 items
{items.map(item => <Row key={item.id} {...item} />)}

// GOOD: Only renders visible items
import { useVirtualizer } from '@tanstack/react-virtual';
// or use content-visibility: auto in CSS
```

### Rule 19: Use content-visibility for Off-Screen Content

```css
/* GOOD: Browser skips rendering off-screen sections */
.card {
  content-visibility: auto;
  contain-intrinsic-size: 200px;
}
```

### Rule 20: Prevent Hydration Flicker

```tsx
// BAD: Server/client mismatch
function Time() {
  return <span>{new Date().toLocaleString()}</span>;
}

// GOOD: Client-only rendering for dynamic content
function Time() {
  const [time, setTime] = useState<string>();
  useEffect(() => {
    setTime(new Date().toLocaleString());
  }, []);
  return <span>{time ?? 'Loading...'}</span>;
}
```

### Rule 21: Optimize Images

```tsx
// BAD: No optimization
<img src="/hero.png" />

// GOOD: Next.js Image with optimization
<Image
  src="/hero.png"
  width={800}
  height={600}
  priority // for above-fold
  // or loading="lazy" for below-fold
/>
```

---

## LOWER: JavaScript Performance

### Rule 22: Use Set/Map for Lookups

```tsx
// BAD: O(n) lookup
const isSelected = selectedIds.includes(id);

// GOOD: O(1) lookup
const selectedSet = useMemo(() => new Set(selectedIds), [selectedIds]);
const isSelected = selectedSet.has(id);
```

### Rule 23: Avoid Creating Functions in Loops

```tsx
// BAD: New function for each item
{items.map(item => (
  <Button onClick={() => handleClick(item.id)} />
))}

// GOOD: Single handler with data attribute
const handleClick = useCallback((e) => {
  const id = e.currentTarget.dataset.id;
  // handle click
}, []);

{items.map(item => (
  <Button data-id={item.id} onClick={handleClick} />
))}
```

---

## Quick Checklist

Before shipping React code:

- [ ] No sequential awaits that could be parallel?
- [ ] Heavy components dynamically imported?
- [ ] Direct imports, not barrel files?
- [ ] Lists >50 items virtualized?
- [ ] Images have width/height?
- [ ] Below-fold images lazy loaded?
- [ ] Expensive computations memoized?
- [ ] No hydration mismatches?

---

## Integration with Other Skills

| Skill | Integration |
|-------|-------------|
| **ui-review** | UI/accessibility audit |
| **commit** | Performance checks before commit |
| **test-patterns** | Testing performance improvements |
```

### Step 2.8: Create ui-review/SKILL.md

Create file: `$SKILLS_DIR/ui-review/SKILL.md`

```markdown
---
name: ui-review
description: Audit UI code against 100+ best practices for accessibility, performance, and UX. Use when reviewing frontend code, checking accessibility, or auditing design implementation.
---

# UI Review

Audit UI code against web interface best practices.

## When to Use

- Reviewing frontend/UI code
- Accessibility (a11y) audits
- UX compliance checks
- Design system enforcement
- Pre-launch quality gate

---

## Categories

| Category | Rules | Priority |
|----------|-------|----------|
| Accessibility | 12 | Critical |
| Focus States | 4 | Critical |
| Forms | 14 | High |
| Performance | 8 | High |
| Images | 4 | Medium |
| Animation | 6 | Medium |
| Typography | 6 | Lower |
| Navigation | 5 | Lower |
| Touch/Mobile | 5 | Lower |
| Dark Mode | 3 | Lower |
| i18n | 3 | Lower |

---

## Accessibility

### A1: Icon Buttons Need aria-label

```tsx
// BAD
<button><IconTrash /></button>

// GOOD
<button aria-label="Delete item"><IconTrash /></button>
```

### A2: Form Controls Need Labels

```tsx
// BAD
<input type="email" placeholder="Email" />

// GOOD
<label htmlFor="email">Email</label>
<input id="email" type="email" />

// or
<input type="email" aria-label="Email address" />
```

### A3: Interactive Elements Need Keyboard Handlers

```tsx
// BAD: Mouse only
<div onClick={handleClick}>Click me</div>

// GOOD: Keyboard accessible
<button onClick={handleClick}>Click me</button>

// If must use div:
<div
  role="button"
  tabIndex={0}
  onClick={handleClick}
  onKeyDown={(e) => e.key === 'Enter' && handleClick()}
>
```

### A4: Use Correct Elements

```tsx
// BAD
<div onClick={() => navigate('/home')}>Home</div>
<span onClick={handleSubmit}>Submit</span>

// GOOD
<Link href="/home">Home</Link>
<button onClick={handleSubmit}>Submit</button>
```

### A5: Images Need alt Text

```tsx
// BAD
<img src="profile.jpg" />

// GOOD: Meaningful alt
<img src="profile.jpg" alt="User profile photo" />

// GOOD: Decorative (empty alt)
<img src="decoration.svg" alt="" />
```

### A6: Decorative Icons Hidden from Screen Readers

```tsx
// GOOD
<span aria-hidden="true"><IconDecoration /></span>
```

### A7: Async Updates Use aria-live

```tsx
// GOOD: Screen reader announces changes
<div aria-live="polite">
  {message && <span>{message}</span>}
</div>
```

### A8: Semantic HTML Before ARIA

```tsx
// BAD: ARIA on div
<div role="navigation">...</div>

// GOOD: Semantic element
<nav>...</nav>
```

### A9: Hierarchical Headings

```tsx
// BAD: Skipped levels
<h1>Title</h1>
<h3>Subtitle</h3>

// GOOD: Sequential
<h1>Title</h1>
<h2>Subtitle</h2>
```

### A10: Skip Link for Main Content

```tsx
// GOOD: First focusable element
<a href="#main" className="sr-only focus:not-sr-only">
  Skip to main content
</a>
```

### A11: Color Contrast

- Text must have 4.5:1 contrast ratio (WCAG AA)
- Large text (18px+): 3:1 minimum
- Use tools: axe, Lighthouse, Contrast Checker

### A12: No Zoom Disabling

```html
<!-- BAD: Blocks accessibility -->
<meta name="viewport" content="user-scalable=no, maximum-scale=1">

<!-- GOOD -->
<meta name="viewport" content="width=device-width, initial-scale=1">
```

---

## Focus States

### F1: Visible Focus Indicator

```css
/* BAD */
button:focus { outline: none; }

/* GOOD */
button:focus-visible {
  outline: 2px solid var(--focus-color);
  outline-offset: 2px;
}
```

### F2: Use :focus-visible Not :focus

```css
/* BAD: Shows ring on click */
button:focus { ring: 2px; }

/* GOOD: Only keyboard focus */
button:focus-visible { ring: 2px; }
```

### F3: :focus-within for Compound Controls

```css
/* GOOD: Parent highlights when child focused */
.input-group:focus-within {
  border-color: var(--focus-color);
}
```

### F4: Never outline-none Without Replacement

```css
/* BAD */
*:focus { outline: none; }

/* GOOD: Custom focus style */
*:focus-visible {
  outline: none;
  box-shadow: 0 0 0 2px var(--focus-color);
}
```

---

## Forms

### FO1: Inputs Need autocomplete

```tsx
// GOOD
<input type="email" name="email" autoComplete="email" />
<input type="tel" name="phone" autoComplete="tel" />
<input type="text" name="name" autoComplete="name" />
```

### FO2: Correct Input Types

```tsx
// GOOD: Triggers correct keyboard
<input type="email" inputMode="email" />
<input type="tel" inputMode="tel" />
<input type="number" inputMode="numeric" />
<input type="url" inputMode="url" />
```

### FO3: Never Prevent Paste

```tsx
// BAD
<input onPaste={(e) => e.preventDefault()} />

// GOOD: Allow paste
<input />
```

### FO4: Labels Must Be Clickable

```tsx
// BAD: Label doesn't focus input
<label>Email</label>
<input id="email" />

// GOOD: htmlFor connects them
<label htmlFor="email">Email</label>
<input id="email" />
```

### FO5: Disable Spellcheck on Codes/Emails

```tsx
// GOOD
<input type="email" spellCheck={false} />
<input name="verification-code" spellCheck={false} />
```

### FO6: Submit Button Enabled Until Request

```tsx
// GOOD: Disable only during submission
<button type="submit" disabled={isSubmitting}>
  {isSubmitting ? <Spinner /> : 'Submit'}
</button>
```

### FO7: Errors Inline, Focus First Error

```tsx
// GOOD
{errors.email && (
  <span role="alert" className="text-red-500">
    {errors.email}
  </span>
)}

// On submit, focus first error field
useEffect(() => {
  if (errors.email) emailRef.current?.focus();
}, [errors]);
```

### FO8: Placeholders Show Example Pattern

```tsx
// GOOD
<input placeholder="name@example.com…" />
<input placeholder="(555) 123-4567…" />
```

### FO9: Warn Before Navigating with Unsaved Changes

```tsx
// GOOD
useEffect(() => {
  const handler = (e: BeforeUnloadEvent) => {
    if (isDirty) e.preventDefault();
  };
  window.addEventListener('beforeunload', handler);
  return () => window.removeEventListener('beforeunload', handler);
}, [isDirty]);
```

---

## Performance

### P1: Virtualize Lists >50 Items

```tsx
// BAD
{items.map(item => <Row key={item.id} />)} // 1000 items

// GOOD
import { useVirtualizer } from '@tanstack/react-virtual';
```

### P2: No Layout Reads During Render

```tsx
// BAD: Forces layout recalculation
function Component() {
  const width = element.getBoundingClientRect().width; // DON'T
}

// GOOD: Use ResizeObserver or CSS
```

### P3: Batch DOM Reads/Writes

```tsx
// BAD: Interleaved (causes layout thrashing)
element.style.width = '100px';
const height = element.offsetHeight;
element.style.height = height + 'px';

// GOOD: Batch reads, then writes
const height = element.offsetHeight;
element.style.width = '100px';
element.style.height = height + 'px';
```

### P4: Prefer Uncontrolled Inputs

```tsx
// BAD: Re-renders on every keystroke
const [value, setValue] = useState('');
<input value={value} onChange={e => setValue(e.target.value)} />

// GOOD: No re-renders
<input defaultValue="" ref={inputRef} />
```

### P5: Preconnect to CDN Domains

```tsx
// GOOD
<link rel="preconnect" href="https://cdn.example.com" />
```

### P6: Preload Critical Fonts

```tsx
// GOOD
<link
  rel="preload"
  href="/fonts/inter.woff2"
  as="font"
  type="font/woff2"
  crossOrigin="anonymous"
/>
```

---

## Images

### I1: Explicit Dimensions (Prevent CLS)

```tsx
// BAD
<img src="photo.jpg" />

// GOOD
<img src="photo.jpg" width={800} height={600} />
```

### I2: Lazy Load Below-Fold

```tsx
// GOOD
<img src="photo.jpg" loading="lazy" />
```

### I3: Priority for Above-Fold

```tsx
// GOOD (Next.js)
<Image src="hero.jpg" priority />

// or native
<img src="hero.jpg" fetchPriority="high" />
```

---

## Animation

### AN1: Respect prefers-reduced-motion

```css
/* GOOD */
@media (prefers-reduced-motion: reduce) {
  * { animation: none !important; transition: none !important; }
}
```

### AN2: Only Animate transform and opacity

```css
/* BAD: Triggers layout */
.card { transition: width 0.3s, height 0.3s; }

/* GOOD: Compositor only */
.card { transition: transform 0.3s, opacity 0.3s; }
```

### AN3: Never transition: all

```css
/* BAD */
.button { transition: all 0.3s; }

/* GOOD: Explicit properties */
.button { transition: background-color 0.3s, transform 0.3s; }
```

### AN4: Animations Must Be Interruptible

User input should immediately affect animation state.

---

## Typography

### T1: Use Ellipsis Character

```tsx
// BAD
<span>Loading...</span>

// GOOD
<span>Loading…</span>
```

### T2: Use Curly Quotes

```tsx
// BAD
<p>"Hello"</p>

// GOOD
<p>\u201cHello\u201d</p>
```

### T3: Non-Breaking Spaces

```tsx
// GOOD: Keep units together
<span>10&nbsp;MB</span>
<span>&#8984;&nbsp;K</span>
```

### T4: Tabular Nums for Number Columns

```css
/* GOOD: Numbers align in tables */
.number-column { font-variant-numeric: tabular-nums; }
```

### T5: Balance Headings

```css
/* GOOD: Prevents widows */
h1, h2, h3 { text-wrap: balance; }
```

---

## Anti-Patterns to Flag

Immediately flag these in code review:

| Pattern | Problem |
|---------|---------|
| `user-scalable=no` | Blocks accessibility |
| `onPaste` + `preventDefault` | Frustrates users |
| `transition: all` | Performance, unexpected |
| `outline: none` without replacement | No focus visible |
| `<div onClick>` for navigation | Not accessible |
| `<div>` / `<span>` with onClick | Should be `<button>` |
| `<img>` without dimensions | Layout shift |
| Large `.map()` without virtualization | Performance |
| Form inputs without labels | Not accessible |
| Icon buttons without aria-label | Not accessible |
| Hardcoded date/number formats | i18n failure |
| `autoFocus` without justification | Mobile issues |

---

## Quick Audit Checklist

- [ ] All interactive elements keyboard accessible?
- [ ] All form inputs have labels?
- [ ] All icon buttons have aria-label?
- [ ] All images have alt text?
- [ ] All images have width/height?
- [ ] Focus states visible?
- [ ] No `outline: none` without replacement?
- [ ] Lists >50 items virtualized?
- [ ] Animations respect reduced-motion?
- [ ] No `transition: all`?

---

## Integration

| Skill | Integration |
|-------|-------------|
| **react-performance** | Performance rules |
| **commit** | UI quality checks before commit |
| **test-patterns** | Testing accessibility |
```

### Step 3: Verify Installation

```bash
SKILLS_DIR="${PAI_DIR:-$HOME/.config/pai}/skills"

for skill in commit catchup knowledge-accumulation fixing-test-suites test-patterns api-testing react-performance ui-review; do
  if [ -f "$SKILLS_DIR/$skill/SKILL.md" ]; then
    echo "✓ $skill installed"
  else
    echo "✗ $skill MISSING"
  fi
done

# Check supplemental files
for file in api-testing/contract-testing.md api-testing/graphql-testing.md; do
  if [ -f "$SKILLS_DIR/$file" ]; then
    echo "✓ $file installed"
  else
    echo "✗ $file MISSING"
  fi
done
```

---

## Example Usage

### Example 1: Session Start

```
User: [starts new session]
AI: [Invokes catchup skill]
  → Reads git log, recent changes, open branches
  → Produces context summary with current state and next steps
```

### Example 2: Test Suite Repair

```
User: "Tests are failing after the auth refactor"
AI: [Invokes fixing-test-suites skill]
  → Categorizes failures (mock issues, import changes, auth pattern updates)
  → Applies systematic fix patterns
  → Verifies all tests pass
```

### Example 3: Commit Flow

```
User: /commit
AI: [Invokes commit skill]
  → Runs pre-commit checks
  → Generates conventional commit message
  → Updates documentation if needed
  → Creates commit
```

---

## Configuration

No configuration required. Skills activate automatically when task intent matches skill descriptions.

---

## Customization

### Recommended Customization

**What to Customize:** Test patterns and performance thresholds

**Why:** Different projects have different testing conventions and performance requirements.

**Process:**
1. Review test-patterns skill and adapt naming conventions to your project
2. Adjust react-performance thresholds for your performance budget
3. Update ui-review with project-specific accessibility requirements

**Expected Outcome:** Skills produce output aligned with your project's specific standards.

---

## Credits

- **Author**: sylvianavarro — developed during production use of PAI/Kai system
- **Built on**: Daniel Miessler's PAI framework and Kai skill architecture

## Related Work

*None specified.*

## Works Well With

- **pm-skills** — PM workflow skills that complement engineering workflows
- **core-install** — Required foundation for skill routing

## Recommended

*None specified.*

## Relationships

### Parent Of
*None specified.*

### Child Of
*None specified.*

### Sibling Of
- pm-skills (same author, complementary domain)

### Part Of Collection
*None specified.*

## Changelog

### 1.0.0 - 2026-02-06
- Initial release
- Eight engineering workflow skills
- API testing with contract and GraphQL supplements
- Cross-skill integration tables
