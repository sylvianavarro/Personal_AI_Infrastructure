# Audit Workflow

Checks all project assets against the manifest and reports violations.

## Pre-Flight

1. **Load manifest** — project -> global -> merge
2. **No manifest?** -> Stop. Report: "No manifest found. Run Initialize workflow first." Do not guess constraints.

## Checks

### Color Compliance
- Every color used in project code/assets appears in `palette`
- All text/background pairs meet `constraints.minContrastRatio`
- Total unique colors <= `constraints.maxColors`

### Typography Compliance
- All fonts used match `typography.families`
- All weights used are in `typography.weights`
- Font sizes align with `typography.scale` (or are proportional)

### Icon Consistency
- All icons match `icons.style` (no mixing outline + solid)
- Stroke widths match `icons.strokeWidth`
- Sizes are from `icons.sizes`

### Logo Usage
- All logo variants defined in manifest exist on disk
- No unauthorized logo modifications (check file hashes if originals tracked)

### Image Standards
- Formats match `constraints.allowedImageFormats`
- Aspect ratios are in `images.aspectRatios`

### Naming Conventions
- Files use kebab-case
- No spaces in filenames
- Descriptive names (not `image1.png`, `icon-2.svg`)

### Constraint Violations
- `minContrastRatio` — flag all failing pairs
- `maxColors` — flag if exceeded
- `borderRadius` — check for inconsistent values
- `spacingUnit` — check for non-multiple spacing values

## Report Format

Output a structured report:

```
## Asset Audit Report — {BrandName}

**Manifest version:** {version}
**Scanned:** {timestamp}

### Summary
- CRITICAL: {count}
- WARNING: {count}
- INFO: {count}

### CRITICAL
- [C001] Contrast ratio 2.1:1 between #FFFFFF text on #CCCCCC background (minimum: 4.5:1)
  -> Fix: darken background to at least #767676

### WARNING
- [W001] Icon `settings.svg` uses strokeWidth 2 (manifest: 1.5)
  -> Fix: regenerate with strokeWidth 1.5

### INFO
- [I001] No reference images defined in manifest
  -> Add mood board images to `references[]` for better consistency
```

## Severity Definitions

| Severity | Meaning | Action |
|----------|---------|--------|
| **CRITICAL** | Accessibility or brand violation that must be fixed | Blocks approval |
| **WARNING** | Inconsistency that should be fixed | Fix recommended |
| **INFO** | Suggestion for improvement | Optional |

## Post-Audit

After reporting:
1. Ask if user wants to auto-fix any violations (where possible)
2. For auto-fixable items: update manifest or regenerate assets
3. For manual items: provide exact instructions for fixing
