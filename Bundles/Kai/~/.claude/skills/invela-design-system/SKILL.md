---
name: invela-design-system
description: Use when checking current DS state, making token decisions, or documenting component specs. Self-improving - updates as the design system evolves.
---

# Invela Design System State

Current state tracking for the Invela design system.

## Self-Improving Skill
This skill evolves as DS decisions are made. Update after each milestone.

## Current Status

| Category | Status | Progress | Notes |
|----------|--------|----------|-------|
| Typography | ✅ Complete | 100% | 12px min, curly quotes, line-height ratios |
| Spacing | ✅ Complete | 100% | 16 values, kept 6px + 20px |
| Colors | ✅ Complete | 90% | 12-step scales, Radix-harmonized status |
| Dark Mode | ✅ Complete | 90% | Values defined, needs implementation |
| Border Radius | ✅ Complete | 100% | 8-value scale, nested rule |
| Shadows | ✅ Complete | 100% | Blue-tinted light, elevation+shadow dark |
| Transitions | ✅ Complete | 100% | 7 durations, 5 easings |
| Components | ⏳ Planned | 0% | Awaiting token implementation |

## Verified Decisions

> **Brand values are maintained in `invela-brand/`** — that skill is the single source of truth for all token values. This file tracks *DS status and decisions*, not raw values.

### Typography
See `invela-brand/typography.md` for the complete type scale, font stack, and CSS variables.
- **Monospace**: JetBrains Mono / system monospace (Invela addition, not in brand book)

### Spacing
See `invela-brand/spacing.md` for the full 16-value scale and component guidelines.

### Colors (12-Step Radix-Aligned System)
See `invela-brand/colors.md` for complete 12-step values (blue, gray, status, AI, semantic tokens).

**Architecture:** Brand book colors as anchors, interpolated values for gaps.

### Border Radius (8-Value Scale)
See `invela-brand/radius.md` for the full scale, nested radius rule, and component guidelines.

### Shadows (7-Level Layered Scale)
See `invela-brand/shadows.md` for CSS values, dark mode variants, and component guidelines.

**Philosophy:** Every shadow uses 2 layers (ambient + direct) per Vercel guidelines.

### Transitions (Duration + Easing)
See `invela-brand/transitions.md` for duration scale, easing functions, and component patterns.

### Breakpoints
See `responsive-dark-mode/breakpoints.md` for the full 8-breakpoint scale (xs 320px through 4xl 2560px).

## Completed Decisions

### Dark Mode ✅
See `invela-brand/colors.md` for all dark mode 12-step scale values and `invela-brand/shadows.md` for dark elevation surfaces.
- [x] All 12-step scales have dark mode values
- [x] Status colors have dark mode variants
- [x] Elevation + shadow approach confirmed

### Border Radius ✅
See `invela-brand/radius.md` for values.
- [x] 8-value scale, Radix-aligned + MD3
- [x] Nested radius rule, component guidelines, Tailwind config

### Shadows ✅
See `invela-brand/shadows.md` for values.
- [x] 7-level layered scale (ambient + direct)
- [x] Blue-tinted light mode, elevation + shadow dark mode
- [x] Focus rings, colored shadows, component guidelines

### Transitions ✅
See `invela-brand/transitions.md` for values.
- [x] 7 durations, 5 easings, GPU-only enforcement
- [x] Reduced motion support, component patterns, keyframes

## Pending Decisions

### Component Library
- [ ] Button variants
- [ ] Form elements
- [ ] Navigation components
- [ ] Data display components
- [ ] Feedback components

## Authoritative Sources (Internal)

| # | Document | Location | Purpose |
|---|----------|----------|---------|
| 1 | Brand Book | PPTX | Color/typography source |
| 2 | _BRAND_BOOK_EXTRACT.md | docs/ | Extracted brand values |
| 3 | _MASTER_PLAN.md | docs/ | Project roadmap |
| 4 | _LEARNING_LOG.md | docs/ | Decision history |
| 5 | Figma Variables | TBD | Design tokens |
| 6 | tailwind.config.js | src/ | Code implementation |

## Update Protocol

When making DS decisions:
1. Document the decision here
2. Update _LEARNING_LOG.md with rationale
3. Update ds-audit-handoff skill with delta
4. Implement in Figma/code

## Audit Mode: External Projects

When auditing Invela projects that don't use the main platform stack (e.g., Vite/vanilla CSS instead of Next.js/Tailwind/Radix):

### Step 0: Detect Project Stack

```
1. Check package.json for framework (next, vite, cra, etc.)
2. Check for tailwind.config.* — if absent, it's vanilla CSS
3. Check for Radix imports — if absent, skip Radix-specific checks
4. Check for CSS custom properties in :root — this is the token system
```

### Adapt Audit Scope

| Main Platform | External Project | Audit Adjustment |
|--------------|-----------------|------------------|
| Tailwind utilities | Vanilla CSS classes | Check CSS custom properties for token usage |
| Radix primitives | Custom components | Check semantic HTML and ARIA instead of Radix patterns |
| Next.js routing | Vite SPA / static | Skip SSR-specific checks |
| Tailwind `dark:` | `prefers-color-scheme` or none | Check native CSS dark mode approach |

### What Still Applies

Regardless of stack, these Invela DS requirements apply to all projects:
- Brand colors must match `invela-brand` values (hex verification)
- Typography must use approved font families
- Touch targets must meet 44px AAA standard
- Accessibility tokens (focus ring, reduced motion) must be present
- Spacing should use a tokenized system (even if not the same token names)

### What Doesn't Apply

Skip these for non-platform projects:
- Radix component API patterns
- Tailwind config structure
- Component library completeness (Button, Card, Input, Toast)
- Design token naming conventions (project may use its own namespace)

## Usage

Query this skill for:
- "What's the current color system?"
- "Is dark mode implemented?"
- "What's the button specification?"
- "Audit [project] against Invela DS" (triggers external project mode if non-platform stack detected)
