# Responsive Breakpoints Reference

## Breakpoint Scale

### Full Scale (8 breakpoints)

| Token | Width | CSS Variable | Tailwind | Common Devices |
|-------|-------|--------------|----------|----------------|
| xs | 320px | `--bp-xs` | `xs:` | iPhone SE, small Android |
| sm | 480px | `--bp-sm` | `sm:` | iPhone 14/15, larger phones |
| md | 768px | `--bp-md` | `md:` | iPad Mini, tablets portrait |
| lg | 1024px | `--bp-lg` | `lg:` | iPad Pro, tablets landscape |
| xl | 1280px | `--bp-xl` | `xl:` | Small laptops, desktops |
| 2xl | 1536px | `--bp-2xl` | `2xl:` | Large laptops |
| 3xl | 1920px | `--bp-3xl` | `3xl:` | Full HD monitors |
| 4xl | 2560px | `--bp-4xl` | `4xl:` | 2K/QHD monitors |

### Common Device Widths (2025)

| Device | Viewport Width | Breakpoint |
|--------|----------------|------------|
| iPhone SE | 375px | xs-sm |
| iPhone 14/15 | 390px | xs-sm |
| iPhone 14/15 Pro Max | 430px | sm |
| iPad Mini | 768px | md |
| iPad Air | 820px | md |
| iPad Pro 11" | 834px | md |
| iPad Pro 12.9" | 1024px | lg |
| MacBook Air 13" | 1280px | xl |
| MacBook Pro 14" | 1512px | 2xl |
| MacBook Pro 16" | 1728px | 2xl-3xl |
| Desktop 1080p | 1920px | 3xl |
| Desktop 1440p | 2560px | 4xl |

## Mobile-First Approach

Always design mobile-first, then add styles for larger screens:

```css
/* Base: Mobile (xs: 320px+) */
.component {
  padding: 1rem;
  font-size: 14px;
}

/* sm: 480px+ */
@media (min-width: 480px) {
  .component {
    padding: 1.5rem;
  }
}

/* md: 768px+ */
@media (min-width: 768px) {
  .component {
    padding: 2rem;
    font-size: 16px;
  }
}

/* lg: 1024px+ */
@media (min-width: 1024px) {
  .component {
    padding: 2.5rem;
  }
}
```

### Tailwind Pattern
```tsx
<div className="
  p-4 text-sm              /* xs: 320px base */
  sm:p-6                    /* sm: 480px+ */
  md:p-8 md:text-base      /* md: 768px+ */
  lg:p-10                   /* lg: 1024px+ */
  xl:p-12                   /* xl: 1280px+ */
  2xl:max-w-7xl            /* 2xl: 1536px+ */
">
```

## Layout Patterns by Breakpoint

### Navigation

| Breakpoint | Pattern |
|------------|---------|
| xs-sm | Hamburger menu, bottom nav |
| md | Collapsible sidebar |
| lg+ | Full sidebar, top nav |

### Grid Columns

| Breakpoint | Columns | Use Case |
|------------|---------|----------|
| xs | 1 | Single column, stacked |
| sm | 1-2 | Card grid starts |
| md | 2-3 | Dashboard panels |
| lg | 3-4 | Full dashboard |
| xl+ | 4-6 | Data-heavy layouts |

```tsx
<div className="
  grid grid-cols-1
  sm:grid-cols-2
  md:grid-cols-3
  lg:grid-cols-4
  xl:grid-cols-6
  gap-4
">
```

### Typography Scale

| Breakpoint | Body | H1 | H2 |
|------------|------|----|----|
| xs-sm | 14px | 24px | 20px |
| md | 16px | 32px | 24px |
| lg+ | 16px | 40px | 28px |

## Container Widths

```css
.container {
  width: 100%;
  margin: 0 auto;
  padding: 0 1rem;
}

/* Max widths per breakpoint */
@media (min-width: 480px) { .container { max-width: 480px; } }
@media (min-width: 768px) { .container { max-width: 720px; } }
@media (min-width: 1024px) { .container { max-width: 960px; } }
@media (min-width: 1280px) { .container { max-width: 1200px; } }
@media (min-width: 1536px) { .container { max-width: 1440px; } }
```

## Testing Checklist

- [ ] Test at 320px (minimum supported)
- [ ] Test at 375px (iPhone SE/14)
- [ ] Test at 768px (tablet portrait)
- [ ] Test at 1024px (tablet landscape)
- [ ] Test at 1280px (desktop)
- [ ] Test at 1920px (Full HD)
- [ ] Test orientation changes
- [ ] Test with system font scaling (200%)
- [ ] Test touch targets (44x44 minimum)

## Device Testing Priority

1. **Critical (test all layouts)**
   - 375px - iPhone
   - 768px - iPad
   - 1280px - Desktop

2. **Important (verify)**
   - 320px - Edge case minimum
   - 1920px - Full HD
   - 430px - Large phones

3. **Verify if time permits**
   - 2560px - 2K displays
   - 834px - iPad Pro
