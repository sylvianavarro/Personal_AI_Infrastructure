# Border Radius Scale

Invela's border radius system aligned with Radix Themes and Material Design 3.

## Scale

| Token | Value | CSS Variable | Tailwind | Use Case |
|-------|-------|--------------|----------|----------|
| `none` | 0px | `--radius-none` | `rounded-none` | Sharp elements, tables |
| `xs` | 2px | `--radius-xs` | `rounded-sm` | Tags, tiny badges |
| `sm` | 4px | `--radius-sm` | `rounded` | Buttons, inputs, status badges |
| `md` | 8px | `--radius-md` | `rounded-md` | Dropdowns, nested card elements |
| `lg` | 12px | `--radius-lg` | `rounded-lg` | Tooltips, popovers, small cards |
| `xl` | 16px | `--radius-xl` | `rounded-xl` | Cards, modals, dialogs |
| `2xl` | 24px | `--radius-2xl` | `rounded-2xl` | Large cards, hero sections |
| `full` | 9999px | `--radius-full` | `rounded-full` | Pills, avatars, circular badges |

## CSS Variables

```css
:root {
  --radius-none: 0px;
  --radius-xs: 2px;
  --radius-sm: 4px;
  --radius-md: 8px;
  --radius-lg: 12px;
  --radius-xl: 16px;
  --radius-2xl: 24px;
  --radius-full: 9999px;
}
```

## Radix Alignment

| Invela Token | Radix Token | Match |
|--------------|-------------|-------|
| `--radius-xs` | — | Invela addition |
| `--radius-sm` | `--radius-2` | 4px ✓ |
| `--radius-md` | `--radius-4` | 8px ✓ |
| `--radius-lg` | `--radius-5` | 12px ✓ |
| `--radius-xl` | `--radius-6` | 16px ✓ |
| `--radius-2xl` | — | Invela addition (brand) |

## Nested Radius Rule

**Critical:** When nesting elements, child radius must account for parent padding.

```
Child radius = Parent radius − Padding
```

### Example: Card with Inner Element

```css
/* Parent card: 16px radius, 8px padding */
.card {
  border-radius: var(--radius-xl);  /* 16px */
  padding: 8px;
}

/* Child element: 16 - 8 = 8px */
.card-inner {
  border-radius: var(--radius-md);  /* 8px */
}
```

### Visual Reference

```
┌────────────────────────────┐  ← Parent: 16px (xl)
│  ┌──────────────────────┐  │
│  │                      │  │  ← Child: 8px (md)
│  │      Content         │  │     (16 - 8 padding = 8)
│  │                      │  │
│  └──────────────────────┘  │
└────────────────────────────┘
```

### Dynamic Calculation

```css
.nested-element {
  --parent-radius: var(--radius-xl);
  --padding: 8px;
  border-radius: calc(var(--parent-radius) - var(--padding));
}
```

## Component Guidelines

### Buttons
| Size | Radius | Token |
|------|--------|-------|
| Small (32px) | 4px | `--radius-sm` |
| Medium (40px) | 4px | `--radius-sm` |
| Large (48px) | 4px | `--radius-sm` |
| Pill variant | 9999px | `--radius-full` |

### Inputs
| Type | Radius |
|------|--------|
| Text input | `--radius-sm` (4px) |
| Textarea | `--radius-sm` (4px) |
| Select | `--radius-sm` (4px) |
| Search (pill) | `--radius-full` |

### Cards
| Type | Radius | Notes |
|------|--------|-------|
| Standard card | `--radius-xl` (16px) | Default |
| Large/hero card | `--radius-2xl` (24px) | Brand emphasis |
| Nested content | `--radius-md` (8px) | Per nested rule |
| Dense/compact | `--radius-lg` (12px) | Data tables |

### Status Badges
| Type | Radius |
|------|--------|
| Standard badge | `--radius-sm` (4px) |
| Pill badge | `--radius-full` |
| Tag | `--radius-xs` (2px) |

### Modals & Dialogs
| Element | Radius |
|---------|--------|
| Modal container | `--radius-xl` (16px) |
| Modal inner sections | `--radius-md` (8px) |
| Dialog buttons | `--radius-sm` (4px) |

### Avatars & Icons
| Type | Radius |
|------|--------|
| Avatar (circular) | `--radius-full` |
| Avatar (rounded) | `--radius-md` (8px) |
| Icon container | `--radius-sm` (4px) |

### Images
| Context | Radius |
|---------|--------|
| Card thumbnail | `--radius-lg` (12px) |
| Hero image | `--radius-xl` (16px) |
| Avatar image | `--radius-full` |
| Gallery grid | `--radius-lg` (12px) |

## Dark Mode

Radius values remain consistent between light and dark modes. No adjustments needed.

## Industry Alignment

| System | Similar Values |
|--------|---------------|
| Material Design 3 | 4, 8, 12, 16 ✓ |
| Shopify Polaris | 2, 4, 8, 12, 16 ✓ |
| Radix Themes | 4, 8, 12, 16 ✓ |
| IBM Carbon | 4, 8 (subset) |

## Accessibility Notes

- Radius does not affect accessibility directly
- Ensure focus rings follow element shape: `outline-offset: 2px`
- Touch targets remain 24px minimum regardless of radius

## Anti-Patterns

```css
/* ❌ Don't: Arbitrary values */
.card {
  border-radius: 7px;
}

/* ✅ Do: Use scale tokens */
.card {
  border-radius: var(--radius-md); /* 8px */
}

/* ❌ Don't: Mismatched nested radius */
.parent {
  border-radius: 8px;
  padding: 12px;
}
.child {
  border-radius: 12px; /* Larger than parent! */
}

/* ✅ Do: Follow nested rule */
.parent {
  border-radius: var(--radius-xl); /* 16px */
  padding: 8px;
}
.child {
  border-radius: var(--radius-md); /* 8px = 16 - 8 */
}
```

## Tailwind Config

```js
// tailwind.config.js
module.exports = {
  theme: {
    borderRadius: {
      none: '0px',
      sm: '2px',      // xs in our system
      DEFAULT: '4px', // sm in our system
      md: '8px',
      lg: '12px',
      xl: '16px',
      '2xl': '24px',
      full: '9999px',
    },
  },
}
```

**Note:** Tailwind's default `rounded-sm` maps to our `radius-xs` (2px). Use `rounded` for our `radius-sm` (4px).
