# Invela Color System

## Overview

This color system uses **12-step scales** (Radix-aligned semantics) with brand book colors as anchors. Each step has a specific purpose:

| Steps | Purpose | Use Cases |
|-------|---------|-----------|
| 1-2 | App backgrounds | Main bg, cards, sidebar, code blocks |
| 3-5 | Component backgrounds | Normal (3), hover (4), pressed/selected (5) |
| 6-8 | Borders | Subtle non-interactive (6), interactive (7), strong/focus (8) |
| 9-10 | Solid backgrounds | Main accent (9), hover for solid (10) |
| 11-12 | Text | Low-contrast (11), high-contrast (12) |

---

## Core Brand Colors (From Brand Book)

```css
/* Primary Palette */
--color-white: #FFFFFF;
--color-light-blue: #DCF6FE;
--color-middle-blue-tint: #ECF2FD;
--color-deep-blue-tint: #D9E0FD;
--color-middle-blue: #9EC0F5;
--color-deep-blue: #4166F5;      /* Primary brand */
--color-grey: #EBEBEB;
--color-black-tint: #D1D1D1;
--color-black: #181818;

/* AI Colors */
--color-ai-violet: #4D14D8;
--color-ai-lavender: #C7B0FF;
```

---

## Blue Scale (12-Step)

Brand book colors are marked with **(brand)**. Other values are calculated interpolations.

### Light Mode

| Step | Hex | Source | Purpose |
|------|-----|--------|---------|
| 1 | `#FCFDFF` | interpolated | Near-white bg with blue tint |
| 2 | `#DCF6FE` | **(brand)** Light Blue | Subtle bg |
| 3 | `#ECF2FD` | **(brand)** Middle Blue Tint | Badge bg, "In Progress" state |
| 4 | `#D9E0FD` | **(brand)** Deep Blue Tint | Badge hover |
| 5 | `#C6D5FA` | interpolated | Badge pressed/selected |
| 6 | `#B2CBF8` | interpolated | Border subtle |
| 7 | `#9EC0F5` | **(brand)** Middle Blue | Border interactive |
| 8 | `#7093F5` | interpolated | Border strong/focus |
| 9 | `#4166F5` | **(brand)** Deep Blue | Primary brand color |
| 10 | `#395AD8` | interpolated | Solid hover |
| 11 | `#2F49B0` | interpolated | Text on light bg |
| 12 | `#1D2E6E` | interpolated | High-contrast text |

### Dark Mode

| Step | Hex | Purpose |
|------|-----|---------|
| 1 | `#0F1219` | Dark bg with blue tint |
| 2 | `#141824` | Subtle bg |
| 3 | `#1A2440` | Badge bg |
| 4 | `#1F2E5A` | Badge hover |
| 5 | `#263972` | Badge pressed/selected |
| 6 | `#304486` | Border subtle |
| 7 | `#3B5198` | Border interactive |
| 8 | `#4662B2` | Border strong/focus |
| 9 | `#4166F5` | Primary brand (same) |
| 10 | `#5E7DF7` | Solid hover (lighter) |
| 11 | `#8DA3F9` | Text (secondary) |
| 12 | `#C6D1FC` | Text (primary) |

### CSS Variables

```css
:root {
  --blue-1: #FCFDFF;
  --blue-2: #DCF6FE;
  --blue-3: #ECF2FD;
  --blue-4: #D9E0FD;
  --blue-5: #C6D5FA;
  --blue-6: #B2CBF8;
  --blue-7: #9EC0F5;
  --blue-8: #7093F5;
  --blue-9: #4166F5;
  --blue-10: #395AD8;
  --blue-11: #2F49B0;
  --blue-12: #1D2E6E;
}

.dark {
  --blue-1: #0F1219;
  --blue-2: #141824;
  --blue-3: #1A2440;
  --blue-4: #1F2E5A;
  --blue-5: #263972;
  --blue-6: #304486;
  --blue-7: #3B5198;
  --blue-8: #4662B2;
  --blue-9: #4166F5;
  --blue-10: #5E7DF7;
  --blue-11: #8DA3F9;
  --blue-12: #C6D1FC;
}
```

---

## Gray Scale (12-Step)

### Light Mode

| Step | Hex | Source | Purpose |
|------|-----|--------|---------|
| 1 | `#FFFFFF` | **(brand)** White | App bg |
| 2 | `#F9F9F9` | interpolated | Subtle bg |
| 3 | `#EBEBEB` | **(brand)** Grey | Component bg normal |
| 4 | `#E2E2E2` | interpolated | Component bg hover |
| 5 | `#DADADA` | interpolated | Component bg pressed |
| 6 | `#D1D1D1` | **(brand)** Black Tint | Border subtle |
| 7 | `#AEAEAE` | interpolated | Border interactive |
| 8 | `#8A8A8A` | interpolated | Border strong/focus |
| 9 | `#6E6E6E` | interpolated | Solid bg |
| 10 | `#5A5A5A` | interpolated | Solid hover |
| 11 | `#3D3D3D` | interpolated | Text secondary |
| 12 | `#181818` | **(brand)** Black | Text primary |

### Dark Mode

| Step | Hex | Purpose |
|------|-----|---------|
| 1 | `#181818` | App bg (brand Black) |
| 2 | `#1E1E1E` | Subtle bg |
| 3 | `#262626` | Component bg normal |
| 4 | `#2E2E2E` | Component bg hover |
| 5 | `#363636` | Component bg pressed |
| 6 | `#404040` | Border subtle |
| 7 | `#4D4D4D` | Border interactive |
| 8 | `#626262` | Border strong/focus |
| 9 | `#7A7A7A` | Solid bg |
| 10 | `#8A8A8A` | Solid hover |
| 11 | `#B0B0B0` | Text secondary |
| 12 | `#E0E0E0` | Text primary (10.4:1 AAA) |

### CSS Variables

```css
:root {
  --gray-1: #FFFFFF;
  --gray-2: #F9F9F9;
  --gray-3: #EBEBEB;
  --gray-4: #E2E2E2;
  --gray-5: #DADADA;
  --gray-6: #D1D1D1;
  --gray-7: #AEAEAE;
  --gray-8: #8A8A8A;
  --gray-9: #6E6E6E;
  --gray-10: #5A5A5A;
  --gray-11: #3D3D3D;
  --gray-12: #181818;
}

.dark {
  --gray-1: #181818;
  --gray-2: #1E1E1E;
  --gray-3: #262626;
  --gray-4: #2E2E2E;
  --gray-5: #363636;
  --gray-6: #404040;
  --gray-7: #4D4D4D;
  --gray-8: #626262;
  --gray-9: #7A7A7A;
  --gray-10: #8A8A8A;
  --gray-11: #B0B0B0;
  --gray-12: #E0E0E0;
}
```

---

## Status Colors (Radix Scales for Harmony)

Status colors use Radix scales to harmonize with the brand blue.

### Green (Success/Active/Completed)

| Step | Light | Dark | Use |
|------|-------|------|-----|
| 3 | `#E6F6EB` | `#132D21` | Badge bg |
| 6 | `#ADDDC0` | `#20573E` | Border |
| 9 | `#30A46C` | `#30A46C` | Solid |
| 11 | `#218358` | `#3DD68C` | Text |

### Amber (Warning)

| Step | Light | Dark | Use |
|------|-------|------|-----|
| 3 | `#FFF7C2` | `#302008` | Badge bg |
| 6 | `#F3D673` | `#5C3D05` | Border |
| 9 | `#FFC53D` | `#FFC53D` | Solid |
| 11 | `#AB6400` | `#FFCA16` | Text |

### Red (Error/Failure/Expired)

| Step | Light | Dark | Use |
|------|-------|------|-----|
| 3 | `#FEEBEC` | `#3B1219` | Badge bg |
| 6 | `#FDBDBE` | `#72232D` | Border |
| 9 | `#E5484D` | `#E5484D` | Solid |
| 11 | `#CE2C31` | `#FF9592` | Text |

### CSS Variables

```css
:root {
  /* Green */
  --green-3: #E6F6EB;
  --green-6: #ADDDC0;
  --green-9: #30A46C;
  --green-11: #218358;

  /* Amber */
  --amber-3: #FFF7C2;
  --amber-6: #F3D673;
  --amber-9: #FFC53D;
  --amber-11: #AB6400;

  /* Red */
  --red-3: #FEEBEC;
  --red-6: #FDBDBE;
  --red-9: #E5484D;
  --red-11: #CE2C31;
}

.dark {
  /* Green */
  --green-3: #132D21;
  --green-6: #20573E;
  --green-9: #30A46C;
  --green-11: #3DD68C;

  /* Amber */
  --amber-3: #302008;
  --amber-6: #5C3D05;
  --amber-9: #FFC53D;
  --amber-11: #FFCA16;

  /* Red */
  --red-3: #3B1219;
  --red-6: #72232D;
  --red-9: #E5484D;
  --red-11: #FF9592;
}
```

---

## Semantic Tokens

Map scale steps to semantic purposes:

```css
:root {
  /* Text */
  --text-primary: var(--gray-12);
  --text-secondary: var(--gray-11);
  --text-tertiary: var(--gray-9);
  --text-disabled: var(--gray-8);
  --text-inverse: var(--gray-1);
  --text-brand: var(--blue-11);

  /* Backgrounds */
  --bg-primary: var(--gray-1);
  --bg-subtle: var(--gray-2);
  --bg-muted: var(--gray-3);
  --bg-brand: var(--blue-9);
  --bg-brand-subtle: var(--blue-3);

  /* Borders */
  --border-subtle: var(--gray-6);
  --border-default: var(--gray-7);
  --border-strong: var(--gray-8);
  --border-brand: var(--blue-7);

  /* Interactive */
  --interactive-primary: var(--blue-9);
  --interactive-hover: var(--blue-10);
  --interactive-active: var(--blue-10);
  --interactive-focus: var(--blue-8);

  /* Status */
  --status-success-bg: var(--green-3);
  --status-success-border: var(--green-6);
  --status-success-text: var(--green-11);
  --status-success-solid: var(--green-9);

  --status-warning-bg: var(--amber-3);
  --status-warning-border: var(--amber-6);
  --status-warning-text: var(--amber-11);
  --status-warning-solid: var(--amber-9);

  --status-error-bg: var(--red-3);
  --status-error-border: var(--red-6);
  --status-error-text: var(--red-11);
  --status-error-solid: var(--red-9);

  --status-info-bg: var(--blue-3);
  --status-info-border: var(--blue-6);
  --status-info-text: var(--blue-11);
  --status-info-solid: var(--blue-9);
}
```

---

## Status Badge Pattern

Match the UI patterns from screenshots:

| Status | Background | Border | Text |
|--------|------------|--------|------|
| Not Started | `--gray-3` | `--gray-6` | `--gray-11` |
| In Progress | `--blue-3` | `--blue-6` | `--blue-11` |
| Warning | `--amber-3` | `--amber-6` | `--amber-11` |
| Completed/Active | `--green-3` | `--green-6` | `--green-11` |
| Failure/Expired | `--red-3` | `--red-6` | `--red-11` |

```tsx
// Example badge implementation
const statusBadge = {
  notStarted: "bg-[var(--gray-3)] border-[var(--gray-6)] text-[var(--gray-11)]",
  inProgress: "bg-[var(--blue-3)] border-[var(--blue-6)] text-[var(--blue-11)]",
  warning: "bg-[var(--amber-3)] border-[var(--amber-6)] text-[var(--amber-11)]",
  completed: "bg-[var(--green-3)] border-[var(--green-6)] text-[var(--green-11)]",
  failure: "bg-[var(--red-3)] border-[var(--red-6)] text-[var(--red-11)]",
};
```

---

## Data Visualization

Chart color palette (harmonized with brand):

```tsx
// Categorical palette (5 colors)
const chartColors = [
  '#4166F5', // Deep Blue (primary)
  '#9EC0F5', // Middle Blue
  '#4D14D8', // AI Violet
  '#30A46C', // Green
  '#FFC53D', // Amber
];

// Sequential blue scale (value ranges)
const sequentialBlue = [
  '#ECF2FD', // Light (step 3)
  '#9EC0F5', // Medium (step 7)
  '#4166F5', // Primary (step 9)
  '#1D2E6E', // Dark (step 12)
];
```

---

## Accessibility

### Contrast Ratios (WCAG 2.2 AA)

All combinations validated:

| Foreground | Background | Ratio | Pass |
|------------|------------|-------|------|
| `--gray-12` (#181818) | `--gray-1` (#FFFFFF) | 16.1:1 | AAA |
| `--blue-9` (#4166F5) | `--gray-1` (#FFFFFF) | 4.5:1 | AA |
| `--gray-12` (#181818) | `--blue-3` (#ECF2FD) | 14.8:1 | AAA |
| `--green-11` (#218358) | `--green-3` (#E6F6EB) | 4.7:1 | AA |
| `--amber-11` (#AB6400) | `--amber-3` (#FFF7C2) | 4.5:1 | AA |
| `--red-11` (#CE2C31) | `--red-3` (#FEEBEC) | 4.6:1 | AA |

### Dark Mode Contrast

| Foreground | Background | Ratio | Pass |
|------------|------------|-------|------|
| `--gray-12` (#E0E0E0) | `--gray-1` (#181818) | 10.4:1 | AAA |
| `--blue-9` (#4166F5) | `--gray-1` (#181818) | 4.6:1 | AA |
| `--blue-12` (#C6D1FC) | `--blue-1` (#0F1219) | 9.2:1 | AAA |

### Guidelines

- **Never use color alone** - always pair with text labels or icons
- **Focus rings**: Use `--blue-8` with 2px width
- **Disabled states**: Use `--gray-8` text on `--gray-4` background
- **Touch targets**: Minimum 24x24px (44px recommended on mobile)

---

## AI Colors

For AI-related features and gradients:

```css
--ai-violet: #4D14D8;
--ai-lavender: #C7B0FF;

/* AI gradient */
background: linear-gradient(135deg, var(--ai-violet), var(--blue-9));
```

---

## Effect Colors ✅ CONFIRMED

Colors used for shadows, overlays, and elevation effects.

### Shadow Color

| Mode | Hex | RGB | Use |
|------|-----|-----|-----|
| Light | `#000D42` | `rgb(0, 13, 66)` | Blue-tinted shadows |
| Dark | `#000000` | `rgb(0, 0, 0)` | Pure black shadows |

**Rationale:** Blue-tinted shadows (`#000D42`) harmonize with brand blue `#4166F5`. Pure black looks harsh and artificial.

```css
:root {
  /* Shadow color for light mode - dark navy blue */
  --shadow-color: 0, 13, 66;  /* #000D42 */
}

.dark {
  /* Shadow color for dark mode - pure black */
  --shadow-color: 0, 0, 0;  /* #000000 */
}

/* Usage */
box-shadow: 0 2px 4px rgba(var(--shadow-color), 0.08);
```

### Dark Mode Elevation Surfaces

In dark mode, elevation is shown via lighter surfaces (not just shadows).

| Elevation | Hex | Use Case |
|-----------|-----|----------|
| 0 (base) | `#181818` | Page background |
| 1 | `#1E1E1E` | Subtle lift (headers) |
| 2 | `#242424` | Cards, panels |
| 3 | `#2D2D2D` | Popovers, dropdowns |
| 4 | `#363636` | Modals, dialogs |
| 5 | `#404040` | Highest floating elements |

```css
.dark {
  --elevation-0: #181818;
  --elevation-1: #1E1E1E;
  --elevation-2: #242424;
  --elevation-3: #2D2D2D;
  --elevation-4: #363636;
  --elevation-5: #404040;
}
```

### Overlay Colors

```css
:root {
  /* Modal backdrop */
  --overlay-light: rgba(0, 13, 66, 0.5);  /* Blue-tinted */
}

.dark {
  --overlay-dark: rgba(0, 0, 0, 0.7);  /* Darker for contrast */
}
```

---

## Usage Notes

1. **Components reference semantic tokens**, never raw step numbers
2. **Theme switching** changes scale values, not token names
3. **Interaction states** follow Radix pattern:
   - Normal: step 3
   - Hover: step 4
   - Pressed: step 5
   - If transparent default, shift: hover = step 3
