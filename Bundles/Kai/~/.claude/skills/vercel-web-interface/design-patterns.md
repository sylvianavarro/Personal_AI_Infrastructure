# Design Patterns

## Shadows

### Layered Shadows
Use at least two layers mimicking ambient + direct light:

```css
/* ✅ Good - multi-layer shadow */
.card {
  box-shadow:
    0 1px 2px rgba(0, 0, 0, 0.05),   /* Ambient */
    0 4px 8px rgba(0, 0, 0, 0.1);     /* Direct */
}

/* Elevated */
.card-elevated {
  box-shadow:
    0 2px 4px rgba(0, 0, 0, 0.05),
    0 8px 16px rgba(0, 0, 0, 0.1),
    0 16px 32px rgba(0, 0, 0, 0.05);
}
```

### Shadow Scale
```css
:root {
  --shadow-sm: 0 1px 2px rgba(0,0,0,0.05);
  --shadow-md: 0 1px 2px rgba(0,0,0,0.05), 0 4px 8px rgba(0,0,0,0.1);
  --shadow-lg: 0 2px 4px rgba(0,0,0,0.05), 0 8px 16px rgba(0,0,0,0.1);
  --shadow-xl: 0 4px 8px rgba(0,0,0,0.05), 0 16px 32px rgba(0,0,0,0.1);
}
```

## Borders

### Combine with Shadows
Semi-transparent borders improve edge clarity:

```css
.card {
  border: 1px solid rgba(0, 0, 0, 0.1);
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
}

/* Dark mode */
.dark .card {
  border: 1px solid rgba(255, 255, 255, 0.1);
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.3);
}
```

## Border Radius

### Nested Radius Rule
**Child radius ≤ parent radius; concentric curves align.**

```css
/* Parent: 12px, Padding: 8px, Child: 4px */
/* 12 - 8 = 4 ✅ */
.card {
  border-radius: 12px;
  padding: 8px;
}
.card-inner {
  border-radius: 4px;
}

/* Or calculate dynamically */
.nested {
  --parent-radius: 16px;
  --padding: 8px;
  border-radius: calc(var(--parent-radius) - var(--padding));
}
```

### Visual Example
```
┌────────────────────────┐  ← Parent: 12px radius
│  ┌──────────────────┐  │
│  │                  │  │  ← Child: 4px radius (12 - 8 padding)
│  │                  │  │
│  └──────────────────┘  │
└────────────────────────┘
```

## Color

### Hue Consistency
On colored backgrounds, tint borders/shadows/text toward the same hue:

```css
/* Blue card */
.blue-card {
  background: #4166F5;
  color: #FFFFFF;
  border: 1px solid rgba(255, 255, 255, 0.2); /* Lighter blue tint */
  box-shadow: 0 4px 12px rgba(65, 102, 245, 0.3); /* Blue shadow */
}

/* Not this */
.blue-card-wrong {
  background: #4166F5;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3); /* Gray shadow - looks off */
}
```

### Color-Blind Safe Charts
```tsx
// Use patterns + colors, not color alone
const chartColors = [
  { fill: '#4166F5', pattern: 'solid' },
  { fill: '#22C55E', pattern: 'diagonal' },
  { fill: '#F59E0B', pattern: 'dotted' },
  { fill: '#EF4444', pattern: 'crosshatch' },
];
```

## Contrast

### APCA over WCAG 2
Vercel recommends APCA (Accessible Perceptual Contrast Algorithm):

| APCA Lc | Use Case |
|---------|----------|
| 90+ | Body text |
| 75+ | Large text, headlines |
| 60+ | Sub-text, placeholders |
| 45+ | Disabled text (minimum) |
| 30+ | Decorative text, borders |

### Calculator
https://www.myndex.com/APCA/

### Interaction State Contrast
```css
/* States must have MORE contrast than rest state */
.button {
  background: #4166F5;
}
.button:hover {
  background: #3355E0; /* Darker - more contrast */
}
.button:active {
  background: #2244CC; /* Even darker */
}
```

## Browser UI Integration

### Theme Color
```html
<!-- Align browser chrome with page -->
<meta name="theme-color" content="#181818" />

<!-- Different for light/dark -->
<meta name="theme-color" content="#FFFFFF" media="(prefers-color-scheme: light)" />
<meta name="theme-color" content="#181818" media="(prefers-color-scheme: dark)" />
```

### Color Scheme
```css
/* Proper scrollbar contrast in dark mode */
html {
  color-scheme: dark;
}

/* Or based on theme */
html[data-theme="dark"] {
  color-scheme: dark;
}
```

## Text Rendering

### Animation Artifact Fix
Scaling text changes smoothing. Two solutions:

```css
/* 1. Animate wrapper instead of text */
.text-wrapper {
  transform: scale(1.1);
}

/* 2. Promote to own layer */
.animated-text {
  transform: translateZ(0);
  /* or */
  will-change: transform;
}
```

## Gradients

### Prevent Banding
When fading to dark colors, avoid gradient banding:

```css
/* ❌ May show banding */
.gradient {
  background: linear-gradient(to bottom, #4166F5, #000000);
}

/* ✅ Use CSS mask instead */
.gradient-overlay {
  background: #4166F5;
  mask-image: linear-gradient(to bottom, black, transparent);
}

/* ✅ Or use pre-baked background image */
.gradient-clean {
  background-image: url('/gradients/blue-to-dark.png');
}
```

## Optical Alignment

### ±1px Adjustments
When perception beats geometry, adjust by 1px:

```css
/* Play icon appears off-center in circle */
.play-button svg {
  transform: translateX(1px); /* Optical adjustment */
}

/* Text baseline adjustment */
.badge-text {
  transform: translateY(-0.5px);
}
```

### Icon + Text Balance
Balance contrast through:
- Weight adjustment
- Size adjustment
- Spacing adjustment
- Color adjustment

```css
/* Icon slightly lighter than text */
.icon-text {
  color: #181818;
}
.icon-text svg {
  color: #434343; /* Slightly lighter */
}
```

## Alignment Principles

Every element intentionally aligns to:
- Grid
- Baseline
- Edge
- Optical center

No element should be "just placed" - every position is deliberate.

## Responsive Considerations

### Safe Areas
```css
/* Account for notches and insets */
.content {
  padding-left: max(16px, env(safe-area-inset-left));
  padding-right: max(16px, env(safe-area-inset-right));
  padding-bottom: max(16px, env(safe-area-inset-bottom));
}
```

### Testing Viewports
- Mobile: 375px (iPhone)
- Tablet: 768px
- Laptop: 1280px
- Ultra-wide: Simulate by zooming to 50%

## Scrollbars

### Only Render When Needed
Fix overflow issues - don't show unnecessary scrollbars.

### macOS Testing
Set "Show scroll bars" to "Always" in System Preferences when testing.

```css
/* Custom scrollbar styling */
.scrollable::-webkit-scrollbar {
  width: 8px;
}
.scrollable::-webkit-scrollbar-track {
  background: transparent;
}
.scrollable::-webkit-scrollbar-thumb {
  background: rgba(0, 0, 0, 0.2);
  border-radius: 4px;
}
```
