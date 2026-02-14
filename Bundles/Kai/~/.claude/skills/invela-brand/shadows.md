# Shadow Scale

Invela's shadow system using layered, brand-tinted shadows per Vercel guidelines.

## Philosophy

Shadows simulate real light sources:
- **Ambient light**: Soft, diffuse shadows from all directions
- **Direct light**: Sharper shadows from a key light source (above)

Every shadow uses at least two layers for realistic depth.

## Key Principle: Blue-Tinted Shadows ✅ CONFIRMED

**Pure black shadows look harsh and artificial.** Invela uses brand-aligned shadow colors:

| Mode | Shadow Color | RGB | Rationale |
|------|--------------|-----|-----------|
| Light | `#000D42` | `rgb(0, 13, 66)` | Dark navy, harmonizes with brand blue #4166F5 |
| Dark | `#000000` | `rgb(0, 0, 0)` | Pure black, combined with elevation surfaces |

**Source:** Figma design system uses `rgba(0, 13, 66, 0.08)` for card shadows.

**Decision (2026-01-21):** Blue-tinted shadows for light mode, elevation + shadow for dark mode.

### Why Tinted Shadows?

From [Josh W. Comeau](https://www.joshwcomeau.com/css/designing-shadows/):
> "Pure black makes the contrast ratio too big to look natural."

From [Vercel Guidelines](~/.claude/skills/vercel-web-interface/design-patterns.md):
> "On colored backgrounds, tint borders/shadows/text toward the same hue."

## Scale

| Token | Elevation | Use Case |
|-------|-----------|----------|
| `none` | 0 | Flat elements, disabled states |
| `sm` | 1 | Subtle lift (buttons, inputs) |
| `DEFAULT` | 2 | Standard cards, dropdowns |
| `md` | 3 | Hover states, floating elements |
| `lg` | 4 | Popovers, tooltips |
| `xl` | 5 | Modals, dialogs |
| `2xl` | 6 | Overlays, command palettes |

## CSS Variables

```css
:root {
  /* Light Mode - Blue-tinted shadows */
  /* Shadow color: #000D42 = rgb(0, 13, 66) - dark navy harmonizing with brand blue */
  --shadow-color: 0, 13, 66;
  --shadow-none: none;

  --shadow-sm:
    0 1px 2px 0 rgba(var(--shadow-color), 0.04),    /* Ambient */
    0 1px 2px 0 rgba(var(--shadow-color), 0.08);    /* Direct */

  --shadow-DEFAULT:
    0 1px 2px 0 rgba(var(--shadow-color), 0.04),    /* Ambient */
    0 2px 4px 0 rgba(var(--shadow-color), 0.08);    /* Direct - matches Figma 0.08 */

  --shadow-md:
    0 2px 4px 0 rgba(var(--shadow-color), 0.05),    /* Ambient */
    0 4px 8px 0 rgba(var(--shadow-color), 0.10);    /* Direct */

  --shadow-lg:
    0 4px 6px 0 rgba(var(--shadow-color), 0.05),    /* Ambient */
    0 8px 16px 0 rgba(var(--shadow-color), 0.10);   /* Direct */

  --shadow-xl:
    0 8px 12px 0 rgba(var(--shadow-color), 0.06),   /* Ambient */
    0 16px 32px 0 rgba(var(--shadow-color), 0.12);  /* Direct */

  --shadow-2xl:
    0 12px 20px 0 rgba(var(--shadow-color), 0.06),  /* Ambient */
    0 24px 48px 0 rgba(var(--shadow-color), 0.14);  /* Direct */

  /* Inset (inputs, pressed states) */
  --shadow-inner: inset 0 1px 2px 0 rgba(var(--shadow-color), 0.06);

  /* Focus ring */
  --shadow-focus: 0 0 0 2px var(--color-blue-9);
  --shadow-focus-error: 0 0 0 2px var(--color-red-9);
}
```

## Dark Mode ✅ CONFIRMED

### Approach: Elevation + Shadow

**Decision (2026-01-21):** Use BOTH elevation (lighter surfaces) AND shadows for depth in dark mode.

Elevation provides the primary visual hierarchy; shadows add subtle reinforcement for floating elements.

| Elevation | Surface Color | Usage |
|-----------|---------------|-------|
| 0 (base) | `#181818` | Page background |
| 1 | `#1E1E1E` | Subtle lift (headers) |
| 2 | `#242424` | Cards, panels |
| 3 | `#2D2D2D` | Popovers, dropdowns |
| 4 | `#363636` | Modals, dialogs |
| 5 | `#404040` | Highest elevation |

**Sources:**
- [Netguru](https://www.netguru.com/blog/tips-dark-mode-ui): "Lighter layers appear more elevated"
- [Halo Lab](https://www.halo-lab.com/blog/dark-ui-design-11-tips-for-dark-mode-design): "Use light to create elevation"

### Secondary: Higher Opacity Shadows

When shadows ARE needed (e.g., floating elements over varied backgrounds), use 2-3x the opacity:

```css
.dark {
  /* Pure black - no tint needed on dark backgrounds */
  --shadow-color: 0, 0, 0;

  --shadow-sm:
    0 1px 2px 0 rgba(0, 0, 0, 0.15),
    0 1px 2px 0 rgba(0, 0, 0, 0.25);

  --shadow-DEFAULT:
    0 1px 2px 0 rgba(0, 0, 0, 0.18),
    0 2px 4px 0 rgba(0, 0, 0, 0.30);

  --shadow-md:
    0 2px 4px 0 rgba(0, 0, 0, 0.20),
    0 4px 8px 0 rgba(0, 0, 0, 0.35);

  --shadow-lg:
    0 4px 6px 0 rgba(0, 0, 0, 0.20),
    0 8px 16px 0 rgba(0, 0, 0, 0.40);

  --shadow-xl:
    0 8px 12px 0 rgba(0, 0, 0, 0.25),
    0 16px 32px 0 rgba(0, 0, 0, 0.45);

  --shadow-2xl:
    0 12px 20px 0 rgba(0, 0, 0, 0.25),
    0 24px 48px 0 rgba(0, 0, 0, 0.50);

  --shadow-inner: inset 0 1px 2px 0 rgba(0, 0, 0, 0.30);
}
```

### Alternative: Subtle Glow (Optional)

On very dark backgrounds, a subtle light glow can indicate elevation:

```css
/* Use sparingly - only for highest priority floating elements */
.dark .glow-card {
  box-shadow:
    0 0 0 1px rgba(255, 255, 255, 0.05),  /* Subtle border */
    0 0 20px rgba(255, 255, 255, 0.03);    /* Soft glow */
}
```

### Dark Mode Elevation CSS

```css
/* Complete elevation system for dark mode */
.dark {
  /* Elevation surfaces - PRIMARY depth mechanism */
  --elevation-0: #181818;  /* Base */
  --elevation-1: #1E1E1E;  /* +6 lightness */
  --elevation-2: #242424;  /* +12 lightness */
  --elevation-3: #2D2D2D;  /* +21 lightness */
  --elevation-4: #363636;  /* +30 lightness */
  --elevation-5: #404040;  /* +40 lightness */

  /* Usage */
  --color-bg-page: var(--elevation-0);
  --color-bg-card: var(--elevation-2);
  --color-bg-popover: var(--elevation-3);
  --color-bg-modal: var(--elevation-4);
}
```

### Dark Mode Component Guidelines

| Scenario | Elevation | Shadow |
|----------|-----------|--------|
| Card on page | `#242424` | `--shadow-sm` |
| Dropdown over card | `#2D2D2D` | `--shadow-md` |
| Modal over backdrop | `#363636` | `--shadow-lg` |
| Dragging element | Same as source | `--shadow-xl` |
| Tooltip | `#2D2D2D` | `--shadow-md` |

## Tailwind Config

```js
// tailwind.config.js
module.exports = {
  theme: {
    boxShadow: {
      none: 'none',
      // Blue-tinted: rgba(0, 13, 66, opacity) = #000D42
      sm: '0 1px 2px 0 rgba(0, 13, 66, 0.04), 0 1px 2px 0 rgba(0, 13, 66, 0.08)',
      DEFAULT: '0 1px 2px 0 rgba(0, 13, 66, 0.04), 0 2px 4px 0 rgba(0, 13, 66, 0.08)',
      md: '0 2px 4px 0 rgba(0, 13, 66, 0.05), 0 4px 8px 0 rgba(0, 13, 66, 0.10)',
      lg: '0 4px 6px 0 rgba(0, 13, 66, 0.05), 0 8px 16px 0 rgba(0, 13, 66, 0.10)',
      xl: '0 8px 12px 0 rgba(0, 13, 66, 0.06), 0 16px 32px 0 rgba(0, 13, 66, 0.12)',
      '2xl': '0 12px 20px 0 rgba(0, 13, 66, 0.06), 0 24px 48px 0 rgba(0, 13, 66, 0.14)',
      inner: 'inset 0 1px 2px 0 rgba(0, 13, 66, 0.06)',
    },
  },
}
```

### Dark Mode Override

```js
// For Tailwind dark mode, use CSS variables or plugin
// Option 1: CSS variables (recommended)
// Define --shadow-color in CSS, reference in shadows

// Option 2: Dark mode plugin
plugins: [
  function({ addBase }) {
    addBase({
      '.dark': {
        '--shadow-color': '0, 0, 0',
      },
    });
  },
],
```

## Radix Alignment

| Invela | Radix | Notes |
|--------|-------|-------|
| `--shadow-sm` | `--shadow-1` | Inset in Radix, outer in Invela |
| `--shadow-DEFAULT` | `--shadow-2` | Similar elevation |
| `--shadow-md` | `--shadow-3` | Similar elevation |
| `--shadow-lg` | `--shadow-4` | Similar elevation |
| `--shadow-xl` | `--shadow-5` | Similar elevation |
| `--shadow-2xl` | `--shadow-6` | Highest elevation |

**Note:** Radix includes `0 0 0 1px` border-shadows. If using Radix components, their shadows include subtle borders. For custom components, consider adding:

```css
.card {
  box-shadow:
    0 0 0 1px rgba(0, 13, 66, 0.06),  /* Border shadow - blue tinted */
    var(--shadow-DEFAULT);
}

.dark .card {
  box-shadow:
    0 0 0 1px rgba(255, 255, 255, 0.06),  /* Border shadow - light on dark */
    var(--shadow-DEFAULT);
}
```

## Component Guidelines

### Buttons
| State | Shadow |
|-------|--------|
| Rest | `--shadow-sm` |
| Hover | `--shadow-md` |
| Active/Pressed | `--shadow-inner` or `none` |
| Disabled | `none` |

### Cards
| Type | Shadow |
|------|--------|
| Flat card | `none` (use border instead) |
| Elevated card | `--shadow-DEFAULT` |
| Hover state | `--shadow-md` |
| Dragging | `--shadow-lg` |

### Inputs
| State | Shadow |
|-------|--------|
| Rest | `--shadow-inner` (subtle) |
| Focus | `--shadow-focus` |
| Error | `--shadow-focus-error` |

### Dropdowns & Popovers
| Element | Shadow |
|---------|--------|
| Dropdown menu | `--shadow-lg` |
| Popover | `--shadow-lg` |
| Tooltip | `--shadow-md` |
| Command palette | `--shadow-2xl` |

### Modals & Dialogs
| Element | Shadow |
|---------|--------|
| Modal | `--shadow-xl` |
| Dialog | `--shadow-xl` |
| Full-screen overlay | `--shadow-2xl` |

### Navigation
| Element | Shadow |
|---------|--------|
| Sticky header | `--shadow-sm` |
| Sidebar | `--shadow-DEFAULT` |
| Mobile nav | `--shadow-xl` |

## Colored Shadows

For branded elements, tint shadows toward the element's hue:

```css
/* Blue button with blue-tinted shadow */
.button-primary {
  background: var(--color-blue-9);
  box-shadow:
    0 2px 4px 0 rgba(65, 102, 245, 0.15),  /* Blue tint */
    0 4px 8px 0 rgba(65, 102, 245, 0.20);
}

/* Error state with red-tinted shadow */
.card-error {
  border-color: var(--color-red-8);
  box-shadow:
    0 2px 4px 0 rgba(206, 44, 49, 0.10),
    0 4px 8px 0 rgba(206, 44, 49, 0.15);
}
```

## Focus Rings

Accessible focus indicators using shadow:

```css
/* Default focus ring */
.focusable:focus-visible {
  outline: none;
  box-shadow:
    0 0 0 2px var(--color-white),          /* Gap */
    0 0 0 4px var(--color-blue-9);         /* Ring */
}

/* Focus on dark backgrounds */
.dark .focusable:focus-visible {
  box-shadow:
    0 0 0 2px var(--color-gray-1),
    0 0 0 4px var(--color-blue-9);
}
```

## Transition

Shadows should transition smoothly on hover:

```css
.card {
  box-shadow: var(--shadow-DEFAULT);
  transition: box-shadow 150ms ease-out;
}

.card:hover {
  box-shadow: var(--shadow-md);
}
```

## Industry Alignment

| System | Levels | Approach |
|--------|--------|----------|
| **Tailwind** | 7 | Single-layer, offset-based |
| **Material Design 3** | 5 | Multi-layer, y-offset |
| **Radix Themes** | 6 | Multi-layer + border shadows |
| **IBM Carbon** | 5 | Named semantically |
| **Invela** | 7 | Multi-layer (Vercel style) |

## Anti-Patterns

```css
/* ❌ Single-layer shadow looks flat */
.card {
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

/* ✅ Multi-layer shadow looks realistic */
.card {
  box-shadow:
    0 2px 4px 0 rgba(0, 0, 0, 0.03),
    0 4px 8px 0 rgba(0, 0, 0, 0.08);
}

/* ❌ Gray shadow on colored background */
.blue-card {
  background: #4166F5;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

/* ✅ Tinted shadow on colored background */
.blue-card {
  background: #4166F5;
  box-shadow: 0 4px 8px rgba(65, 102, 245, 0.3);
}

/* ❌ Same shadow in light and dark mode */
/* ✅ Increase opacity for dark mode */
```

## Accessibility Notes

- Shadows are decorative - don't rely on them for information
- Focus rings must be visible (2px minimum, high contrast)
- Ensure sufficient contrast between elevated elements
- Test shadows on various monitor brightness levels
