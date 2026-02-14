# Content & Copywriting

## Typography

### Quotes
```
✅ "Curly quotes" and 'single curly'
❌ "Straight quotes" and 'single straight'
```

### Ellipsis
```
✅ Loading… (single character: …)
❌ Loading... (three periods)
```

HTML: `&hellip;` or `&#8230;`

### Numeric Display
```css
/* For tabular data / number comparison */
.numbers {
  font-variant-numeric: tabular-nums;
}

/* For monetary values */
.currency {
  font-variant-numeric: lining-nums tabular-nums;
}
```

### Line Breaks
- Avoid widows (single word on last line)
- Avoid orphans (single line at top of column)
- Use `&nbsp;` or CSS to control breaks

```css
/* Prevent break between last two words */
.no-widow {
  text-wrap: pretty; /* Modern browsers */
}
```

## Visual Status Indicators

### Never Color Alone
```tsx
// ❌ Bad - color only
<span className="text-green-500">Active</span>

// ✅ Good - color + text
<span className="text-green-500">● Active</span>

// ✅ Good - color + icon + text
<span className="flex items-center gap-2 text-green-500">
  <CheckCircle className="h-4 w-4" />
  Active
</span>
```

### Icons Need Labels
```tsx
// ❌ Bad - icon only
<button>
  <TrashIcon />
</button>

// ✅ Good - icon + accessible name
<button aria-label="Delete item">
  <TrashIcon aria-hidden="true" />
</button>

// ✅ Better - visible label
<button>
  <TrashIcon aria-hidden="true" />
  <span>Delete</span>
</button>
```

## Headings

### Hierarchical Structure
```html
<h1>Page Title</h1>
  <h2>Section</h2>
    <h3>Subsection</h3>
  <h2>Another Section</h2>
```

Never skip levels (h1 → h3).

### Skip Links
```tsx
<a href="#main-content" className="sr-only focus:not-sr-only">
  Skip to content
</a>
```

### Deep Link Scroll Margin
```css
[id] {
  scroll-margin-top: 80px; /* Account for fixed header */
}
```

## Page Context

### Title Tags
```tsx
// Reflect current context
<title>Dashboard - Invela</title>
<title>Settings → Security - Invela</title>
<title>Error 404 - Invela</title>
```

## User Paths

### Every Screen Offers
- Next steps
- Recovery paths
- Help access

### Design All States
- Empty state
- Sparse data
- Dense data
- Error state
- Loading state

## Accessibility Labels

### Accurate Names
```tsx
// ✅ Specific
<button aria-label="Close dialog">×</button>

// ❌ Generic
<button aria-label="Close">×</button>
```

### Hidden Decorative Elements
```tsx
// Decorative icons
<StarIcon aria-hidden="true" />

// Decorative images
<img src="/decoration.svg" alt="" role="presentation" />
```

### Verify in Accessibility Tree
Use browser DevTools → Accessibility panel to verify.

## Internationalization

### Locale Detection
```tsx
// Prefer language header over geo
const locale = request.headers.get('Accept-Language')?.split(',')[0]
  || navigator.languages[0]
  || 'en-US';
```

**Never detect language by IP or GPS.**

### Number/Date Formatting
```tsx
// Format per locale
new Intl.NumberFormat(locale).format(1234567); // "1,234,567" or "1.234.567"
new Intl.DateTimeFormat(locale).format(date); // "1/21/2026" or "21/1/2026"
```

### Currency
```tsx
new Intl.NumberFormat(locale, {
  style: 'currency',
  currency: 'USD',
  minimumFractionDigits: 2,
  maximumFractionDigits: 2,
}).format(1234.5); // "$1,234.50"
```

## Spacing

### Non-Breaking Spaces
```html
<!-- Glued terms that shouldn't break -->
10&nbsp;MB
⌘&nbsp;+&nbsp;K
Vercel&nbsp;SDK

<!-- Zero-width space for invisible breaks -->
longword&#x2060;here
```

## Copywriting Rules (Vercel-Specific)

### Voice
- **Active voice:** "Install the CLI" not "The CLI will be installed"
- **Second person:** "You can deploy" not "Users can deploy"
- **Action-oriented:** "Install the CLI…" not "You will need the CLI…"

### Capitalization
| Context | Style |
|---------|-------|
| Headings | Title Case (Chicago) |
| Buttons | Title Case |
| Marketing pages | Sentence case |

### Formatting
| Rule | Example |
|------|---------|
| Use "&" over "and" | "Build & Deploy" |
| Numerals for counts | "8 deployments" not "eight" |
| Numbers + units | "10 MB" not "10MB" |
| Currency: 0 or 2 decimals | "$10" or "$10.00", never "$10.5" |

### Placeholders
```tsx
// Strings
placeholder="YOUR_API_TOKEN_HERE"

// Numbers
placeholder="0123456789"

// Examples in fields
placeholder="sk-012345679…"
placeholder="+1 (123) 456-7890"
```

### Error Messages

**Guide to solutions:**
```
✅ "Your API key is incorrect or expired. Generate a new key in your account settings."
❌ "Invalid API key"

✅ "Email address is required"
❌ "This field is required"

✅ "Password must be at least 8 characters"
❌ "Invalid password"
```

### Positive Framing
```
✅ "Your project will be ready in a few minutes"
❌ "This might take a while"

✅ "Connect your repository to enable deployments"
❌ "No repository connected"
```

### Unambiguous Labels
```
✅ "Save API Key"
❌ "Continue"

✅ "Delete Project"
❌ "Remove"

✅ "Confirm Payment"
❌ "Submit"
```

## Loading Text

### Pattern
End with ellipsis:
- "Loading…"
- "Saving…"
- "Generating…"
- "Deploying…"

### Menu Items with Follow-ups
End with ellipsis if opening a dialog:
- "Rename…"
- "Delete…"
- "Export…"

Items that act immediately have no ellipsis:
- "Copy Link"
- "Refresh"
