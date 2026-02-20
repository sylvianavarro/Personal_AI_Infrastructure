---
name: Asset Management
pack-id: sylvianavarro-asset-management-core-v1.0.0
version: 1.0.0
author: sylvianavarro
description: Manifest-driven brand asset management with constraint enforcement. Manages colors, typography, icons, logos, and images per-project with global defaults. Includes Initialize, Create, and Audit workflows.
type: skill
purpose-type: [creativity, development]
platform: agnostic
dependencies: [danielmiessler-core-install-core-v1.0.0]
keywords: [assets, brand, design, colors, typography, icons, logos, images, manifest, constraints, audit]
---

<!-- NOTE: Pack icon generation is a TODO — see PR notes -->

# Asset Management

> Manifest-driven brand asset management with constraint enforcement for AI agents

## Installation Prompt

You are receiving a PAI Pack - a modular upgrade for AI agent systems.

**What is PAI?** See: [PAI Project Overview](../README.md#what-is-pai)

**What is a Pack?** See: [Pack System](../README.md#the-journey-pai-v1x--v20)

This pack adds a complete brand asset management system to your AI agent:

- **Manifest-Driven**: A single JSON manifest defines all brand constraints — colors, typography, icons, logos, images
- **Constraint Enforcement**: The AI checks the manifest before creating any visual asset, ensuring brand consistency
- **Three Workflows**: Initialize (set up a project), Create (generate assets within constraints), Audit (verify brand compliance)
- **Per-Project Overrides**: Global defaults with project-specific customization

**Core Philosophy:** Brand consistency shouldn't depend on memory — it should be enforced by structure.

Please follow the installation instructions below to integrate this pack into your infrastructure.

---

## What's Included

| Component | File | Purpose |
|-----------|------|---------|
| Asset Management Skill | `skills/AssetManagement/SKILL.md` | Main skill with routing and reference |
| Manifest Schema | `skills/AssetManagement/ManifestSchema.md` | JSON schema for brand manifests |
| Initialize Workflow | `skills/AssetManagement/Workflows/Initialize.md` | Project asset setup workflow |
| Create Workflow | `skills/AssetManagement/Workflows/Create.md` | Asset creation within constraints |
| Audit Workflow | `skills/AssetManagement/Workflows/Audit.md` | Brand compliance audit |
| Default Manifest | `assets/manifest.json` | Template manifest with default values |
| Brand Rules | `assets/guidelines/brand-rules.md` | Default brand guidelines |

**Summary:**
- **Files created:** 7 (1 skill + 1 schema + 3 workflows + 2 templates)
- **Hooks registered:** 0 (skill-based, no hooks needed)
- **Dependencies:** core-install (for skill routing)

---

## The Concept

### The Problem

AI agents generating visual assets (icons, logos, color schemes, images) have no brand memory. Without constraints:

1. **Colors drift** — Each generation picks different shades with no consistency
2. **Typography varies** — Font choices change between sessions
3. **Icon styles clash** — Flat icons next to detailed ones with no coherence
4. **Brand rules forgotten** — Guidelines exist in docs nobody reads
5. **No audit trail** — Can't verify assets comply with brand standards

### Who Needs This

- Developers building branded applications who use AI for asset generation
- Teams maintaining design systems who want AI-enforced consistency
- Anyone generating visual assets with AI who needs brand compliance

---

## The Solution

A **manifest-driven constraint system** where a single JSON file defines all brand rules, and workflows enforce those rules at every asset creation point.

**Core Architecture:**

```
                    ┌─────────────────────┐
                    │   manifest.json     │
                    │  (brand truth)      │
                    └──────────┬──────────┘
                               │
              ┌────────────────┼────────────────┐
              ▼                ▼                 ▼
     ┌────────────┐   ┌────────────┐   ┌────────────┐
     │ Initialize │   │   Create   │   │   Audit    │
     │  Workflow  │   │  Workflow  │   │  Workflow  │
     └────────────┘   └────────────┘   └────────────┘
          │                 │                 │
     Set up project    Generate assets   Verify compliance
     manifest          within constraints  against manifest
```

**Design Principles:**
1. **Single Source of Truth** — manifest.json is the authority
2. **Constraints, Not Suggestions** — Rules are enforced, not advisory
3. **Per-Project Overrides** — Projects can customize while inheriting defaults
4. **Audit-Ready** — Any asset can be verified against the manifest

## What Makes This Different

This sounds similar to "design tokens" which also provide centralized design constants. What makes this approach different?

Design tokens define values; this system enforces them through active workflows. The manifest isn't just a reference file — it's read by AI workflows that refuse to create off-brand assets. The Initialize workflow sets up constraints, Create checks them before generating, and Audit verifies compliance after the fact. It's a closed enforcement loop, not a reference document.

- Manifest enforces constraints through active workflow checks
- Three workflows cover full asset lifecycle completely
- Per-project overrides inherit from global brand defaults
- Audit workflow verifies compliance against manifest automatically

---

## Installation

### Prerequisites

- **Claude Code** (or compatible AI agent with skill support)
- **core-install** (for skill directory structure and routing)

### Step 1: Create Directory Structure

```bash
SKILLS_DIR="${PAI_DIR:-$HOME/.config/pai}/skills"
ASSETS_DIR="${PAI_DIR:-$HOME/.config/pai}/assets"

mkdir -p "$SKILLS_DIR/AssetManagement/Workflows"
mkdir -p "$ASSETS_DIR/guidelines"
mkdir -p "$ASSETS_DIR/colors"
mkdir -p "$ASSETS_DIR/typography"
mkdir -p "$ASSETS_DIR/icons"
mkdir -p "$ASSETS_DIR/images"
```

### Step 2.1: Create AssetManagement/SKILL.md

Create file: `$SKILLS_DIR/AssetManagement/SKILL.md`

```markdown
---
name: AssetManagement
description: Brand asset management with constraint enforcement. USE WHEN creating images, logos, icons, colors, typography, visual assets, or auditing brand consistency for any project.
---

# AssetManagement

Manages design assets (images, icons, colors, logos, typography) per-project with global defaults. Loads brand constraints and reference images so generated assets stay visually consistent.

**Project-agnostic** — any project gets its own manifest, and the skill enforces whatever brand that manifest defines.

## Manifest Loading (Mandatory Pre-Flight)

Before ANY asset operation:

1. Check project: `<project-root>/.claude/assets/manifest.json`
2. Check global: `~/.claude/assets/manifest.json`
3. If both exist: deep-merge (project overrides global per-key; arrays replace, not concat)
4. If neither exists: suggest Initialize workflow
5. Read all `references` paths (multimodal — Claude views the images)
6. Read `guidelines/brand-rules.md` if present

See `ManifestSchema.md` for full schema and merge rules.

## Workflow Routing

| Workflow | Trigger | File |
|----------|---------|------|
| **Initialize** | "init assets", "set up brand", "scaffold assets" | `Workflows/Initialize.md` |
| **Create** | "create icon", "generate logo", "new color", "make image" | `Workflows/Create.md` |
| **Audit** | "audit brand", "check assets", "brand compliance" | `Workflows/Audit.md` |

## Key Rules

1. **Constraints are hard rules** — reject violations, don't suggest alternatives silently
2. **Read references before generating** — always view mood board / reference images first
3. **Suggest existing before creating new** — search project assets for duplicates
4. **Output to project assets folder** — `<project>/.claude/assets/<type>/`
5. **Global is fallback only** — never write to `~/.claude/assets/` during Create

## Integration

| Skill | Relationship |
|-------|-------------|
| `brainstorming` | May trigger asset creation; this skill enforces constraints on output |
| `ui-review` | Audit workflow complements ui-review's visual audit checklist |

## Examples

**Example 1: Initialize project assets**
```
User: "Set up brand assets for this project"
-> Invokes Initialize workflow
-> Scaffolds .claude/assets/ with manifest template
-> Asks for brand name and primary color
```

**Example 2: Create an icon**
```
User: "Create a settings icon for the app"
-> Invokes Create workflow
-> Loads manifest -> reads references -> checks existing icons
-> Enforces icon style (outline/solid), strokeWidth, sizes from manifest
-> Saves to .claude/assets/icons/
```

**Example 3: Audit brand compliance**
```
User: "Check if our assets follow the brand guidelines"
-> Invokes Audit workflow
-> Loads manifest -> scans all asset directories
-> Reports violations: CRITICAL / WARNING / INFO with fixes
```
```

### Step 2.2: Create AssetManagement/ManifestSchema.md

Create file: `$SKILLS_DIR/AssetManagement/ManifestSchema.md`

```markdown
# Manifest Schema

Single source of truth for brand assets per project. Located at `.claude/assets/manifest.json`.

## Template

```json
{
  "brand": "BrandName",
  "version": "1.0.0",
  "palette": {
    "primary": { "hex": "#000000", "usage": "Main brand color, CTAs, primary buttons" },
    "secondary": { "hex": "#666666", "usage": "Supporting elements, secondary buttons" },
    "accent": { "hex": "#0066FF", "usage": "Highlights, links, interactive elements" },
    "background": { "hex": "#FFFFFF", "usage": "Page backgrounds, card surfaces" },
    "foreground": { "hex": "#1A1A1A", "usage": "Body text, headings" },
    "muted": { "hex": "#F5F5F5", "usage": "Disabled states, subtle backgrounds" },
    "error": { "hex": "#DC2626", "usage": "Error states, destructive actions" },
    "success": { "hex": "#16A34A", "usage": "Success states, confirmations" },
    "warning": { "hex": "#CA8A04", "usage": "Warning states, caution indicators" }
  },
  "typography": {
    "families": {
      "heading": "Inter",
      "body": "Inter",
      "mono": "JetBrains Mono"
    },
    "weights": [400, 500, 600, 700],
    "scale": {
      "xs": "0.75rem",
      "sm": "0.875rem",
      "base": "1rem",
      "lg": "1.125rem",
      "xl": "1.25rem",
      "2xl": "1.5rem",
      "3xl": "1.875rem",
      "4xl": "2.25rem"
    }
  },
  "icons": {
    "style": "outline",
    "strokeWidth": 1.5,
    "library": "lucide",
    "sizes": {
      "sm": 16,
      "md": 20,
      "lg": 24,
      "xl": 32
    }
  },
  "logos": {
    "primary": { "path": "images/logos/primary.svg", "usage": "Main logo, headers, splash screens" },
    "mark": { "path": "images/logos/mark.svg", "usage": "Favicon, app icon, compact spaces" },
    "wordmark": { "path": "images/logos/wordmark.svg", "usage": "Text-only variant, documents" }
  },
  "images": {
    "style": "clean, minimal, professional",
    "aspectRatios": ["16:9", "1:1", "4:3"],
    "treatments": ["none", "rounded-lg", "shadow-md"],
    "maxFileSize": "500KB"
  },
  "constraints": {
    "minContrastRatio": 4.5,
    "maxColors": 9,
    "spacingUnit": 4,
    "borderRadius": "0.5rem",
    "maxIconStrokeWidth": 2,
    "allowedImageFormats": ["svg", "png", "webp"]
  },
  "references": []
}
```

## Required Keys

These keys MUST be present in every manifest:

| Key | Type | Description |
|-----|------|-------------|
| `brand` | string | Brand/project name |
| `version` | string | Semver version of the manifest |
| `palette` | object | Semantic color map — each value has `hex` + `usage` |
| `constraints` | object | Hard rules enforced during Create and Audit |

All other keys are optional. Missing keys fall back to global manifest values (if global exists) or are simply absent.

## Merge Strategy (Global + Project)

When both `~/.claude/assets/manifest.json` and `<project>/.claude/assets/manifest.json` exist:

| Scenario | Rule |
|----------|------|
| Key exists in both | Project value wins (deep merge at each level) |
| Key only in global | Global value used as fallback |
| Key only in project | Project value used |
| Array values | Project replaces global entirely (no concatenation) |
| Nested objects | Recursive merge — project overrides matching keys |
| Neither has key | Key is absent |

### Merge Example

**Global:**
```json
{
  "palette": {
    "primary": { "hex": "#000000", "usage": "Default primary" },
    "secondary": { "hex": "#666666", "usage": "Default secondary" }
  },
  "constraints": { "minContrastRatio": 4.5, "maxColors": 9 }
}
```

**Project:**
```json
{
  "palette": {
    "primary": { "hex": "#1E40AF", "usage": "Brand blue" }
  },
  "constraints": { "minContrastRatio": 7.0 }
}
```

**Merged result:**
```json
{
  "palette": {
    "primary": { "hex": "#1E40AF", "usage": "Brand blue" },
    "secondary": { "hex": "#666666", "usage": "Default secondary" }
  },
  "constraints": { "minContrastRatio": 7.0, "maxColors": 9 }
}
```

## Validation Rules

When loading a manifest, verify:

1. `brand` is a non-empty string
2. `version` matches semver pattern (`X.Y.Z`)
3. Every `palette` entry has both `hex` (valid hex color) and `usage` (non-empty string)
4. `constraints.minContrastRatio` is a number >= 1.0
5. `constraints.maxColors` is a positive integer
6. All `logos[*].path` files actually exist on disk
7. All `references[*]` paths are readable files
```

### Step 2.3: Create AssetManagement/Workflows/Initialize.md

Create file: `$SKILLS_DIR/AssetManagement/Workflows/Initialize.md`

```markdown
# Initialize Workflow

Scaffolds the asset directory structure and generates a starter manifest.

## Steps

### 1. Detect Context

Determine scope:
- **Global init** -> target is `~/.claude/assets/`
- **Project init** -> target is `<project-root>/.claude/assets/`

If user doesn't specify, default to **project init** (more common).

### 2. Check Existing State

- If target directory already exists:
  - List current contents
  - Ask: **merge** (add missing dirs/keys), **overwrite** (replace), or **abort**
- If initializing project and global exists:
  - Offer to copy global manifest as starting point

### 3. Gather Brand Info

Ask the user for:
1. **Brand name** (required)
2. **Primary color** (hex — required)
3. **Secondary color** (hex — optional, will default to muted gray)

Do not ask for more. Start minimal — user can edit manifest later.

### 4. Scaffold Directory Structure

Create:
```
<target>/
├── manifest.json
├── colors/
├── typography/
├── icons/
├── images/
│   ├── logos/
│   ├── patterns/
│   └── references/
└── guidelines/
    └── brand-rules.md
```

### 5. Generate manifest.json

Use the template from `ManifestSchema.md`. Fill in:
- `brand` -> user's brand name
- `palette.primary.hex` -> user's primary color
- `palette.secondary.hex` -> user's secondary color (or `#6B7280` default)
- All other values -> template defaults

### 6. Generate brand-rules.md

Create a placeholder with sections:
```markdown
# Brand Rules — {BrandName}

## Voice & Tone
[Describe brand voice — professional, playful, technical, etc.]

## Color Usage
- Primary: Use for CTAs and key interactive elements
- Never combine error + warning colors adjacently

## Logo Usage
- Minimum clear space: 1x logo height on all sides
- Never stretch, rotate, or recolor the logo

## Typography
- Headings: [heading font], weights 600-700
- Body: [body font], weight 400-500
- Never use more than 2 font families on one screen

## Do / Don't
- DO maintain consistent spacing using the spacing unit
- DON'T use colors outside the defined palette
- DON'T use icon styles inconsistent with the manifest
```

### 7. Confirm

Report what was created:
- Full directory listing
- Key manifest values (brand, primary color, contrast ratio)
- Next step: "Edit `manifest.json` to customize, or use **Create** workflow to start making assets"
```

### Step 2.4: Create AssetManagement/Workflows/Create.md

Create file: `$SKILLS_DIR/AssetManagement/Workflows/Create.md`

```markdown
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
```

### Step 2.5: Create AssetManagement/Workflows/Audit.md

Create file: `$SKILLS_DIR/AssetManagement/Workflows/Audit.md`

```markdown
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
```

### Step 2.6: Create Default Manifest

Create file: `$ASSETS_DIR/manifest.json`

```json
{
  "brand": "Global Defaults",
  "version": "1.0.0",
  "palette": {
    "primary": { "hex": "#1A1A1A", "usage": "Default primary, headings, key UI elements" },
    "secondary": { "hex": "#6B7280", "usage": "Supporting text, secondary elements" },
    "accent": { "hex": "#3B82F6", "usage": "Links, interactive elements, focus states" },
    "background": { "hex": "#FFFFFF", "usage": "Page backgrounds, card surfaces" },
    "foreground": { "hex": "#111827", "usage": "Body text" },
    "muted": { "hex": "#F3F4F6", "usage": "Disabled states, subtle backgrounds" },
    "error": { "hex": "#DC2626", "usage": "Error states, destructive actions" },
    "success": { "hex": "#16A34A", "usage": "Success confirmations" },
    "warning": { "hex": "#CA8A04", "usage": "Warning indicators" }
  },
  "typography": {
    "families": {
      "heading": "Inter",
      "body": "Inter",
      "mono": "JetBrains Mono"
    },
    "weights": [400, 500, 600, 700],
    "scale": {
      "xs": "0.75rem",
      "sm": "0.875rem",
      "base": "1rem",
      "lg": "1.125rem",
      "xl": "1.25rem",
      "2xl": "1.5rem",
      "3xl": "1.875rem",
      "4xl": "2.25rem"
    }
  },
  "icons": {
    "style": "outline",
    "strokeWidth": 1.5,
    "library": "lucide",
    "sizes": {
      "sm": 16,
      "md": 20,
      "lg": 24,
      "xl": 32
    }
  },
  "logos": {},
  "images": {
    "style": "clean, minimal, professional",
    "aspectRatios": ["16:9", "1:1", "4:3"],
    "treatments": ["none", "rounded-lg", "shadow-md"],
    "maxFileSize": "500KB"
  },
  "constraints": {
    "minContrastRatio": 4.5,
    "maxColors": 9,
    "spacingUnit": 4,
    "borderRadius": "0.5rem",
    "maxIconStrokeWidth": 2,
    "allowedImageFormats": ["svg", "png", "webp"]
  },
  "references": []
}
```

### Step 2.7: Create Brand Rules

Create file: `$ASSETS_DIR/guidelines/brand-rules.md`

```markdown
# Brand Rules — Global Defaults

These are baseline rules inherited by all projects unless overridden by a project-level manifest.

## Voice & Tone
[Define per project — no global default]

## Color Usage
- Primary: Use for CTAs and key interactive elements
- Never combine error + warning colors adjacently
- All text/background pairs must meet WCAG AA contrast (4.5:1 minimum)

## Logo Usage
[Define per project — logos are always project-specific]

## Typography
- Headings: Inter, weights 600-700
- Body: Inter, weight 400-500
- Mono: JetBrains Mono for code blocks
- Never use more than 2 font families on one screen

## Icons
- Style: outline only (no filled/solid mixing)
- Stroke width: 1.5px consistent
- Prefer Lucide library before custom icons

## Do / Don't
- DO maintain consistent spacing using multiples of 4px
- DO use semantic color names from the palette
- DON'T use colors outside the defined palette
- DON'T mix icon styles (outline + solid) on the same screen
- DON'T use image formats outside the allowed list (svg, png, webp)
```

### Step 3: Verify Installation

```bash
SKILLS_DIR="${PAI_DIR:-$HOME/.config/pai}/skills"
ASSETS_DIR="${PAI_DIR:-$HOME/.config/pai}/assets"

# Check skill files
for file in AssetManagement/SKILL.md AssetManagement/ManifestSchema.md AssetManagement/Workflows/Initialize.md AssetManagement/Workflows/Create.md AssetManagement/Workflows/Audit.md; do
  if [ -f "$SKILLS_DIR/$file" ]; then
    echo "✓ $file installed"
  else
    echo "✗ $file MISSING"
  fi
done

# Check asset templates
for file in manifest.json guidelines/brand-rules.md; do
  if [ -f "$ASSETS_DIR/$file" ]; then
    echo "✓ $file installed"
  else
    echo "✗ $file MISSING"
  fi
done
```

---

## Example Usage

### Example 1: Initialize a New Project

```
User: "Set up brand assets for my new project"
AI: [Invokes AssetManagement -> Initialize workflow]
  -> Asks about brand colors, fonts, icon style
  -> Creates project-specific manifest.json
  -> Sets up asset directory structure
```

### Example 2: Create an Icon

```
User: "Create a settings icon for the app"
AI: [Invokes AssetManagement -> Create workflow]
  -> Reads manifest.json for icon constraints (style, size, colors)
  -> Generates icon within brand constraints
  -> Saves to assets/icons/ directory
```

### Example 3: Audit Brand Compliance

```
User: "Audit our assets for brand consistency"
AI: [Invokes AssetManagement -> Audit workflow]
  -> Scans all assets against manifest constraints
  -> Reports violations (wrong colors, inconsistent styles)
  -> Suggests fixes for non-compliant assets
```

---

## Configuration

No configuration required beyond the manifest.json file created during initialization.

**Environment variables (optional):**
- `PAI_DIR` — Base directory for PAI installation (default: `~/.config/pai`)

---

## Customization

### Recommended Customization

**What to Customize:** The manifest.json and brand-rules.md

**Why:** These define YOUR brand. The defaults are generic starting points.

**Process:**
1. Run the Initialize workflow to create a project-specific manifest
2. Update colors, typography, and icon styles to match your brand
3. Add project-specific guidelines to brand-rules.md
4. The Create and Audit workflows will automatically use your customized manifest

**Expected Outcome:** All AI-generated assets automatically comply with your brand standards.

### Optional Customization

| Customization | File | Impact |
|--------------|------|--------|
| Add logo specs | `manifest.json` | Logo generation follows your specs |
| Custom icon sizes | `manifest.json` | Icons generated at project-specific sizes |
| Additional guidelines | `brand-rules.md` | More detailed brand enforcement |

---

## Credits

- **Author**: sylvianavarro — developed during production use of PAI/Kai system
- **Built on**: Daniel Miessler's PAI framework and Kai skill architecture

## Related Work

*None specified.*

## Works Well With

- **core-install** — Required foundation for skill routing
- **art-skill** — Art generation that can use manifest constraints

## Recommended

*None specified.*

## Relationships

### Parent Of
*None specified.*

### Child Of
*None specified.*

### Sibling Of
*None specified.*

### Part Of Collection
*None specified.*

## Changelog

### 1.0.0 - 2026-02-06
- Initial release
- Manifest-driven brand constraint system
- Three workflows: Initialize, Create, Audit
- Default manifest and brand rules templates
