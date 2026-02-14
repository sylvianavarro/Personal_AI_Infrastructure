# CreateDesignSpec Workflow

Create a comprehensive design specification for a project through collaborative brainstorming.

## Trigger

- "create design spec"
- "design system"
- Auto-triggered when no design spec exists for project

## Prerequisites

- Invoke `superpowers:brainstorming` skill for structured discovery
- Reference any existing UI/mockups/wireframes
- Check existing code for implicit patterns

## Process

### 1. Discovery Phase

Ask ONE question at a time in this order:

**Project Context:**
1. What's the purpose/vibe of this project? (Professional, playful, minimal, bold)
2. Target audience? (General public, developers, enterprise, creative)
3. Any reference sites or design inspirations?

**Color:**
4. Primary accent color preference? (Offer 3-4 options with hex)
5. Background approach? (Light, dark, both, custom)
6. Secondary accent color? (Offer complementary options)

**Typography:**
7. Display font style? (Sans-serif, serif, playful, technical)
8. Specific font preferences or constraints? (Google Fonts only, system fonts)

**Spacing & Layout:**
9. Spacing system preference? (4px, 8px, custom)
10. Border radius style? (Sharp, slightly rounded, fully rounded/pill)
11. Layout approach? (Sidebar, full-width, centered, dashboard)

**Motion:**
12. Animation style? (Minimal, subtle, playful, none)

**Components:**
13. Key components needed? (Review codebase, suggest based on needs)

### 2. Design Token Generation

Generate tokens based on answers:

```css
:root {
  /* Colors */
  --color-primary: #VALUE;
  --color-primary-light: #VALUE;
  --color-primary-dark: #VALUE;
  --color-secondary: #VALUE;
  --color-background: #VALUE;
  --color-surface: #VALUE;
  --color-text: #VALUE;
  --color-text-muted: #VALUE;
  --color-border: #VALUE;
  --color-error: #VALUE;
  --color-success: #VALUE;
  --color-warning: #VALUE;

  /* Typography */
  --font-display: 'FontName', sans-serif;
  --font-body: 'FontName', sans-serif;
  --font-mono: 'FontName', monospace;

  --font-size-xs: 0.75rem;
  --font-size-sm: 0.875rem;
  --font-size-base: 1rem;
  --font-size-lg: 1.125rem;
  --font-size-xl: 1.25rem;
  --font-size-2xl: 1.5rem;
  --font-size-3xl: 2rem;
  --font-size-4xl: 2.5rem;

  /* Spacing */
  --space-1: 0.25rem;
  --space-2: 0.5rem;
  --space-3: 0.75rem;
  --space-4: 1rem;
  --space-6: 1.5rem;
  --space-8: 2rem;
  --space-12: 3rem;
  --space-16: 4rem;

  /* Border Radius */
  --radius-sm: 0.25rem;
  --radius-md: 0.5rem;
  --radius-lg: 1rem;
  --radius-full: 9999px;

  /* Shadows */
  --shadow-sm: 0 1px 2px rgba(0,0,0,0.05);
  --shadow-md: 0 4px 6px rgba(0,0,0,0.1);
  --shadow-lg: 0 10px 15px rgba(0,0,0,0.1);

  /* Motion */
  --ease-default: cubic-bezier(0.4, 0, 0.2, 1);
  --ease-spring: cubic-bezier(0.34, 1.56, 0.64, 1);
  --duration-fast: 150ms;
  --duration-normal: 300ms;
  --duration-slow: 500ms;
}
```

### 3. Document Structure

Create `docs/plans/YYYY-MM-DD-<project>-design-system.md`:

```markdown
# Design System: [Project Name]

## Overview
[Brief description of design philosophy]

## Design Tokens

### Colors
[Color palette with hex values and contrast ratios]

### Typography
[Font families, sizes, weights, line heights]

### Spacing
[Spacing scale with values]

### Border Radius
[Radius scale]

### Shadows
[Shadow definitions]

### Motion
[Easing functions, durations]

## Components

### Buttons
[States: default, hover, active, disabled, loading]

### Forms
[Input fields, labels, validation states]

### Cards
[Variants and usage guidelines]

### Navigation
[Structure and patterns]

### [Other components as needed]

## Page Patterns

### Layouts
[Common layout patterns]

### Empty States
[How to handle empty content]

### Loading States
[Skeleton, spinner, progress patterns]

### Error States
[Error message display patterns]

## Accessibility

### Color Contrast
[Contrast ratios for all color combinations]

### Focus States
[Focus indicator styling]

### Motion
[Reduced motion considerations]

## Iconography
[Icon style, library, sizing]

## Implementation Notes
[Framework-specific guidance if needed]
```

### 4. Validation

Present design in sections (200-300 words each):
1. Colors and overall vibe
2. Typography and spacing
3. Component patterns
4. Accessibility considerations

Ask after each: "Does this look right so far?"

### 5. Commit

- Write to `docs/plans/YYYY-MM-DD-<project>-design-system.md`
- Commit with message: `docs: add design system specification`

## Output

- Complete design system markdown document
- CSS custom properties ready for implementation
- Component guidelines
- Accessibility checklist pre-filled
