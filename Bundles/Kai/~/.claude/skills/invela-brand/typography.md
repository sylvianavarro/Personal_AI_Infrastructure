# Invela Typography System

## Font Stack

### Primary Fonts
| Font | Weights | Use |
|------|---------|-----|
| Plus Jakarta Sans | Bold (700), SemiBold (600), Light (300) | App UI, headings |
| Lexend | Light (300), Extra Light (200) | Marketing, body copy |
| Sulphur Point | Bold (700) | ALL CAPS labels, overlines |

### Fallback Stack
```css
font-family: 'Plus Jakarta Sans', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
```

## Application Typography (13 Styles)

Line heights use **ratios** (CSS source of truth). Computed px shown for Figma reference.

| Style | Font | Size | Weight | Line Height | Computed | Use |
|-------|------|------|--------|-------------|----------|-----|
| Display | Plus Jakarta Sans | 48px | Bold | 1.17 | ~56px | Hero sections |
| H1 | Plus Jakarta Sans | 32px | Bold | 1.25 | 40px | Page titles |
| H2 | Plus Jakarta Sans | 24px | Bold | 1.33 | 32px | Section titles |
| H3 | Plus Jakarta Sans | 20px | SemiBold | 1.4 | 28px | Card titles |
| H4 | Plus Jakarta Sans | 16px | SemiBold | 1.5 | 24px | Subsections |
| H5 | Plus Jakarta Sans | 14px | SemiBold | 1.43 | 20px | Small headers |
| Body Large | Plus Jakarta Sans | 16px | Light | 1.5 | 24px | Lead paragraphs |
| Body | Plus Jakarta Sans | 14px | Light | 1.43 | 20px | Default body |
| Body Small | Plus Jakarta Sans | 12px | Light | 1.33 | 16px | Secondary text |
| Caption | Plus Jakarta Sans | 12px | Light | 1.33 | 16px | Metadata |
| Overline | Sulphur Point | 12px | Bold | 1.33 | 16px | Labels (ALL CAPS) |
| Button | Plus Jakarta Sans | 14px | SemiBold | 1.43 | 20px | Button text |
| Input | Plus Jakarta Sans | 14px | Light | 1.43 | 20px | Form inputs |

## Marketing Typography (15 Styles)

*For Word/PDF documents. Uses pt (points) as these are print-oriented.*

| Style | Font | Size | Weight | Line Height | Use |
|-------|------|------|--------|-------------|-----|
| Title | Plus Jakarta Sans | 32pt | Bold | 40pt | Document titles |
| H1 | Plus Jakarta Sans | 24pt | Bold | 32pt | Main headings |
| H2 | Plus Jakarta Sans | 18pt | Bold | 24pt | Section headings |
| H3 | Plus Jakarta Sans | 14pt | Bold | 20pt | Subsections |
| H4 | Plus Jakarta Sans | 12pt | Bold | 16pt | Minor headings |
| Subtitle | Lexend | 13pt | Light | 18pt | Subheadings |
| Normal | Lexend | 12pt | Light | 18pt | Body text |
| Body Light | Lexend | 12pt | Extra Light | 18pt | Secondary body |
| Caption | Lexend | 12pt | Light Italic | 16pt | Captions |
| Overline | Sulphur Point | 12pt | Bold | 16pt | Labels (ALL CAPS) |

## CSS Implementation

```css
/* Typography scale (12px minimum for accessibility) */
--font-size-xs: 0.75rem;    /* 12px - minimum, captions/overlines */
--font-size-sm: 0.875rem;   /* 14px - body, buttons, inputs */
--font-size-base: 0.875rem; /* 14px - default body */
--font-size-lg: 1rem;       /* 16px - body large, H4 */
--font-size-xl: 1.25rem;    /* 20px - H3 */
--font-size-2xl: 1.5rem;    /* 24px - H2 */
--font-size-3xl: 2rem;      /* 32px - H1 */
--font-size-4xl: 3rem;      /* 48px - Display */

/* Line heights (ratios - scale with font size) */
--line-height-none: 1;        /* Display text, single line */
--line-height-tight: 1.25;    /* Headings (H1) */
--line-height-snug: 1.33;     /* Headings (H2), small text */
--line-height-normal: 1.43;   /* Body text, buttons, inputs */
--line-height-relaxed: 1.5;   /* Body large, H4 */
--line-height-loose: 1.75;    /* Long-form reading */

/* Font weights */
--font-weight-light: 300;
--font-weight-normal: 400;
--font-weight-medium: 500;
--font-weight-semibold: 600;
--font-weight-bold: 700;

/* Letter spacing */
--letter-spacing-tight: -0.01em;
--letter-spacing-normal: 0;
--letter-spacing-wide: 0.02em;
--letter-spacing-caps: 0.05em; /* For ALL CAPS */
```

## Financial Data Typography

For tabular data (numbers, currency):
```css
font-variant-numeric: lining-nums tabular-nums;
```

Both Plus Jakarta Sans (v2.6+) and Lexend support tabular figures.

### Number Display Rules
- Right-align numbers in tables
- Always show 2 decimal places for currency
- Use thousand separators (1,000,000)
- Negatives: Use color + symbol (red with minus or parentheses)

## Accessibility

- **Minimum text size: 12px** (aligns with Carbon/Polaris/Lightning)
- Body text: 14px default
- Maintain 1.5 line-height ratio for readability
- Support text resize up to 200% without loss of functionality
- Letter spacing adjustable per WCAG 1.4.12

## Typographic Characters

### Quotes
```
✅ "Curly double quotes" and 'curly single quotes'
❌ "Straight double quotes" and 'straight single quotes'
```
Use proper typographic quotes in all user-facing text.

### Ellipsis
```
✅ Loading… (single character: … or &hellip;)
❌ Loading... (three periods)
```

### Non-Breaking Spaces
Use `&nbsp;` to prevent awkward line breaks:
```
10&nbsp;MB     → 10 MB (unit stays with number)
⌘&nbsp;K      → ⌘ K (shortcut stays together)
Q4&nbsp;2025  → Q4 2025 (period stays with year)
```

### Dashes
```
Hyphen (-)     → compound words: "risk-based"
En dash (–)    → ranges: "2020–2025", "pages 10–15"
Em dash (—)    → breaks in thought—like this
```

### Widow Prevention
```css
/* Prevent single word on last line */
.no-widow {
  text-wrap: pretty; /* Modern browsers */
}
```
