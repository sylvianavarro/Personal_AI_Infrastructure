---
name: ui-review
description: Audit UI code against 100+ best practices for accessibility, performance, and UX. Use when reviewing frontend code, checking accessibility, or auditing design implementation.
---

# UI Review

Audit UI code against web interface best practices.

## When to Use

- Reviewing frontend/UI code
- Accessibility (a11y) audits
- UX compliance checks
- Design system enforcement
- Pre-launch quality gate

---

## Categories

| Category | Rules | Priority |
|----------|-------|----------|
| Accessibility | 12 | Critical |
| Focus States | 4 | Critical |
| Forms | 14 | High |
| Performance | 8 | High |
| Images | 4 | Medium |
| Animation | 6 | Medium |
| Typography | 6 | Lower |
| Navigation | 5 | Lower |
| Touch/Mobile | 5 | Lower |
| Dark Mode | 3 | Lower |
| i18n | 3 | Lower |

See `rules-reference.md` in this directory for detailed rules with code examples (good/bad patterns for each rule).

---

### Accessibility (A1-A12)

Semantic HTML, ARIA labels, keyboard access, alt text, heading hierarchy, color contrast, skip links, and no zoom disabling. Every interactive element must be operable via keyboard and announced correctly by screen readers.

### Focus States (F1-F4)

Visible focus indicators using `:focus-visible`, `:focus-within` for compound controls, and never removing `outline` without a replacement style.

### Forms (FO1-FO9)

Correct `autocomplete` and `inputMode` attributes, clickable labels via `htmlFor`, never blocking paste, inline error messages with focus management, and unsaved-changes warnings.

### Performance (P1-P6)

Virtualize long lists, avoid layout reads during render, batch DOM reads/writes, prefer uncontrolled inputs, preconnect to CDN origins, and preload critical fonts.

### Images (I1-I3)

Explicit `width`/`height` to prevent CLS, `loading="lazy"` below the fold, `fetchPriority="high"` or framework `priority` for above-fold hero images.

### Animation (AN1-AN4)

Respect `prefers-reduced-motion`, animate only `transform` and `opacity`, never use `transition: all`, and keep animations interruptible by user input.

### Typography (T1-T5)

Use the ellipsis character, curly quotes, non-breaking spaces for units/shortcuts, `tabular-nums` for number columns, and `text-wrap: balance` for headings.

---

## Anti-Patterns to Flag

Immediately flag these in code review:

| Pattern | Problem |
|---------|---------|
| `user-scalable=no` | Blocks accessibility |
| `onPaste` + `preventDefault` | Frustrates users |
| `transition: all` | Performance, unexpected |
| `outline: none` without replacement | No focus visible |
| `<div onClick>` for navigation | Not accessible |
| `<div>` / `<span>` with onClick | Should be `<button>` |
| `<img>` without dimensions | Layout shift |
| Large `.map()` without virtualization | Performance |
| Form inputs without labels | Not accessible |
| Icon buttons without aria-label | Not accessible |
| Hardcoded date/number formats | i18n failure |
| `autoFocus` without justification | Mobile issues |

---

## Quick Audit Checklist

- [ ] All interactive elements keyboard accessible?
- [ ] All form inputs have labels?
- [ ] All icon buttons have aria-label?
- [ ] All images have alt text?
- [ ] All images have width/height?
- [ ] Focus states visible?
- [ ] No `outline: none` without replacement?
- [ ] Lists >50 items virtualized?
- [ ] Animations respect reduced-motion?
- [ ] No `transition: all`?

---

## Integration

| Skill | Integration |
|-------|-------------|
| **react-performance** | Performance rules |
| **design-system** | Component patterns |
| **requesting-code-review** | UI category checklist |
