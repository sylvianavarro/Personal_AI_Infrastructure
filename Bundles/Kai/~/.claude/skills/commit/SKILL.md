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

🤖 Generated with [Claude Code](https://claude.com/claude-code)

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
| **verification-before-completion** | Run verification before commit |
| **requesting-code-review** | Commit before requesting review |
| **finishing-a-development-branch** | Commits lead to PR |
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
