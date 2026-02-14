# Design:Trends Sub-Skill

Deep expertise in modern CSS features, animation best practices, and contemporary design patterns for cutting-edge interfaces.

## Modern CSS (2025-2026 - Baseline Widely Available)

### Container Queries
```css
/* 90%+ browser support, 68% developer adoption */
.card-container {
  container-type: inline-size;
  container-name: card;
}

@container card (min-width: 400px) {
  .card { flex-direction: row; }
}
```

### :has() Parent Selector
```css
/* Style parent based on children */
.form:has(:invalid) { border-color: red; }
.nav:has(.dropdown:hover) { background: var(--nav-active); }
.card:has(img) { padding-top: 0; }
.list:has(> li:nth-child(5)) { columns: 2; }
```

### CSS Nesting (Native)
```css
.button {
  background: blue;
  color: white;

  &:hover { background: darkblue; }
  &:focus-visible { outline: 2px solid white; }

  & .icon {
    margin-right: 0.5rem;

    &.leading { margin-left: 0; }
  }
}
```

### View Transitions
```css
@view-transition { navigation: auto; }

::view-transition-old(page) {
  animation: fade-out 0.3s ease-out;
}

::view-transition-new(page) {
  animation: fade-in 0.3s ease-in;
}

/* Named transitions */
.card {
  view-transition-name: card;
}
```

### Scroll-Driven Animations
```css
@keyframes reveal {
  from { opacity: 0; transform: translateY(20px); }
  to { opacity: 1; transform: translateY(0); }
}

.card {
  animation: reveal linear both;
  animation-timeline: view();
  animation-range: entry 0% cover 40%;
}

/* Scroll progress indicator */
.progress {
  animation: grow-width linear;
  animation-timeline: scroll();
}
```

### Scroll-State Queries (Chrome 133+)
```css
@container scroll-state(stuck: top) {
  .header {
    box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    backdrop-filter: blur(8px);
  }
}
```

### Anchor Positioning (Interop 2025)
```css
.trigger {
  anchor-name: --tooltip-anchor;
}

.tooltip {
  position: absolute;
  position-anchor: --tooltip-anchor;
  top: anchor(bottom);
  left: anchor(center);
  translate: -50% 0.5rem;
}
```

### Modern Color Functions
```css
:root {
  /* OKLCH for perceptually uniform colors */
  --brand: oklch(65% 0.2 240);

  /* Relative color syntax */
  --brand-light: oklch(from var(--brand) calc(l + 20%) c h);
  --brand-dark: oklch(from var(--brand) calc(l - 20%) c h);

  /* Color mixing */
  --brand-muted: color-mix(in oklch, var(--brand), white 30%);
  --brand-vivid: color-mix(in oklch, var(--brand), black 10%);
}
```

### Subgrid
```css
.grid-parent {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 1rem;
}

.grid-child {
  display: grid;
  grid-template-columns: subgrid;
  grid-column: span 2;
}
```

### Popover API
```html
<button popovertarget="menu">Open Menu</button>
<div id="menu" popover>
  Menu content
</div>
```

## Animation Best Practices

### Performance (GPU-Accelerated Only)
```css
/* ONLY use these properties for smooth 60fps */
.animate {
  transform: translateX(0) scale(1) rotate(0);
  opacity: 1;
  filter: blur(0);
}

/* AVOID animating these - cause reflow/repaint */
/* width, height, top, left, margin, padding, border-width */

/* Will-change hint (use sparingly) */
.will-animate {
  will-change: transform, opacity;
}
```

### Spring Physics
```css
:root {
  /* Natural spring easing */
  --ease-spring: cubic-bezier(0.34, 1.56, 0.64, 1);
  --ease-bounce: cubic-bezier(0.68, -0.55, 0.265, 1.55);
  --ease-smooth: cubic-bezier(0.4, 0, 0.2, 1);

  /* Duration guidelines */
  --duration-instant: 100ms;
  --duration-fast: 200ms;
  --duration-normal: 300ms;
  --duration-slow: 500ms;
}

/* Entrance: scale up, fade in */
@keyframes enter {
  from {
    opacity: 0;
    transform: scale(0.95);
  }
}

/* Exit: scale down, fade out */
@keyframes exit {
  to {
    opacity: 0;
    transform: scale(0.95);
  }
}
```

### Purpose-Driven Motion
- Every animation should serve a purpose: **guide**, **feedback**, or **delight**
- Bad animation distracts; good animation tells a story
- Micro-interactions guide users through complex interfaces
- "Micro delight": subtle bounces, tactile toggles, gentle reactions
- Animations > 0.3s need clear purpose

### Accessibility (Mandatory)
```css
@media (prefers-reduced-motion: reduce) {
  *,
  *::before,
  *::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
    scroll-behavior: auto !important;
  }
}

/* Alternative: provide simpler animations */
@media (prefers-reduced-motion: reduce) {
  .modal {
    animation: fade-in 0.01ms; /* Instead of slide-up */
  }
}
```

### Adaptive Motion (2026)
```css
/* Respect battery saver mode */
@media (prefers-reduced-data: reduce) {
  .hero-video { display: none; }
  .hero-image { display: block; }
}

/* JS-based adaptive motion */
/* if (navigator.connection?.saveData) { disableAnimations(); } */
```

## Performance

### Core Web Vitals Targets
| Metric | Good | Needs Improvement |
|--------|------|-------------------|
| LCP (Largest Contentful Paint) | < 2.5s | < 4.0s |
| INP (Interaction to Next Paint) | < 200ms | < 500ms |
| CLS (Cumulative Layout Shift) | < 0.1 | < 0.25 |

### Optimization Checklist
```css
/* Critical CSS inlined (<14KB above-fold) */

/* Font loading */
@font-face {
  font-family: 'Custom';
  src: url('font.woff2') format('woff2');
  font-display: swap; /* or optional */
}

/* Prevent CLS with explicit dimensions */
img, video {
  width: 100%;
  height: auto;
  aspect-ratio: 16 / 9;
}

/* Content-visibility for off-screen content */
.below-fold {
  content-visibility: auto;
  contain-intrinsic-size: 0 500px;
}
```

## Design Trends (2025-2026)

### Visual
| Trend | Description |
|-------|-------------|
| **Glassmorphism** | Subtle, accessible (check contrast!) |
| **Bento grids** | Asymmetric, content-driven layouts |
| **Variable fonts** | Single file, infinite weights/widths |
| **Dark mode** | Often default, always available |
| **Gradients** | Mesh gradients, animated gradients |
| **3D elements** | Lightweight WebGL/Three.js touches |
| **Kinetic typography** | Text that moves, morphs, responds |

### Interaction
| Trend | Description |
|-------|-------------|
| **Scroll-driven** | Content reveals on scroll |
| **View Transitions** | Smooth page-to-page animations |
| **Spatial interfaces** | Depth, parallax, z-axis |
| **Sound design** | Subtle audio feedback (optional) |
| **AI-driven motion** | Auto-suggested easing, transitions |

### Animation Libraries
| Library | Use Case |
|---------|----------|
| **GSAP** | Most flexible, best performance |
| **Framer Motion** | React-native, declarative |
| **Anime.js** | Lightweight, simple API |
| **Lottie** | After Effects to web |
| **Motion One** | Smallest bundle, modern API |

## Audit Checklist

- [ ] Using modern CSS where browser support allows
- [ ] Container queries for reusable components
- [ ] View Transitions for page navigation
- [ ] `:has()` replacing JS for parent selection
- [ ] CSS nesting reducing selector repetition
- [ ] Animations use GPU-accelerated properties only
- [ ] `prefers-reduced-motion` fully respected
- [ ] No animations > 0.3s without clear purpose
- [ ] No layout shift on load (CLS < 0.1)
- [ ] Images in WebP/AVIF with fallbacks
- [ ] Fonts optimized with `font-display`
- [ ] Critical CSS inlined
- [ ] Core Web Vitals passing
- [ ] Design feels contemporary, not dated
- [ ] Motion serves purpose (guide, feedback, delight)
