# Design:Responsive Sub-Skill

Deep expertise in mobile-first design, container queries, fluid typography, and responsive patterns for adaptive interfaces.

## Mobile-First Principles

- Design smallest viewport first, progressively enhance upward
- Prioritize essential content - what's critical on a 320px screen?
- 60%+ of global web traffic is mobile (2025)
- Reduces layout bloat and improves Core Web Vitals
- Forces content prioritization decisions early

## Performance Budgets by Device

| Device Tier | Max Payload |
|-------------|-------------|
| Low-end / slow connections | 150KB |
| Mid-range mobile | 300KB |
| High-end devices | 500KB |

## Breakpoints (minimum 3, recommended 5)

```css
/* Use relative units, not device-specific pixels */
:root {
  --breakpoint-xs: 20em;    /* 320px - Small phones */
  --breakpoint-sm: 40em;    /* 640px - Phones landscape */
  --breakpoint-md: 48em;    /* 768px - Tablets */
  --breakpoint-lg: 64em;    /* 1024px - Small laptops */
  --breakpoint-xl: 80em;    /* 1280px - Desktops */
  --breakpoint-2xl: 96em;   /* 1536px - Large desktops */
}

/* Mobile-first media queries */
@media (min-width: 40em) { /* Tablet and up */ }
@media (min-width: 64em) { /* Desktop and up */ }
```

## Touch Targets

| Standard | Minimum Size |
|----------|--------------|
| WCAG 2.5.8 (AA) | 24x24 CSS pixels |
| WCAG 2.5.5 (AAA) | 44x44 CSS pixels |
| iOS HIG | 44x44pt |
| Material Design | 48x48dp |

- 8px minimum spacing between targets
- Consider thumb zones: bottom of screen easiest to reach

## Container Queries (Essential for 2025)

```css
/* Define container */
.card-container {
  container-type: inline-size;
  container-name: card;
}

/* Query container, not viewport */
@container card (min-width: 400px) {
  .card {
    display: grid;
    grid-template-columns: 1fr 2fr;
  }
}

@container card (min-width: 600px) {
  .card {
    grid-template-columns: 200px 1fr 100px;
  }
}
```

**Benefits:**
- Solve "reusable component problem"
- Components adapt to immediate context, not viewport
- Essential for design systems and component libraries
- Same component works in sidebar, modal, main content

## Fluid Typography

```css
:root {
  /* clamp(minimum, preferred, maximum) */
  --font-body: clamp(1rem, 0.5rem + 1vw, 1.125rem);
  --font-h1: clamp(2rem, 1rem + 3vw, 3.5rem);
  --font-h2: clamp(1.5rem, 0.75rem + 2vw, 2.5rem);
  --font-h3: clamp(1.25rem, 0.5rem + 1.5vw, 1.75rem);
}

/* With responsive line-height */
h1 {
  font-size: var(--font-h1);
  line-height: calc(1em + 0.5rem); /* Tighter on large sizes */
}

/* Optimal line length: 45-75 characters */
.prose {
  max-width: 65ch;
}
```

## Fluid Grids

```css
/* Auto-fit pattern - no breakpoints needed */
.grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(min(100%, 300px), 1fr));
  gap: clamp(1rem, 2vw, 2rem);
}

/* Auto-fill for consistent column sizes */
.grid-fill {
  grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
}

/* Subgrid for nested alignment */
.grid-parent {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 1rem;
}

.grid-child {
  display: grid;
  grid-template-rows: subgrid;
  grid-row: span 3;
}
```

## Responsive Patterns

| Pattern | Description | Use Case |
|---------|-------------|----------|
| **Mostly Fluid** | Percentage columns drop at breakpoints | Multi-column layouts |
| **Column Drop** | Stacked mobile → side-by-side desktop | Content + sidebar |
| **Layout Shifter** | Major reorganization per breakpoint | Complex dashboards |
| **Tiny Tweaks** | Minor adjustments only | Simple pages |
| **Off Canvas** | Hidden nav/panels slide in on mobile | Mobile navigation |
| **Priority+** | Most important items visible, rest in "more" | Navigation bars |

## Responsive Images

```html
<!-- Art direction with picture -->
<picture>
  <source srcset="hero-large.webp" media="(min-width: 1200px)">
  <source srcset="hero-medium.webp" media="(min-width: 768px)">
  <img src="hero-small.webp"
       alt="Description"
       loading="lazy"
       decoding="async"
       width="800"
       height="600">
</picture>

<!-- Density-based srcset -->
<img srcset="hero-1x.jpg 1x,
             hero-2x.jpg 2x,
             hero-3x.jpg 3x"
     src="hero-1x.jpg"
     alt="Description"
     width="400"
     height="300">

<!-- Width-based srcset -->
<img srcset="hero-400.jpg 400w,
             hero-800.jpg 800w,
             hero-1200.jpg 1200w"
     sizes="(min-width: 1200px) 1200px,
            (min-width: 768px) 800px,
            100vw"
     src="hero-800.jpg"
     alt="Description">
```

## Fluid Spacing

```css
:root {
  /* Spacing scale using clamp */
  --space-xs: clamp(0.25rem, 0.5vw, 0.5rem);
  --space-sm: clamp(0.5rem, 1vw, 0.75rem);
  --space-md: clamp(1rem, 2vw, 1.5rem);
  --space-lg: clamp(1.5rem, 3vw, 2.5rem);
  --space-xl: clamp(2rem, 4vw, 4rem);
  --space-2xl: clamp(3rem, 6vw, 6rem);
}
```

## Emerging Form Factors

- Foldable phones (Samsung Fold, Pixel Fold)
- Horizontal and vertical folds
- Use CSS fold detection when available
- Test layouts at unusual aspect ratios (21:9, 4:3, etc.)

```css
/* Horizontal fold detection (experimental) */
@media (horizontal-viewport-segments: 2) {
  .content {
    display: grid;
    grid-template-columns: env(viewport-segment-width 0 0) env(viewport-segment-width 1 0);
  }
}
```

## Audit Checklist

- [ ] Works without horizontal scroll at 320px (1.4.10)
- [ ] Touch targets minimum 44x44px (ideally) / 24x24px (minimum)
- [ ] Adequate spacing (8px+) between touch targets
- [ ] Images use srcset/sizes or picture element
- [ ] Images have explicit width/height (prevent CLS)
- [ ] Tables scrollable or reformatted on mobile
- [ ] Forms usable on mobile keyboards (proper input types)
- [ ] Navigation accessible on all sizes
- [ ] Text readable without zooming (16px minimum base)
- [ ] Critical content visible without scrolling on mobile
- [ ] Container queries used for reusable components
- [ ] Fluid typography with clamp()
- [ ] Performance budget met per device tier
- [ ] Works in both orientations (portrait/landscape)
- [ ] Tested on actual devices, not just DevTools
