# Animations

## Motion Preferences

### Respect User Preferences
```css
/* Always provide reduced-motion variants */
@media (prefers-reduced-motion: reduce) {
  *,
  *::before,
  *::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
  }
}

/* Or selectively reduce */
@media (prefers-reduced-motion: reduce) {
  .animated-element {
    animation: none;
    transition: opacity 0.2s; /* Keep essential feedback */
  }
}
```

### Detection in JavaScript
```tsx
const prefersReducedMotion = window.matchMedia(
  '(prefers-reduced-motion: reduce)'
).matches;

// Use in animation libraries
<motion.div
  animate={prefersReducedMotion ? { opacity: 1 } : { opacity: 1, y: 0 }}
/>
```

## Implementation Priority

**Prefer in this order:**

1. **CSS** - Best performance, automatic reduced-motion support
2. **Web Animations API** - Native, performant, cancelable
3. **JavaScript libraries** (motion/framer-motion) - Last resort

```css
/* 1. CSS - Preferred */
.fade-in {
  animation: fadeIn 200ms ease-out;
}

@keyframes fadeIn {
  from { opacity: 0; }
  to { opacity: 1; }
}
```

```tsx
// 2. Web Animations API
element.animate(
  [{ opacity: 0 }, { opacity: 1 }],
  { duration: 200, easing: 'ease-out' }
);
```

## Performance

### GPU-Accelerated Properties (USE THESE)
```css
/* ✅ Fast - composited, no layout/paint */
transform: translateX(100px);
transform: scale(1.1);
transform: rotate(45deg);
opacity: 0.5;
```

### Expensive Properties (AVOID)
```css
/* ❌ Slow - triggers layout/paint */
width: 200px;
height: 200px;
top: 100px;
left: 100px;
margin: 20px;
padding: 20px;
```

### Transform Instead of Position
```css
/* ❌ Bad - triggers layout */
.slide-in {
  left: 0;
  transition: left 200ms;
}
.slide-in.active {
  left: 100px;
}

/* ✅ Good - GPU composited */
.slide-in {
  transform: translateX(0);
  transition: transform 200ms;
}
.slide-in.active {
  transform: translateX(100px);
}
```

## Design Principles

### When to Animate
- Clarifying cause and effect (what triggered what)
- Providing deliberate delight
- Guiding attention

### When NOT to Animate
- Decorative motion without purpose
- Autoplay animations
- Motion that can't be canceled

### Cancelability
**All animations must be cancelable by user input.**

```tsx
// Animation cancels when user interacts
const animation = element.animate(keyframes, options);

element.addEventListener('click', () => {
  animation.cancel(); // or animation.finish()
});
```

## Technical Implementation

### Transform Origin
Set correct `transform-origin` to anchor motion to physical start point:

```css
/* Dropdown expanding from top-left */
.dropdown {
  transform-origin: top left;
  transform: scale(0);
  transition: transform 200ms;
}
.dropdown.open {
  transform: scale(1);
}
```

### Never Use `transition: all`
```css
/* ❌ Bad - animates everything, unexpected behavior */
.element {
  transition: all 200ms;
}

/* ✅ Good - explicit properties */
.element {
  transition: opacity 200ms, transform 200ms;
}
```

### SVG Transforms
```tsx
// Apply transforms to <g> wrapper, not directly to path
<svg>
  <g
    style={{
      transformBox: 'fill-box',
      transformOrigin: 'center',
      transform: 'rotate(45deg)'
    }}
  >
    <path d="..." />
  </g>
</svg>
```

## Easing

### Choose Based on Context
| What's Changing | Easing |
|-----------------|--------|
| Entering view | ease-out (fast start, slow end) |
| Leaving view | ease-in (slow start, fast end) |
| Changing in place | ease-in-out |
| Responding to input | linear or ease-out |

### Common Values
```css
/* Standard easings */
--ease-out: cubic-bezier(0, 0, 0.2, 1);
--ease-in: cubic-bezier(0.4, 0, 1, 1);
--ease-in-out: cubic-bezier(0.4, 0, 0.2, 1);

/* Spring-like */
--ease-spring: cubic-bezier(0.34, 1.56, 0.64, 1);
```

## Duration Guidelines

| Animation Type | Duration |
|----------------|----------|
| Micro-interactions (hover, active) | 100-150ms |
| Small transitions (tooltips, badges) | 150-200ms |
| Medium transitions (dropdowns, panels) | 200-300ms |
| Large transitions (modals, pages) | 300-400ms |

## Layer Promotion

When animation artifacts occur:

```css
/* Promote to own compositor layer */
.animated-element {
  will-change: transform;
  /* or */
  transform: translateZ(0);
}
```

**Use sparingly** - too many layers hurt performance.

## Text Animation Gotcha

Scaling text changes font smoothing. Animate wrapper instead:

```css
/* ❌ Bad - text rendering changes */
.text {
  transform: scale(1.1);
}

/* ✅ Good - animate wrapper */
.text-wrapper {
  transform: scale(1.1);
}
```
