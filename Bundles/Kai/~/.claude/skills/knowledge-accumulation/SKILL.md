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
## Productive API Integration

**Auth:** Bearer token in header, tokens expire every 24h
**Base URL:** https://api.productive.io/api/v2
**Rate Limits:** 100/min standard, 1000/min enterprise (we have enterprise)
**Pagination:** Uses `offset` and `limit`, max 100 per page
**Gotchas:**
- `factors` endpoint returns different schema than documented
- Returns 429 even under rate limit — use exponential backoff
- Allocation values are 0-1 scale, not 0-100
**Our Wrapper:** `src/integrations/productive/client.py`
**Contact:** api-support@productive.io
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
            ├── productive-api.md
            └── hubspot-api.md
```

### Cross-Project Knowledge
```
~/.claude/knowledge/
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
| **systematic-debugging** | Check Solved Problems BEFORE investigating; add AFTER solving |
| **writing-plans** | Include Decision Log entries; reference known gotchas in risks |
| **requesting-code-review** | Reviewer checks patterns match registry; add new patterns after review |
| **brainstorming** | Check Decision Log for prior art; document decisions after design |
| **productive-api-patterns** | Source for Integration Notes (Productive-specific) |
| **pulse-context** | Source for project-specific gotchas and decisions |

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
