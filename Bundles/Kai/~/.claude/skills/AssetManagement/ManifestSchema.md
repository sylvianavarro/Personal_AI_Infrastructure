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
