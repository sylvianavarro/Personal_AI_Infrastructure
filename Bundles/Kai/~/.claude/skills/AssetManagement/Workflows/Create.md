# Create Workflow

Generates new assets under brand constraints defined in the manifest.

## Pre-Flight (Mandatory)

Before creating anything:

1. **Load manifest** — project -> global -> merge (see ManifestSchema.md merge rules)
2. **No manifest?** -> Stop. Suggest Initialize workflow. Do not proceed without constraints.
3. **Read all reference images** — every path in `references[]` array (multimodal read)
4. **Read brand-rules.md** — if it exists in the assets directory

## DRY Check

Before creating a new asset:

1. Search existing assets in `<project>/.claude/assets/<type>/` for similar items
2. Search global assets in `~/.claude/assets/<type>/` for reusable items
3. If a match exists: suggest reuse, show the existing asset, ask user to confirm creation

## Type-Specific Handling

### Colors

- Validate against `palette` — new colors must have `hex` + `usage`
- Check contrast ratio against `constraints.minContrastRatio` for text colors
- Enforce `constraints.maxColors` — reject if adding would exceed limit
- Output: add to `manifest.json` palette (not a separate file)

### Icons

- Enforce `icons.style` (outline vs solid) — reject wrong style
- Enforce `icons.strokeWidth` — reject if inconsistent
- Prefer `icons.library` if specified (e.g., suggest Lucide icon name before custom)
- Validate size against `icons.sizes`
- Output: `<project>/.claude/assets/icons/<name>.<format>`

### Logos

- Check if variant already exists in `logos` manifest entry
- Enforce format from `constraints.allowedImageFormats`
- Output: `<project>/.claude/assets/images/logos/<variant>.<format>`
- Update `logos` in manifest with path + usage

### Images

- Enforce `images.aspectRatios` — reject non-approved ratios
- Apply `images.treatments` as specified
- Check `images.maxFileSize` if generating raster
- Match `images.style` description
- Output: `<project>/.claude/assets/images/<name>.<format>`

### Typography

- Only allow fonts listed in `typography.families`
- Only allow weights listed in `typography.weights`
- Validate size against `typography.scale`
- Output: update manifest (typography is config, not files)

## Constraint Enforcement

**Hard rejection** on:
- Color outside palette without explicit user override
- Contrast ratio below `minContrastRatio`
- Icon style mismatch
- Image format not in `allowedImageFormats`
- Exceeding `maxColors`

When rejecting:
1. State which constraint was violated
2. Show the constraint value from manifest
3. Suggest a compliant alternative
4. Ask: override (with explicit acknowledgment) or use suggestion

## Output

- Save generated assets to `<project>/.claude/assets/<type>/`
- Update manifest if the asset type tracks paths (logos, references)
- Report: what was created, where it was saved, which constraints were checked
