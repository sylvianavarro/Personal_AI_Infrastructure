---
name: invela-brand
description: Use when working on Invela design system, UI components, or any visual design decisions. Provides verified brand colors, typography, iconography guidelines. Self-improving - updates with brand changes.
---

# Invela Brand Expert

Single source of truth for Invela brand guidelines.

## Quick Reference

### Core Colors
| Name | Hex | RGB | Use |
|------|-----|-----|-----|
| Black | `#181818` | 24, 24, 24 | Primary text |
| White | `#FFFFFF` | 255, 255, 255 | Backgrounds |
| Deep Blue | `#4166F5` | 65, 102, 245 | Primary brand, CTAs |
| Middle Blue | `#9EC0F5` | 158, 192, 245 | Secondary, accents |
| Light Blue | `#ECF2FD` | 236, 242, 253 | Backgrounds, hover |

### AI Colors
| Name | Hex | RGB | Use |
|------|-----|-----|-----|
| AI Violet | `#4D14D8` | 77, 20, 216 | AI features, gradients |
| AI Lavender | `#C7B0FF` | 199, 176, 255 | AI accents, lighter |

### Gray Scale
| Name | Hex | Use |
|------|-----|-----|
| Near Black | `#181818` | Primary text |
| Dark Gray | `#222529` | Secondary text |
| Medium Gray | `#434343` | Tertiary text |
| Gray | `#B7B7B7` | Disabled states |
| Light Gray | `#D1D1D1` | Borders |
| Lighter Gray | `#E1E1E1` | Subtle borders |
| Very Light | `#EBEBEB` | Backgrounds |

### Typography
| Font | Weight | Use |
|------|--------|-----|
| Plus Jakarta Sans | Bold | Main titles, headings |
| Plus Jakarta Sans | SemiBold | Secondary titles |
| Plus Jakarta Sans | Light | Body (app) |
| Lexend | Light | Subheads, body (marketing) |
| Lexend | Extra Light | Body copy (marketing) |
| Sulphur Point | Bold | ALL CAPS labels, overlines |

### Iconography
- **Library:** Lucide Icons
- **Style:** Stroke only, round end caps, slightly rounded corners
- **Sizes:** 12px, 16px, 20px, 24px, 32px, 48px

## Extended Reference

For detailed specifications, see:
- `colors.md` - Full color palette with data viz opacity variants
- `typography.md` - Complete typography scale with line heights

## Brand Voice
**Traits:** Progressive, Serious, Bold, Realistic, Urban
**Voice:** Informed, Assured, Decisive
**Tagline:** "Open finance, covered."

## Audit Mode: Brand Compliance Scoring

When auditing a project for brand compliance, use this weighted scoring methodology:

### Scoring Categories

| Category | Weight | What to Check |
|----------|--------|---------------|
| Primary brand color (CSS/tokens) | 25% | Are `#4166F5` (Deep Blue) and scale used correctly in CSS/tokens? |
| Primary brand color (components) | 15% | Do React/Vue/etc. components use brand blue, not off-brand colors? |
| Typography | 15% | Correct font families (Plus Jakarta Sans, Lexend, Sulphur Point)? |
| Logo usage | 10% | Correct logo files present? No distortion or recoloring? |
| Visual identity (radius/shadow/spacing) | 15% | Consistent with DS tokens? |
| Asset integrity | 10% | All referenced images/icons exist and load? |
| PWA/meta brand consistency | 10% | manifest theme_color, meta theme-color, OG images match brand? |

### PWA Brand Checks

When a project has a PWA manifest or meta tags, verify:

```
1. manifest.json / manifest.webmanifest:
   - "theme_color" must be "#4166F5" (Deep Blue) — NOT orange, NOT black
   - "background_color" should match app background
   - Icons (192x192, 512x512) must exist in referenced path

2. index.html <head>:
   - <meta name="theme-color" content="#4166F5">
   - <meta name="msapplication-TileColor" content="#4166F5">
   - apple-touch-icon must exist at referenced path

3. Storybook (if present):
   - preview.ts "brand" background should use Invela blue, not orange
```

### Audit Output Template

```markdown
## Brand Compliance Audit: [Project Name]

### Scoring

| Category | Score | Weight | Weighted |
|----------|-------|--------|----------|
| Primary brand color (CSS) | X/100 | 25% | X.XX |
| Primary brand color (components) | X/100 | 15% | X.XX |
| Typography | X/100 | 15% | X.XX |
| Logo usage | X/100 | 10% | X.XX |
| Visual identity | X/100 | 15% | X.XX |
| Asset integrity | X/100 | 10% | X.XX |
| PWA/meta consistency | X/100 | 10% | X.XX |

**Overall Brand Compliance Score: X.X / 100**

### Priority Fixes (Ranked P0-P3)
[P0 = broken/off-brand, P1 = wrong values, P2 = missing assets, P3 = cosmetic]
```

## Self-Improvement

This skill should be updated when:
- Brand book is revised
- New colors are added to palette
- Typography scale changes
- New brand guidelines are established

**Last verified:** January 2026 (Brand Book Final 12.17.25.pptx)
