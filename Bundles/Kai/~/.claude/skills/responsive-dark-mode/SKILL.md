---
name: responsive-dark-mode
description: Use when designing for multiple screen sizes (320px-2560px+), implementing responsive layouts, or building dark mode. Covers breakpoints xs/sm/md/lg/xl/2xl and dark theme patterns.
---

# Responsive Design & Dark Mode Expert

Complete reference for breakpoints (320px→2k+) and dark mode implementation.

## Breakpoint System

See `breakpoints.md` in this skill for the full breakpoint scale, device widths, Tailwind config, and CSS custom properties. Summary: 8 breakpoints from xs (320px) to 4xl (2560px), mobile-first.

## Dark Mode Implementation

### Invela Dark Mode Palette
Brand color values (light/dark): see `invela-brand/colors.md` for the authoritative 12-step blue, gray, and status color scales with both light and dark mode values.

See `dark-mode.md` in this skill for the complete dark mode implementation guide, including CSS implementation patterns, React/Next.js hooks, Tailwind config, elevation system, and component patterns.

### Dark Mode Contrast Validation
| Combination | Ratio | Status |
|-------------|-------|--------|
| #E0E0E0 on #181818 | 10.4:1 | AAA |
| #4166F5 on #181818 | 4.6:1 | AA |
| #A0A0A0 on #181818 | 6.0:1 | AAA |

## Authoritative Sources

| # | Source | URL | Use For |
|---|--------|-----|---------|
| 1 | Tailwind Responsive | https://tailwindcss.com/docs/responsive-design | Mobile-first approach |
| 2 | Tailwind Screens | https://tailwindcss.com/docs/screens | Breakpoint config |
| 3 | Chrome DevTools Devices | https://developer.chrome.com/docs/devtools/device-mode/ | Device sizes |
| 4 | StatCounter Screen Stats | https://gs.statcounter.com/screen-resolution-stats | Market data |
| 5 | Smashing Dark Mode | https://www.smashingmagazine.com/2020/04/dark-mode-react-apps-styled-components/ | Implementation |
| 6 | Apple Dark Mode HIG | https://developer.apple.com/design/human-interface-guidelines/dark-mode | Platform guidance |
| 7 | Material Dark Theme | https://m3.material.io/styles/color/dark-theme | DS approach |
| 8 | web.dev Dark Mode | https://web.dev/articles/prefers-color-scheme | System preference |
| 9 | CSS-Tricks Dark Mode | https://css-tricks.com/a-complete-guide-to-dark-mode-on-the-web/ | Complete guide |
| 10 | NNGroup Dark Mode | https://www.nngroup.com/articles/dark-mode/ | UX research |
| 11 | A11y Dark Mode | https://www.a11yproject.com/posts/operating-system-and-browser-accessibility-display-modes/ | Accessibility |
| 12 | Viewport Stats 2025 | https://www.browserstack.com/guide/responsive-design-breakpoints | Industry data |

## Audit Mode

When auditing a project for responsive design and dark mode compliance:

### Non-Tailwind Projects

Not all projects use Tailwind. When auditing vanilla CSS, CSS Modules, or other frameworks:

1. **Check for media queries** — search `@media` in CSS files for breakpoint coverage
2. **Check for CSS custom properties** — look for `:root` token definitions and dark mode overrides
3. **Check for `prefers-color-scheme`** — dark mode may be implemented via native CSS, not Tailwind `dark:`
4. **Map breakpoints to the 8-point scale** — even without Tailwind, audit against xs(320)→4xl(2560) coverage

### Dark Mode Ownership

Dark mode spans multiple skills. Ownership boundaries:

| Aspect | Owning Skill | What It Contains |
|--------|-------------|------------------|
| Color values (light + dark hex) | `invela-brand` | 12-step scales, status colors, semantic tokens |
| Implementation patterns (CSS/React) | `responsive-dark-mode` (this skill) | Media queries, toggle hooks, class strategies |
| Completion status & decisions | `invela-design-system` | Checklist of what's done, what's pending |

When auditing: check `invela-brand` for the *correct* dark color values, this skill for *how* they should be implemented, and `invela-design-system` for *whether* dark mode applies to this project.

### Audit Output Template

```markdown
## Responsive & Dark Mode Audit: [Project Name]

| Category | Status | Grade | Notes |
|----------|--------|-------|-------|
| Breakpoint coverage | X/8 covered | A-F | List which are missing |
| Fluid scaling | clamp()/calc() usage | A-F | Container queries? |
| Dark mode | Implementation status | A-F | Method: Tailwind/CSS/none |
| Orientation | Portrait/landscape handling | A-F | Height queries? |
| Touch vs. pointer | hover/pointer media queries | A-F | Sticky hover fix? |

### Key Findings
[File:line references with severity per DesignAudit levels]
```

### Severity Levels (match DesignAudit workflow)

| Level | Criteria | Example |
|-------|----------|---------|
| **Blocker** | Content inaccessible at any viewport | Text overflows and is clipped at 320px |
| **Critical** | Broken layout or unusable interaction | Hover-only interactions on touch devices |
| **Warning** | Suboptimal but functional | Missing one breakpoint, no container queries |
| **Info** | Enhancement opportunity | Could add fluid spacing, orientation support |

## Usage

See supporting files:
- `breakpoints.md` - Detailed breakpoint usage patterns
- `dark-mode.md` - Complete dark mode implementation guide
