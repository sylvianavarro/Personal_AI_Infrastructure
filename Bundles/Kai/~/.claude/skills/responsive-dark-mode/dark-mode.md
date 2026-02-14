# Dark Mode Implementation Guide

## Invela Dark Mode Specification

### Core Principle
Dark mode is NOT color inversion. It requires intentional design for:
- Reduced eye strain in low-light
- Maintained hierarchy and depth
- Consistent brand recognition
- WCAG AA contrast compliance

### Color Mapping

For authoritative light/dark color values, see `invela-brand/colors.md` — it contains the full 12-step blue, gray, and status scales with both light and dark mode hex values, semantic tokens, and CSS variables.

**Key dark mode anchors** (for quick reference only — `invela-brand/colors.md` is the source of truth):
- Background: gray-1 dark = `#181818`, elevated surfaces via gray scale
- Text: gray-12 dark = `#E0E0E0` (10.4:1 AAA)
- Brand blue: `#4166F5` (unchanged in dark mode)
- Status colors: Radix-harmonized dark variants in `invela-brand/colors.md`

### CSS Implementation

For the actual color hex values and CSS variable definitions, see:
- `invela-brand/colors.md` — semantic tokens, 12-step scales, light/dark CSS variables
- `invela-brand/shadows.md` — shadow CSS variables for both modes, elevation surfaces

The **implementation pattern** for theme switching:

```css
/* Apply semantic tokens from invela-brand/colors.md as CSS variables */
/* Then switch via class or data-attribute: */

.dark,
[data-theme="dark"] {
  /* Override :root variables with dark mode values from invela-brand/colors.md */
}

/* System preference detection */
@media (prefers-color-scheme: dark) {
  :root:not([data-theme="light"]) {
    /* Apply dark mode values */
  }
}
```

### React/Next.js Implementation

```tsx
// hooks/useTheme.ts
import { useEffect, useState } from 'react';

type Theme = 'light' | 'dark' | 'system';

export function useTheme() {
  const [theme, setTheme] = useState<Theme>('system');

  useEffect(() => {
    const stored = localStorage.getItem('theme') as Theme;
    if (stored) setTheme(stored);
  }, []);

  useEffect(() => {
    const root = document.documentElement;

    if (theme === 'system') {
      const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
      root.classList.toggle('dark', prefersDark);
      root.removeAttribute('data-theme');
    } else {
      root.classList.toggle('dark', theme === 'dark');
      root.setAttribute('data-theme', theme);
    }

    localStorage.setItem('theme', theme);
  }, [theme]);

  return { theme, setTheme };
}
```

### Tailwind Configuration

```js
// tailwind.config.js
module.exports = {
  darkMode: 'class', // or 'media' for system-only
  theme: {
    extend: {
      colors: {
        // Use CSS variables for theming
        background: {
          primary: 'var(--color-bg-primary)',
          secondary: 'var(--color-bg-secondary)',
          tertiary: 'var(--color-bg-tertiary)',
        },
        foreground: {
          primary: 'var(--color-text-primary)',
          secondary: 'var(--color-text-secondary)',
          muted: 'var(--color-text-tertiary)',
        },
      },
    },
  },
}
```

### Component Pattern

```tsx
// Automatically adapts to theme
<div className="
  bg-background-primary
  text-foreground-primary
  border-[var(--color-border-default)]
">
  <h1 className="text-foreground-primary">Title</h1>
  <p className="text-foreground-secondary">Description</p>
</div>

// Or with dark: prefix
<div className="
  bg-white dark:bg-[#181818]
  text-[#181818] dark:text-[#E0E0E0]
">
```

## Best Practices

### DO
- Use dark gray (#181818) not pure black (#000)
- Use off-white (#E0E0E0) not pure white (#FFF)
- Reduce saturation of vibrant colors
- Use elevation (lighter = higher)
- Test all contrast ratios
- Remember user preference
- Provide manual toggle
- Test with high contrast mode

### DON'T
- Simply invert colors
- Use pure black backgrounds
- Use same shadows as light mode
- Forget to desaturate images
- Skip testing in both modes
- Ignore system preference
- Remove brand colors

## Elevation System ✅ CONFIRMED

**Approach:** Elevation + Shadow (not just elevation alone)

In dark mode, higher surfaces are lighter. Shadows provide additional depth reinforcement.

For elevation surface hex values and shadow CSS variables, see `invela-brand/shadows.md` (Dark Mode section) and `invela-brand/colors.md` (Effect Colors / Dark Mode Elevation Surfaces).

The pattern maps elevation levels (0-5) to progressively lighter surface colors combined with progressively stronger shadow tokens (none through --shadow-xl).

## Testing Checklist

- [ ] All text passes 4.5:1 contrast
- [ ] UI components pass 3:1 contrast
- [ ] Focus states visible
- [ ] Images/icons visible
- [ ] Shadows appropriate
- [ ] Brand colors recognizable
- [ ] System preference works
- [ ] Manual toggle works
- [ ] Preference persists
- [ ] No flash on load
- [ ] Charts/graphs readable
- [ ] Form states visible
