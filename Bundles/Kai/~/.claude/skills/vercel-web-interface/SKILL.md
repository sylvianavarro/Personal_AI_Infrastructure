---
name: vercel-web-interface
description: USE WHEN building any web UI, forms, interactions, animations, or performance optimization. Vercel's comprehensive interface guidelines covering hundreds of implementation decisions. Framework-agnostic with React/Next.js specifics.
---

# Vercel Web Interface Guidelines

A living design system covering hundreds of interface decisions for building polished, accessible, performant web interfaces.

## Why This Matters

This isn't just visual design - it's **implementation patterns** that make interfaces:
- Actually accessible (not just "passes WCAG")
- Performant under real conditions
- Robust across browsers and devices
- Intuitive without explanation

## Quick Reference

### Critical Rules (Never Violate)

| Category | Rule |
|----------|------|
| Keyboard | All flows keyboard-operable, follow WAI-ARIA patterns |
| Focus | Every focusable element has visible focus indicator |
| Hit Targets | Minimum 24px (visual can be smaller), 44px on mobile |
| Links | Use `<a>` for navigation, never `<button>` or `<div>` |
| Paste | NEVER disable paste on inputs |
| Loading | 150-300ms delay before spinners, 300-500ms minimum visible |
| URLs | Deep-link everything - filters, tabs, pagination, any useState |
| Forms | Keep submit enabled until submission starts |
| Contrast | Prefer APCA over WCAG 2 for perceptual accuracy |
| Animation | Honor `prefers-reduced-motion`, animate only GPU properties |

### APCA vs WCAG 2

Vercel recommends APCA (Accessible Perceptual Contrast Algorithm) over WCAG 2:
- More accurate perceptual contrast
- Better dark mode handling
- Different thresholds than WCAG's 4.5:1

## Authoritative Sources

| # | Source | URL | Focus |
|---|--------|-----|-------|
| 1 | Vercel Guidelines | https://vercel.com/design/guidelines | Primary source |
| 2 | WAI-ARIA Patterns | https://www.w3.org/WAI/ARIA/apg/patterns/ | Interaction patterns |
| 3 | APCA Contrast | https://www.myndex.com/APCA/ | Contrast calculation |
| 4 | Web Animations API | https://developer.mozilla.org/en-US/docs/Web/API/Web_Animations_API | Animation reference |
| 5 | nuqs Library | https://nuqs.47ng.com/ | URL state management |
| 6 | React Scan | https://react-scan.com/ | Re-render detection |
| 7 | virtua | https://github.com/inokawa/virtua | List virtualization |
| 8 | motion (framer) | https://motion.dev/ | Animation library |
| 9 | Chrome DevTools | https://developer.chrome.com/docs/devtools/ | Performance profiling |
| 10 | Safari Web Inspector | https://webkit.org/web-inspector/ | iOS/Safari testing |

## File Structure

| File | Contents |
|------|----------|
| `interactions.md` | Keyboard, focus, touch, loading, URLs, tooltips |
| `animations.md` | Motion preferences, performance, easing, cancellation |
| `forms.md` | Submission, validation, labels, errors, authentication |
| `performance.md` | Re-renders, virtualization, images, fonts, workers |
| `design-patterns.md` | Shadows, borders, radius, color, contrast, gradients |
| `content-copywriting.md` | Typography, labels, error messages, i18n |

## Integration with Invela DS

This skill should be invoked **after** brand/accessibility checks but **before** implementation:

```
1. design-systems-reference  → Industry patterns
2. accessibility-wcag-22     → WCAG compliance
3. vercel-web-interface      → Implementation patterns ← HERE
4. radix-primitives          → Component implementation
5. invela-brand              → Brand application
```

## Usage

Invoke this skill when:
- Building any interactive component
- Implementing forms
- Adding animations/transitions
- Optimizing performance
- Writing UI copy
- Handling loading/error states
