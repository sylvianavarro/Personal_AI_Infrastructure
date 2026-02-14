# Invela Spacing System

## Base Unit

**4px (0.25rem)** - All spacing derives from this base unit.

Aligns with: Material Design, Shopify Polaris, Salesforce Lightning

## Spacing Scale (16 values)

| Token | Value | rem | Use Cases |
|-------|-------|-----|-----------|
| spacing/0 | 0px | 0 | Reset, collapse |
| spacing/1 | 1px | 0.0625 | Borders, hairlines |
| spacing/2 | 2px | 0.125 | Fine adjustments, focus rings |
| spacing/4 | 4px | 0.25 | Tight gaps, icon padding |
| spacing/6 | 6px | 0.375 | Dense UI gaps (like Carbon) |
| spacing/8 | 8px | 0.5 | Default small gap, icon margins |
| spacing/12 | 12px | 0.75 | Medium-small gap |
| spacing/16 | 16px | 1 | Default padding, card insets |
| spacing/20 | 20px | 1.25 | Medium padding (like Polaris) |
| spacing/24 | 24px | 1.5 | Section padding, large gaps |
| spacing/32 | 32px | 2 | Section margins |
| spacing/40 | 40px | 2.5 | Large section spacing |
| spacing/48 | 48px | 3 | Hero padding |
| spacing/64 | 64px | 4 | Major section breaks |
| spacing/80 | 80px | 5 | Large hero spacing |
| spacing/96 | 96px | 6 | Maximum section spacing |

## CSS Custom Properties

```css
/* Spacing scale */
--space-0: 0;
--space-1: 0.0625rem;   /* 1px */
--space-2: 0.125rem;    /* 2px */
--space-4: 0.25rem;     /* 4px */
--space-6: 0.375rem;    /* 6px */
--space-8: 0.5rem;      /* 8px */
--space-12: 0.75rem;    /* 12px */
--space-16: 1rem;       /* 16px */
--space-20: 1.25rem;    /* 20px */
--space-24: 1.5rem;     /* 24px */
--space-32: 2rem;       /* 32px */
--space-40: 2.5rem;     /* 40px */
--space-48: 3rem;       /* 48px */
--space-64: 4rem;       /* 64px */
--space-80: 5rem;       /* 80px */
--space-96: 6rem;       /* 96px */
```

## Radix Alignment

Core Invela values map directly to Radix Themes spacing tokens:

| Invela | Radix | Value |
|--------|-------|-------|
| spacing/4 | --space-1 | 4px |
| spacing/8 | --space-2 | 8px |
| spacing/12 | --space-3 | 12px |
| spacing/16 | --space-4 | 16px |
| spacing/24 | --space-5 | 24px |
| spacing/32 | --space-6 | 32px |
| spacing/40 | --space-7 | 40px |
| spacing/48 | --space-8 | 48px |
| spacing/64 | --space-9 | 64px |

**Extended values** (0, 1, 2, 6, 20, 80, 96) are Invela-specific additions.

## Component Spacing Guidelines

### Buttons
| Size | Height | Horizontal Padding | Icon Gap |
|------|--------|-------------------|----------|
| sm | 32px | 12px | 8px |
| md | 40px | 16px | 8px |
| lg | 48px | 24px | 8px |

### Cards
| Element | Spacing |
|---------|---------|
| Card padding | 16px (compact) / 24px (default) |
| Card gap (stacked) | 16px |
| Card header/content gap | 12px |

### Forms
| Element | Spacing |
|---------|---------|
| Field gap (vertical) | 16px |
| Label to input | 8px |
| Input padding | 12px horizontal, 8px vertical |
| Error message gap | 4px |

### Sections
| Element | Spacing |
|---------|---------|
| Section padding | 24px (mobile) / 48px (desktop) |
| Section gap | 32px (mobile) / 64px (desktop) |
| Page margin | 16px (mobile) / 24px (tablet) / 32px (desktop) |

## Touch Targets

Per WCAG 2.5.8 and Vercel guidelines:
- **Minimum:** 24x24px
- **Recommended:** 44x44px
- All button sizes (32/40/48px) exceed minimum

## Usage Notes

### When to Use Off-Grid Values

**spacing/1 (1px):** Border widths, divider lines
```css
border-width: var(--space-1);
```

**spacing/2 (2px):** Focus ring offset, fine adjustments
```css
outline-offset: var(--space-2);
```

**spacing/6 (6px):** Dense data tables, tight icon padding
```css
/* Dense table cells */
padding: var(--space-6) var(--space-8);
```

**spacing/20 (20px):** When 16px feels tight but 24px feels loose
```css
/* Medium card padding */
padding: var(--space-20);
```
