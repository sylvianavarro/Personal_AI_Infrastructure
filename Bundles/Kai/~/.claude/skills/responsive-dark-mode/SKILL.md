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

## Usage

See supporting files:
- `breakpoints.md` - Detailed breakpoint usage patterns
- `dark-mode.md` - Complete dark mode implementation guide
