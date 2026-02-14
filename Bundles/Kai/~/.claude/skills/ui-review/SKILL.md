---
name: ui-review
description: Audit UI code against 100+ best practices for accessibility, performance, and UX. Use when reviewing frontend code, checking accessibility, or auditing design implementation.
---

# UI Review

Audit UI code against web interface best practices.

## When to Use

- Reviewing frontend/UI code
- Accessibility (a11y) audits
- UX compliance checks
- Design system enforcement
- Pre-launch quality gate

---

## Categories

| Category | Rules | Priority |
|----------|-------|----------|
| Accessibility | 12 | Critical |
| Focus States | 4 | Critical |
| Forms | 14 | High |
| Performance | 8 | High |
| Images | 4 | Medium |
| Animation | 6 | Medium |
| Typography | 6 | Lower |
| Navigation | 5 | Lower |
| Touch/Mobile | 5 | Lower |
| Dark Mode | 3 | Lower |
| i18n | 3 | Lower |

---

## Accessibility

### A1: Icon Buttons Need aria-label

```tsx
// BAD
<button><IconTrash /></button>

// GOOD
<button aria-label="Delete item"><IconTrash /></button>
```

### A2: Form Controls Need Labels

```tsx
// BAD
<input type="email" placeholder="Email" />

// GOOD
<label htmlFor="email">Email</label>
<input id="email" type="email" />

// or
<input type="email" aria-label="Email address" />
```

### A3: Interactive Elements Need Keyboard Handlers

```tsx
// BAD: Mouse only
<div onClick={handleClick}>Click me</div>

// GOOD: Keyboard accessible
<button onClick={handleClick}>Click me</button>

// If must use div:
<div
  role="button"
  tabIndex={0}
  onClick={handleClick}
  onKeyDown={(e) => e.key === 'Enter' && handleClick()}
>
```

### A4: Use Correct Elements

```tsx
// BAD
<div onClick={() => navigate('/home')}>Home</div>
<span onClick={handleSubmit}>Submit</span>

// GOOD
<Link href="/home">Home</Link>
<button onClick={handleSubmit}>Submit</button>
```

### A5: Images Need alt Text

```tsx
// BAD
<img src="profile.jpg" />

// GOOD: Meaningful alt
<img src="profile.jpg" alt="User profile photo" />

// GOOD: Decorative (empty alt)
<img src="decoration.svg" alt="" />
```

### A6: Decorative Icons Hidden from Screen Readers

```tsx
// GOOD
<span aria-hidden="true"><IconDecoration /></span>
```

### A7: Async Updates Use aria-live

```tsx
// GOOD: Screen reader announces changes
<div aria-live="polite">
  {message && <span>{message}</span>}
</div>
```

### A8: Semantic HTML Before ARIA

```tsx
// BAD: ARIA on div
<div role="navigation">...</div>

// GOOD: Semantic element
<nav>...</nav>
```

### A9: Hierarchical Headings

```tsx
// BAD: Skipped levels
<h1>Title</h1>
<h3>Subtitle</h3>

// GOOD: Sequential
<h1>Title</h1>
<h2>Subtitle</h2>
```

### A10: Skip Link for Main Content

```tsx
// GOOD: First focusable element
<a href="#main" className="sr-only focus:not-sr-only">
  Skip to main content
</a>
```

### A11: Color Contrast

- Text must have 4.5:1 contrast ratio (WCAG AA)
- Large text (18px+): 3:1 minimum
- Use tools: axe, Lighthouse, Contrast Checker

### A12: No Zoom Disabling

```html
<!-- BAD: Blocks accessibility -->
<meta name="viewport" content="user-scalable=no, maximum-scale=1">

<!-- GOOD -->
<meta name="viewport" content="width=device-width, initial-scale=1">
```

---

## Focus States

### F1: Visible Focus Indicator

```css
/* BAD */
button:focus { outline: none; }

/* GOOD */
button:focus-visible {
  outline: 2px solid var(--focus-color);
  outline-offset: 2px;
}
```

### F2: Use :focus-visible Not :focus

```css
/* BAD: Shows ring on click */
button:focus { ring: 2px; }

/* GOOD: Only keyboard focus */
button:focus-visible { ring: 2px; }
```

### F3: :focus-within for Compound Controls

```css
/* GOOD: Parent highlights when child focused */
.input-group:focus-within {
  border-color: var(--focus-color);
}
```

### F4: Never outline-none Without Replacement

```css
/* BAD */
*:focus { outline: none; }

/* GOOD: Custom focus style */
*:focus-visible {
  outline: none;
  box-shadow: 0 0 0 2px var(--focus-color);
}
```

---

## Forms

### FO1: Inputs Need autocomplete

```tsx
// GOOD
<input type="email" name="email" autoComplete="email" />
<input type="tel" name="phone" autoComplete="tel" />
<input type="text" name="name" autoComplete="name" />
```

### FO2: Correct Input Types

```tsx
// GOOD: Triggers correct keyboard
<input type="email" inputMode="email" />
<input type="tel" inputMode="tel" />
<input type="number" inputMode="numeric" />
<input type="url" inputMode="url" />
```

### FO3: Never Prevent Paste

```tsx
// BAD
<input onPaste={(e) => e.preventDefault()} />

// GOOD: Allow paste
<input />
```

### FO4: Labels Must Be Clickable

```tsx
// BAD: Label doesn't focus input
<label>Email</label>
<input id="email" />

// GOOD: htmlFor connects them
<label htmlFor="email">Email</label>
<input id="email" />
```

### FO5: Disable Spellcheck on Codes/Emails

```tsx
// GOOD
<input type="email" spellCheck={false} />
<input name="verification-code" spellCheck={false} />
```

### FO6: Submit Button Enabled Until Request

```tsx
// GOOD: Disable only during submission
<button type="submit" disabled={isSubmitting}>
  {isSubmitting ? <Spinner /> : 'Submit'}
</button>
```

### FO7: Errors Inline, Focus First Error

```tsx
// GOOD
{errors.email && (
  <span role="alert" className="text-red-500">
    {errors.email}
  </span>
)}

// On submit, focus first error field
useEffect(() => {
  if (errors.email) emailRef.current?.focus();
}, [errors]);
```

### FO8: Placeholders Show Example Pattern

```tsx
// GOOD
<input placeholder="name@example.com…" />
<input placeholder="(555) 123-4567…" />
```

### FO9: Warn Before Navigating with Unsaved Changes

```tsx
// GOOD
useEffect(() => {
  const handler = (e: BeforeUnloadEvent) => {
    if (isDirty) e.preventDefault();
  };
  window.addEventListener('beforeunload', handler);
  return () => window.removeEventListener('beforeunload', handler);
}, [isDirty]);
```

---

## Performance

### P1: Virtualize Lists >50 Items

```tsx
// BAD
{items.map(item => <Row key={item.id} />)} // 1000 items

// GOOD
import { useVirtualizer } from '@tanstack/react-virtual';
```

### P2: No Layout Reads During Render

```tsx
// BAD: Forces layout recalculation
function Component() {
  const width = element.getBoundingClientRect().width; // DON'T
}

// GOOD: Use ResizeObserver or CSS
```

### P3: Batch DOM Reads/Writes

```tsx
// BAD: Interleaved (causes layout thrashing)
element.style.width = '100px';
const height = element.offsetHeight;
element.style.height = height + 'px';

// GOOD: Batch reads, then writes
const height = element.offsetHeight;
element.style.width = '100px';
element.style.height = height + 'px';
```

### P4: Prefer Uncontrolled Inputs

```tsx
// BAD: Re-renders on every keystroke
const [value, setValue] = useState('');
<input value={value} onChange={e => setValue(e.target.value)} />

// GOOD: No re-renders
<input defaultValue="" ref={inputRef} />
```

### P5: Preconnect to CDN Domains

```tsx
// GOOD
<link rel="preconnect" href="https://cdn.example.com" />
```

### P6: Preload Critical Fonts

```tsx
// GOOD
<link
  rel="preload"
  href="/fonts/inter.woff2"
  as="font"
  type="font/woff2"
  crossOrigin="anonymous"
/>
```

---

## Images

### I1: Explicit Dimensions (Prevent CLS)

```tsx
// BAD
<img src="photo.jpg" />

// GOOD
<img src="photo.jpg" width={800} height={600} />
```

### I2: Lazy Load Below-Fold

```tsx
// GOOD
<img src="photo.jpg" loading="lazy" />
```

### I3: Priority for Above-Fold

```tsx
// GOOD (Next.js)
<Image src="hero.jpg" priority />

// or native
<img src="hero.jpg" fetchPriority="high" />
```

---

## Animation

### AN1: Respect prefers-reduced-motion

```css
/* GOOD */
@media (prefers-reduced-motion: reduce) {
  * { animation: none !important; transition: none !important; }
}
```

### AN2: Only Animate transform and opacity

```css
/* BAD: Triggers layout */
.card { transition: width 0.3s, height 0.3s; }

/* GOOD: Compositor only */
.card { transition: transform 0.3s, opacity 0.3s; }
```

### AN3: Never transition: all

```css
/* BAD */
.button { transition: all 0.3s; }

/* GOOD: Explicit properties */
.button { transition: background-color 0.3s, transform 0.3s; }
```

### AN4: Animations Must Be Interruptible

User input should immediately affect animation state.

---

## Typography

### T1: Use Ellipsis Character

```tsx
// BAD
<span>Loading...</span>

// GOOD
<span>Loading…</span>
```

### T2: Use Curly Quotes

```tsx
// BAD
<p>"Hello"</p>

// GOOD
<p>\u201cHello\u201d</p>
```

### T3: Non-Breaking Spaces

```tsx
// GOOD: Keep units together
<span>10&nbsp;MB</span>
<span>&#8984;&nbsp;K</span>
```

### T4: Tabular Nums for Number Columns

```css
/* GOOD: Numbers align in tables */
.number-column { font-variant-numeric: tabular-nums; }
```

### T5: Balance Headings

```css
/* GOOD: Prevents widows */
h1, h2, h3 { text-wrap: balance; }
```

---

## Anti-Patterns to Flag

Immediately flag these in code review:

| Pattern | Problem |
|---------|---------|
| `user-scalable=no` | Blocks accessibility |
| `onPaste` + `preventDefault` | Frustrates users |
| `transition: all` | Performance, unexpected |
| `outline: none` without replacement | No focus visible |
| `<div onClick>` for navigation | Not accessible |
| `<div>` / `<span>` with onClick | Should be `<button>` |
| `<img>` without dimensions | Layout shift |
| Large `.map()` without virtualization | Performance |
| Form inputs without labels | Not accessible |
| Icon buttons without aria-label | Not accessible |
| Hardcoded date/number formats | i18n failure |
| `autoFocus` without justification | Mobile issues |

---

## Quick Audit Checklist

- [ ] All interactive elements keyboard accessible?
- [ ] All form inputs have labels?
- [ ] All icon buttons have aria-label?
- [ ] All images have alt text?
- [ ] All images have width/height?
- [ ] Focus states visible?
- [ ] No `outline: none` without replacement?
- [ ] Lists >50 items virtualized?
- [ ] Animations respect reduced-motion?
- [ ] No `transition: all`?

---

## Integration

| Skill | Integration |
|-------|-------------|
| **react-performance** | Performance rules |
| **commit** | UI quality checks before commit |
| **test-patterns** | Testing accessibility |
```

### Step 3: Verify Installation

```bash
SKILLS_DIR="${PAI_DIR:-$HOME/.config/pai}/skills"

for skill in commit catchup knowledge-accumulation fixing-test-suites test-patterns api-testing react-performance ui-review; do
  if [ -f "$SKILLS_DIR/$skill/SKILL.md" ]; then
    echo "✓ $skill installed"
  else
    echo "✗ $skill MISSING"
  fi
done

# Check supplemental files
for file in api-testing/contract-testing.md api-testing/graphql-testing.md; do
  if [ -f "$SKILLS_DIR/$file" ]; then
    echo "✓ $file installed"
  else
    echo "✗ $file MISSING"
  fi
done
```

---

## Example Usage

### Example 1: Session Start

```
User: [starts new session]
AI: [Invokes catchup skill]
  → Reads git log, recent changes, open branches
  → Produces context summary with current state and next steps
```

### Example 2: Test Suite Repair

```
User: "Tests are failing after the auth refactor"
AI: [Invokes fixing-test-suites skill]
  → Categorizes failures (mock issues, import changes, auth pattern updates)
  → Applies systematic fix patterns
  → Verifies all tests pass
```

### Example 3: Commit Flow

```
User: /commit
AI: [Invokes commit skill]
  → Runs pre-commit checks
  → Generates conventional commit message
  → Updates documentation if needed
  → Creates commit
