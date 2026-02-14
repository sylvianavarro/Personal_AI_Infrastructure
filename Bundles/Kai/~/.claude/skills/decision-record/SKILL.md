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
