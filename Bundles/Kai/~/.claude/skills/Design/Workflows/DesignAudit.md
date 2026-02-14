# DesignAudit Workflow

Comprehensive design audit for frontend code against design system and best practices.

## Trigger

- "audit design"
- "check design"
- Auto-triggered when editing frontend files

## Process

### 1. Find Design Spec
```
1. Search for design spec in project:
   - docs/plans/*design*.md
   - DESIGN.md, design-system.md
   - .design/tokens.css
   - tailwind.config.* (extract design tokens)

2. If not found:
   - Ask: "No design system found. Create one first? (y/n)"
   - If yes: Invoke CreateDesignSpec workflow
   - If no: Use sensible defaults with warnings
```

### 2. Run Sub-Skill Audits (Parallel)

```
Invoke in parallel:
├── SubSkills/UX.md audit checklist
├── SubSkills/A11y.md audit checklist
├── SubSkills/Responsive.md audit checklist
└── SubSkills/Trends.md audit checklist
```

### 3. Normalize Severity

Each sub-skill uses the same 4-level severity system. When aggregating, normalize any skill-specific language to these levels:

| Level | Sub-Skill Equivalents | Action |
|-------|----------------------|--------|
| **Blocker** | a11y "Critical", ui-review "Blocker", brand "P0" | Must fix before ship |
| **Critical** | a11y "Major", ui-review "Critical", responsive "grade D-F", brand "P1" | Should fix before ship |
| **Warning** | a11y "Minor", ui-review "Warning", responsive "grade C", brand "P2" | Fix when possible |
| **Info** | all "Info/suggestion", responsive "grade B+", brand "P3" | Consider for future |

### 4. Deduplicate Findings

Multiple sub-skills will flag the same underlying issue. Before presenting results:

```
1. Group findings by file:line — same location = likely same issue
2. When duplicate found:
   - Keep the finding with the most specific fix
   - Note which sub-skills independently flagged it (adds confidence)
   - Use the highest severity from any sub-skill
3. Tag deduplicated findings: "[a11y+brand]" or "[ux+responsive]"
```

### 5. Present Findings

Format:
```markdown
## Design Audit Results

**Sub-skills run:** [list skills invoked]
**Deduplication:** X findings merged from Y raw findings across Z sub-skills

### Blockers (2)
1. **[a11y]** Missing alt text on `<img>` at line 45
   - WCAG 1.1.1 Non-text Content
   - Fix: `<img src="..." alt="Description of image">`

2. **[a11y+brand]** Color contrast 2.8:1 below 4.5:1 minimum
   - WCAG 1.4.3 Contrast (flagged by a11y + brand audit)
   - Fix: Change `#888` to `#666` for 5.1:1 ratio

### Critical (1)
1. **[ux]** 12 options in dropdown exceeds Hick's Law threshold
   - Consider: Group into categories or use search

### Warnings (3)
1. **[responsive]** Touch target 32x32px below 44x44px ideal
2. **[trends]** Animating `width` causes reflow; use `transform: scaleX()`
3. **[design-system]** Using `#5BBCB4` instead of token `--color-teal`

### Top 5 Priority Fixes
[Ranked by: Blocker > Critical > Warning, then by number of sub-skills that flagged it]
```

### 6. Provide Fixes

For each issue, provide:
- Specific line number
- What's wrong (with evidence/citation)
- Exact code fix

### 7. Verify Fixes

After user applies fixes:
- Re-run affected checks
- Confirm resolution
- Note any new issues introduced

## Severity Definitions

| Level | Criteria | Action |
|-------|----------|--------|
| **Blocker** | A11y violation, functionality broken, security issue | Must fix before commit |
| **Critical** | Major UX violation, design system inconsistency, performance issue | Should fix before commit |
| **Warning** | Minor deviation, best practice not followed | Fix when possible |
| **Info** | Enhancement suggestion, alternative approach | Consider for future |

## Output Format

Always include:
- Total counts by severity
- Specific file:line references
- Citation (WCAG, Law of UX, design token)
- Copy-paste fix
