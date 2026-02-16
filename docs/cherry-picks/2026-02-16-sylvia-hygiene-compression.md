# Cherry-Pick: Skill Hygiene Tool + Writing-Skills Compression

**Date:** 2026-02-16
**Source:** `sylvianavarro/feat/community-skills-packs` branch
**Author:** Syvia Navarro (git config name)

## Items Pulled

### Item B: skill-hygiene.sh

**Source commit:** `95f8070` (2026-02-16 22:21:22 +0100)
**Original message:** `feat(tools): add docs-hygiene skill and skill-hygiene checker`
**File:** `Bundles/Kai/~/.claude/tools/skill-hygiene.sh` (515 lines original, adapted)

**What it does:** Bash linter with 7 automated checks for skill ecosystem health:
1. Frontmatter completeness (name/description fields)
2. Index-disk sync (skill-index.json vs actual directories)
3. Cross-reference validity (skill refs point to real skills)
4. Support file existence (referenced files actually exist)
5. Sanitization scan (no hardcoded paths, emails, Slack IDs)
6. Trigger collision detection (3+ skills sharing a trigger word)
7. Frontmatter name mismatch (dir name vs frontmatter name)

**Why pulled:** We had 50 skill directories but only 35 entries in skill-index.json -- 15 missing, plus 4 case mismatches. No existing tooling caught this. The checker provides ongoing guardrails as the skill ecosystem grows.

**Adaptations made (8 changes):**
1. Replaced `SANITIZATION_ALLOWLIST` (Sylvia's org skills → our Invela-specific skills)
2. Fixed case-sensitivity bug in index-sync: original lowercased disk names but not index keys, causing false positives for `AssetManagement`
3. Replaced `/Users/snavarro/` sanitization check with generalized `/Users/*/` and `/home/*/` pattern
4. Removed `@servant.io` email check, replaced with generic hardcoded-email detection
5. Fixed hardcoded `~/.claude/skills/skill-index.json` in trigger collision Python -- now reads from `$INDEX_FILE` env var
6. Capped exit code at 125 (original used raw violation count, which can overflow bash reserved codes 126-128+)
7. Quoted Python heredoc delimiters (`<< 'PYEOF'`) to prevent shell expansion inside Python code
8. Passed file paths to Python via `os.environ` instead of shell expansion in strings

**Items NOT pulled from same commit:**
- `docs-hygiene/SKILL.md` (orchestration skill) -- SKIPPED. References `lint-agent-friendly.sh` which doesn't exist, allowlist contains non-existent skills, semantic review duplicates writing-skills.

### Item D: writing-skills compression

**Source commit:** `0aea45d` (2026-02-16 22:40:58 +0100)
**Original message:** `refactor(skills): compress writing-skills for token efficiency`
**Files:**
- `Bundles/Kai/~/.claude/skills/writing-skills/SKILL.md` (compressed)
- `Bundles/Kai/~/.claude/skills/writing-skills/testing-methodology.md` (NEW -- extracted content)

**What it does:** Compresses the main SKILL.md by extracting heavy testing methodology content (~200 lines) to a separate reference file, and tightening prose throughout.

**Why pulled:** writing-skills loads into context every time a skill is created or edited. Savings: ~1,898 tokens per load (from 4,272 → 2,374 tokens). Testing methodology content is preserved in full but only loaded on-demand.

**Adaptations made:**
1. Restored "Content guidelines" bullet list that Sylvia's compression dropped (useful authoring rules about description writing)
2. **Created `testing-methodology.md`** -- Sylvia's compression referenced this file but never created it. We extracted the content from our current SKILL.md (lines 395-594) to fill this gap.
3. Added extended description examples to testing-methodology.md (YAML good/bad examples)

### Items Evaluated but NOT Pulled

| Item | Commit | Reason |
|------|--------|--------|
| docs-hygiene SKILL.md | `95f8070` | Broken deps (lint-agent-friendly.sh missing), org-specific allowlist, duplicates writing-skills |
| CreateSkill dead ref fix | `f5a2b70` | Already fixed independently in our `3865305` commit -- our rewrite eliminated the routing table entirely |

## Test Results

### Item B: Before/After

**Before (no hygiene tool):**
- 50 skill dirs on disk, 35 in index -- 15 missing, 4 case mismatches
- No automated way to detect drift between index and disk
- No cross-reference validation
- No sanitization scanning

**After (hygiene tool run against live ~/.claude/skills):**
- Detected 21 violations, 11 warnings
- Found 9 PM skills missing frontmatter (acceptance, decision-record, estimate, prd, prioritize, raid, sprint, status, stories)
- Found index-count mismatch (35 vs 37 live dirs)
- Found 2 skills missing from index (ds-creation-workflow + one malformed dir)
- Found 3 trigger collisions (accessibility, animation, audit shared by 3+ skills)
- Found 6 cross-reference warnings (refs to superpowers-only skills)
- Found 2 sanitization issues (AnimationCopycat /Users/me/, test-patterns test emails)
- All support file references validated (8 checked, all present)

### Item D: Before/After

| Metric | Before | After | Delta |
|--------|--------|-------|-------|
| Lines | 655 | 303 | -352 (-54%) |
| Words | 3,204 | 1,780 | -1,424 (-44%) |
| Tokens (approx) | 4,272 | 2,374 | **-1,898 (-44%)** |
| Section count | 38 | 22 | -16 |

**testing-methodology.md:** 225 lines, 1,067 words (full extracted content preserved)
**Combined total:** 528 lines (vs 655 original = 19% net reduction with zero content loss)

### Item D: Behavioral Test (Skill Authoring Quality)

Two parallel agents were given the same prompt: "Write a retry-with-backoff technique skill." One used the OLD verbose guide (655 lines), one used the NEW compressed guide (303 lines).

| Aspect | OLD Guide (4,272 tokens) | NEW Guide (2,374 tokens) | Winner |
|--------|--------------------------|--------------------------|--------|
| Frontmatter | Valid, correct CSO | Valid, correct CSO | Tie |
| Core Pattern | Pseudocode only | **Before/after comparison** | NEW |
| Quick Reference | Table with defaults | Table with defaults | Tie |
| Implementation | Longer (separate helper fns) | Tighter (equally functional) | Tie |
| Common Mistakes | 8 entries | 8 entries + circuit breaker | Slight NEW |
| Bonus content | Retry-After section (extra) | None (focused) | Depends on need |
| Guide compliance | Missed before/after pattern | Followed template exactly | NEW |
| Token cost of guide | 4,272 tokens consumed | 2,374 tokens consumed | **NEW (-44%)** |

**Key finding:** The compressed guide's inline template format (`## Core Pattern — Before/after code comparison`) was clearer than the verbose version's buried instruction. Agent B (NEW) produced a proper before/after code comparison; Agent A (OLD) missed it entirely and wrote pseudocode instead.

**Conclusion:** 44% fewer tokens consumed, equal or better output quality. The compression improved instruction clarity by making the template scannable rather than buried in prose.
