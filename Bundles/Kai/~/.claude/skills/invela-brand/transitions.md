# Transitions & Animation

Invela's motion system based on Vercel guidelines and Tailwind alignment.

## Core Principles

1. **GPU-only properties** - Only animate `transform` and `opacity`
2. **Respect preferences** - Honor `prefers-reduced-motion`
3. **Be cancelable** - User input should cancel animations
4. **Be purposeful** - Animate to clarify, not decorate

## Duration Scale

| Token | Value | Use Case | Tailwind |
|-------|-------|----------|----------|
| `instant` | 0ms | Immediate feedback | `duration-0` |
| `fast` | 100ms | Micro-interactions (hover, active) | `duration-100` |
| `normal` | 150ms | Small transitions (tooltips, badges) | `duration-150` |
| `moderate` | 200ms | Standard transitions (dropdowns) | `duration-200` |
| `slow` | 300ms | Medium transitions (panels) | `duration-300` |
| `slower` | 400ms | Large transitions (modals) | `duration-[400ms]` |
| `slowest` | 500ms | Page transitions | `duration-500` |

## CSS Variables

```css
:root {
  /* Durations */
  --duration-instant: 0ms;
  --duration-fast: 100ms;
  --duration-normal: 150ms;
  --duration-moderate: 200ms;
  --duration-slow: 300ms;
  --duration-slower: 400ms;
  --duration-slowest: 500ms;

  /* Easings */
  --ease-out: cubic-bezier(0, 0, 0.2, 1);
  --ease-in: cubic-bezier(0.4, 0, 1, 1);
  --ease-in-out: cubic-bezier(0.4, 0, 0.2, 1);
  --ease-spring: cubic-bezier(0.34, 1.56, 0.64, 1);
  --ease-linear: linear;
}
```

## Easing Functions

| Token | Cubic Bezier | Use Case |
|-------|--------------|----------|
| `ease-out` | `(0, 0, 0.2, 1)` | Entering view (fast start, slow end) |
| `ease-in` | `(0.4, 0, 1, 1)` | Leaving view (slow start, fast end) |
| `ease-in-out` | `(0.4, 0, 0.2, 1)` | Changing in place |
| `ease-spring` | `(0.34, 1.56, 0.64, 1)` | Playful/bouncy feedback |
| `linear` | `linear` | Progress bars, immediate response |

### Easing Decision Tree

```
Is element entering?     → ease-out
Is element leaving?      → ease-in
Is element changing?     → ease-in-out
Is it progress/loading?  → linear
Want playful feel?       → ease-spring
```

## Component Guidelines

### Buttons

```css
.button {
  transition:
    background-color var(--duration-fast) var(--ease-out),
    box-shadow var(--duration-fast) var(--ease-out),
    transform var(--duration-fast) var(--ease-out);
}

.button:hover {
  box-shadow: var(--shadow-md);
}

.button:active {
  transform: scale(0.98);
}
```

### Cards

```css
.card {
  transition: box-shadow var(--duration-normal) var(--ease-out);
}

.card:hover {
  box-shadow: var(--shadow-md);
}
```

### Dropdowns

```css
.dropdown-content {
  transform-origin: top;
  transition:
    opacity var(--duration-moderate) var(--ease-out),
    transform var(--duration-moderate) var(--ease-out);
}

/* Closed */
.dropdown-content[data-state="closed"] {
  opacity: 0;
  transform: scale(0.95) translateY(-4px);
}

/* Open */
.dropdown-content[data-state="open"] {
  opacity: 1;
  transform: scale(1) translateY(0);
}
```

### Modals

```css
.modal-overlay {
  transition: opacity var(--duration-slow) var(--ease-out);
}

.modal-content {
  transition:
    opacity var(--duration-slow) var(--ease-out),
    transform var(--duration-slow) var(--ease-spring);
}

/* Entering */
.modal-content[data-state="open"] {
  opacity: 1;
  transform: scale(1);
}

/* Leaving */
.modal-content[data-state="closed"] {
  opacity: 0;
  transform: scale(0.95);
}
```

### Tooltips

```css
.tooltip {
  transition:
    opacity var(--duration-normal) var(--ease-out),
    transform var(--duration-normal) var(--ease-out);
}

.tooltip[data-state="closed"] {
  opacity: 0;
  transform: translateY(4px);
}

.tooltip[data-state="open"] {
  opacity: 1;
  transform: translateY(0);
}
```

### Sidebar / Navigation

```css
.sidebar {
  transition: transform var(--duration-slow) var(--ease-in-out);
}

.sidebar[data-state="collapsed"] {
  transform: translateX(-100%);
}

.sidebar[data-state="expanded"] {
  transform: translateX(0);
}
```

### Accordions

```css
.accordion-content {
  transition:
    height var(--duration-moderate) var(--ease-in-out),
    opacity var(--duration-moderate) var(--ease-in-out);
}

.accordion-trigger svg {
  transition: transform var(--duration-normal) var(--ease-out);
}

.accordion-trigger[data-state="open"] svg {
  transform: rotate(180deg);
}
```

## Reduced Motion

**Required:** Always respect user preferences.

```css
@media (prefers-reduced-motion: reduce) {
  *,
  *::before,
  *::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
  }
}
```

### Selective Reduction

For essential feedback, keep opacity transitions:

```css
@media (prefers-reduced-motion: reduce) {
  .dropdown-content {
    animation: none;
    transition: opacity var(--duration-fast) var(--ease-out);
  }
}
```

### JavaScript Detection

```tsx
const prefersReducedMotion = window.matchMedia(
  '(prefers-reduced-motion: reduce)'
).matches;

// React hook
function usePrefersReducedMotion() {
  const [prefersReduced, setPrefersReduced] = useState(false);

  useEffect(() => {
    const query = window.matchMedia('(prefers-reduced-motion: reduce)');
    setPrefersReduced(query.matches);

    const handler = (e) => setPrefersReduced(e.matches);
    query.addEventListener('change', handler);
    return () => query.removeEventListener('change', handler);
  }, []);

  return prefersReduced;
}
```

## Tailwind Config

```js
// tailwind.config.js
module.exports = {
  theme: {
    transitionDuration: {
      0: '0ms',
      100: '100ms',
      150: '150ms',
      200: '200ms',
      300: '300ms',
      400: '400ms',
      500: '500ms',
    },
    transitionTimingFunction: {
      DEFAULT: 'cubic-bezier(0, 0, 0.2, 1)',
      'in': 'cubic-bezier(0.4, 0, 1, 1)',
      'out': 'cubic-bezier(0, 0, 0.2, 1)',
      'in-out': 'cubic-bezier(0.4, 0, 0.2, 1)',
      'spring': 'cubic-bezier(0.34, 1.56, 0.64, 1)',
    },
  },
}
```

## Animation Patterns

### Fade In

```css
@keyframes fadeIn {
  from { opacity: 0; }
  to { opacity: 1; }
}

.fade-in {
  animation: fadeIn var(--duration-normal) var(--ease-out);
}
```

### Slide In

```css
@keyframes slideInFromBottom {
  from {
    opacity: 0;
    transform: translateY(8px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.slide-in-bottom {
  animation: slideInFromBottom var(--duration-moderate) var(--ease-out);
}
```

### Scale In

```css
@keyframes scaleIn {
  from {
    opacity: 0;
    transform: scale(0.95);
  }
  to {
    opacity: 1;
    transform: scale(1);
  }
}

.scale-in {
  animation: scaleIn var(--duration-moderate) var(--ease-spring);
}
```

### Skeleton Loading

```css
@keyframes shimmer {
  from { background-position: -200% 0; }
  to { background-position: 200% 0; }
}

.skeleton {
  background: linear-gradient(
    90deg,
    var(--color-gray-3) 25%,
    var(--color-gray-4) 50%,
    var(--color-gray-3) 75%
  );
  background-size: 200% 100%;
  animation: shimmer 1.5s infinite linear;
}
```

## Anti-Patterns

```css
/* ❌ Never use transition: all */
.element {
  transition: all 200ms;
}

/* ✅ Be explicit */
.element {
  transition: opacity 200ms, transform 200ms;
}

/* ❌ Animating expensive properties */
.element {
  transition: width 200ms, height 200ms, margin 200ms;
}

/* ✅ Use transform instead */
.element {
  transition: transform 200ms;
}

/* ❌ Missing reduced-motion support */
.element {
  animation: bounce 1s infinite;
}

/* ✅ With reduced-motion fallback */
.element {
  animation: bounce 1s infinite;
}
@media (prefers-reduced-motion: reduce) {
  .element {
    animation: none;
  }
}
```

## GPU-Only Properties

**Always animate these:**
```css
transform: translateX() translateY() scale() rotate();
opacity: 0..1;
```

**Never animate these:**
```css
width, height       /* Use transform: scale() */
top, left, right    /* Use transform: translate() */
margin, padding     /* Use transform: translate() */
border-width        /* Avoid or use opacity */
```

## Performance Tips

1. **Use `will-change` sparingly:**
```css
.will-animate {
  will-change: transform, opacity;
}
```

2. **Remove after animation:**
```tsx
element.addEventListener('transitionend', () => {
  element.style.willChange = 'auto';
});
```

3. **Promote to own layer for complex animations:**
```css
.complex-animation {
  transform: translateZ(0);
}
```

## Industry Alignment

| System | Default Duration | Approach |
|--------|-----------------|----------|
| Tailwind | 150ms | 8 steps (75-1000ms) |
| Material | 200-300ms | 4 levels |
| Radix | 200ms | Component-specific |
| **Invela** | 150ms | 7 semantic steps |
