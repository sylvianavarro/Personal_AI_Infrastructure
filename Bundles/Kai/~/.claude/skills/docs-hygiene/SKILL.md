---
name: docs-hygiene
description: Use when adding, modifying, or reviewing skills — audits skill files for staleness, cross-reference integrity, and sanitization issues
---

# Docs Hygiene

## Overview

Audit the skill ecosystem for staleness, broken references, and sanitization issues.

**Core principle:** Mechanical checks first, judgment second. Run the scripts, fix the FAILs, then review semantics.

**Announce at start:** "I'm using the docs-hygiene skill to audit skill health."

## When to Run

- After adding or modifying a skill
- After regenerating `skill-index.json`
- Before bundle export (`Bundles/Kai` sync)
- Monthly full audit
- When a skill seems outdated or broken

## Step 1: Run Mechanical Checks

Run both scripts in order. Fix all FAILs before proceeding to Step 2.

```bash
# Structural checks (file exists, length, frontmatter presence)
~/.claude/tools/lint-agent-friendly.sh --skills

# Relational checks (cross-refs, index sync, sanitization, triggers)
~/.claude/tools/skill-hygiene.sh

# Single skill (incremental, after editing one skill)
~/.claude/tools/skill-hygiene.sh <skill-name>
```

**What the scripts check:**

| Script | Checks |
|--------|--------|
| lint-agent-friendly.sh | SKILL.md exists, file length (5-500 lines), frontmatter/header present, CLAUDE.md length, KB pointer |
| skill-hygiene.sh | Frontmatter completeness (name/description), index-disk sync, cross-reference validity, support file existence, sanitization scan, trigger collisions, name-directory match |

**FAIL = must fix.** Missing files, broken references, missing frontmatter fields.
**WARN = review.** Trigger collisions, sanitization on non-allowlisted skills. Document exceptions or fix.
**INFO = expected.** Sanitization hits on org-specific allowlisted skills.

## Step 2: Semantic Review

Scripts catch mechanical issues. These require judgment:

### Description Accuracy
- Read the skill body. Does the frontmatter `description:` match what it actually does?
- Does description follow "Use when..." format?
- Is the description specific enough to distinguish from similar skills?

### Bidirectional Cross-References
- If skill A's Integration says "Called by: B", does B's Integration reference A?
- Check both directions. Update the incomplete side.

### Trigger Quality
- Are triggers specific enough to disambiguate from similar skills?
- Remove stop words (the, a, for, to, with, and, or)
- Prefer domain-specific terms over generic words
- Check trigger collision warnings from the script — resolve or accept

### Content Currency
- Does the skill reference tools, APIs, or patterns that still exist?
- Any deprecated libraries, outdated URLs, or removed features?
- Any TODO/FIXME markers indicating unfinished work?

## Step 3: Fix and Verify

1. Fix all FAIL items from mechanical checks
2. Address WARN items (fix or document exception)
3. Resolve semantic issues from checklist
4. Re-run both scripts — confirm 0 violations
5. If `skill-index.json` is stale, regenerate it

## Sanitization Allowlist

These skills are org-specific by design. Sanitization hits are reported as INFO, not WARN:

- `pulse-context` — Pulse PMO domain knowledge
- `design-system` — Pulse design system
- `prospect-digest` — Slack digest for PMO
- `create-asana-engagement-project` — Asana project setup
- `productive-api-patterns` — Productive.io integration

All other skills must pass sanitization for bundle export.

## Integration

**Called by:**
- `writing-skills` — after creating/editing skills
- `CreateSkill` — after skill creation

**Delegates to:**
- `lint-agent-friendly.sh` — structural checks
- `skill-hygiene.sh` — relational checks

## Common Mistakes

**Skipping scripts, going straight to semantic review**
- Problem: Miss mechanical issues that scripts catch instantly
- Fix: Always run both scripts first. They take <2 seconds combined.

**Fixing WARNs without understanding them**
- Problem: Trigger collisions may be intentional (related skills naturally overlap)
- Fix: Review each WARN. Accept or fix, but don't blindly suppress.

**Forgetting to re-run after fixes**
- Problem: Fix introduces new issue (e.g., updating a cross-ref creates a new dead link)
- Fix: Always re-run both scripts after any change. Confirm 0 violations.

**Not updating skill-index.json after adding a skill**
- Problem: Index drifts from disk. Agents reading the index get incomplete information.
- Fix: The index-disk-sync check catches this. Regenerate when flagged.
