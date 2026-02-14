# Element-Specific Accessibility Checklists

Quick validation checklists by element type.

---

## Buttons

### Criteria
- SC 2.4.7: Focus visible
- SC 2.5.8: 24x24px minimum target
- SC 1.4.11: 3:1 contrast vs background
- SC 2.4.4: Purpose clear from text/context
- SC 4.1.2: Role, state exposed

### Checklist
- [ ] Focus indicator visible (2px outline recommended)
- [ ] Touch target 24x24px minimum (44x44 recommended)
- [ ] Button contrast 3:1 against background
- [ ] Text/icon clearly indicates action
- [ ] Disabled state conveyed (not just visually)
- [ ] Loading state announced to screen readers

### Code Pattern
```tsx
<button
  className="min-h-[44px] min-w-[44px] focus:outline-2 focus:outline-offset-2"
  aria-disabled={isDisabled}
  aria-busy={isLoading}
>
  {children}
</button>
```

---

## Icons

### Criteria
- SC 1.1.1: Alternative text if meaningful
- SC 1.4.11: 3:1 contrast vs background
- SC 2.5.8: 24x24px if interactive

### Checklist
- [ ] Decorative icons: `aria-hidden="true"`
- [ ] Meaningful icons: accessible name via `aria-label` or visible text
- [ ] Icon-only buttons: `aria-label` required
- [ ] Contrast 3:1 against background
- [ ] If interactive, 24x24px target minimum

### Code Patterns
```tsx
// Decorative icon (next to text)
<SearchIcon aria-hidden="true" />
<span>Search</span>

// Icon-only button
<button aria-label="Search">
  <SearchIcon aria-hidden="true" />
</button>

// Informational icon
<WarningIcon role="img" aria-label="Warning" />
```

---

## Text / Typography

### Criteria
- SC 1.4.3: Contrast 4.5:1 (normal), 3:1 (large)
- SC 1.4.4: Resizable to 200%
- SC 1.4.12: Text spacing adjustable

### Checklist
- [ ] Normal text: 4.5:1 contrast minimum
- [ ] Large text (18pt/24px or 14pt/19px bold): 3:1 minimum
- [ ] Text resizes to 200% without breaking layout
- [ ] Line height, letter/word spacing user-adjustable
- [ ] No images of text (use CSS)

### Large Text Definition
```
Large text:
- 18pt (24px) regular weight, OR
- 14pt (18.67px) bold weight
```

### Invela Validated Combinations
| Foreground | Background | Ratio | Status |
|------------|------------|-------|--------|
| #181818 | #FFFFFF | 16.1:1 | AAA |
| #181818 | #DCF6FE | ~14:1 | AAA |
| #181818 | #EBEBEB | ~13:1 | AAA |
| #4166F5 | #FFFFFF | 4.5:1 | AA |
| #FFFFFF | #4166F5 | 4.5:1 | AA |

---

## Forms / Inputs

### Criteria
- SC 1.3.5: Autocomplete for user data
- SC 3.3.1: Error identification
- SC 3.3.2: Labels or instructions
- SC 3.3.3: Error suggestions
- SC 3.3.7: No redundant entry
- SC 2.4.6: Descriptive labels

### Checklist
- [ ] Every input has visible label
- [ ] Labels associated via `for`/`id` or wrapping
- [ ] Required fields indicated
- [ ] Error messages describe the problem
- [ ] Error messages suggest fixes
- [ ] Autocomplete attribute for user data
- [ ] Don't require re-entering data

### Autocomplete Values
```tsx
<input type="email" autoComplete="email" />
<input type="text" autoComplete="name" />
<input type="text" autoComplete="given-name" />
<input type="text" autoComplete="family-name" />
<input type="tel" autoComplete="tel" />
<input type="text" autoComplete="street-address" />
```

### Error Pattern
```tsx
<div>
  <label htmlFor="email">Email</label>
  <input
    id="email"
    aria-invalid={hasError}
    aria-describedby={hasError ? "email-error" : undefined}
  />
  {hasError && (
    <p id="email-error" role="alert">
      Enter a valid email address (e.g., user@example.com)
    </p>
  )}
</div>
```

---

## Focus States

### Criteria
- SC 2.4.7: Focus visible (AA)
- SC 2.4.11: Focus not obscured (AA) - NEW
- SC 2.4.13: Focus appearance (AAA)

### Checklist
- [ ] All interactive elements have visible focus
- [ ] Focus indicator not hidden by overlays/sticky headers
- [ ] Focus contrasts with surrounding content
- [ ] Focus works in high contrast mode

### Recommended Focus Style
```css
/* AA Compliant */
:focus-visible {
  outline: 2px solid #4166F5;
  outline-offset: 2px;
}

/* AAA Enhanced (SC 2.4.13) */
:focus-visible {
  outline: 2px solid currentColor;
  outline-offset: 2px;
  /* Outline area: 1px+ perimeter OR 4px+ per side */
  /* Contrast: 3:1 between focused/unfocused */
}
```

### Never Do
```css
/* DO NOT */
*:focus { outline: none; } /* Removes all focus */
```

---

## Links

### Criteria
- SC 2.4.4: Link purpose from text/context
- SC 1.4.3: Contrast requirements
- SC 2.4.7: Focus visible

### Checklist
- [ ] Link text describes destination
- [ ] Avoid "click here", "read more" alone
- [ ] Distinguish from surrounding text (not color alone)
- [ ] Underline or other non-color indicator
- [ ] Focus state visible

### Patterns
```tsx
// Good: Clear purpose
<a href="/pricing">View pricing plans</a>

// Good: Context in accessible name
<a href="/report" aria-label="Download Q4 2025 report">
  Download
</a>

// Bad: Ambiguous
<a href="/more">Read more</a>
```

---

## Tables

### Criteria
- SC 1.3.1: Info and relationships
- SC 1.3.2: Meaningful sequence

### Checklist
- [ ] Use `<table>`, `<th>`, `<td>` properly
- [ ] Header cells use `<th>` with `scope`
- [ ] Caption or `aria-label` describes table
- [ ] Complex tables use `headers` attribute
- [ ] Don't use tables for layout

### Pattern
```tsx
<table>
  <caption>Q4 2025 Financial Summary</caption>
  <thead>
    <tr>
      <th scope="col">Category</th>
      <th scope="col">Amount</th>
      <th scope="col">Change</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">Revenue</th>
      <td>$1.2M</td>
      <td>+15%</td>
    </tr>
  </tbody>
</table>
```

---

## Colors

### Criteria
- SC 1.4.1: Use of color (not sole indicator)
- SC 1.4.3: Contrast minimum
- SC 1.4.11: Non-text contrast

### Checklist
- [ ] Don't rely on color alone for meaning
- [ ] Add icons, patterns, or text labels
- [ ] Links distinguishable without color
- [ ] Error states have icon + color
- [ ] Data viz uses patterns + colors

### Color + Indicator Patterns
```tsx
// Error with icon
<div className="text-red-600">
  <AlertIcon aria-hidden="true" />
  <span>Error: Invalid input</span>
</div>

// Status with text
<span className="bg-green-100 text-green-800">
  Active
</span>
```

---

## Dark Mode Considerations

When implementing dark mode, ensure:

- [ ] Text contrast maintained (4.5:1 normal, 3:1 large)
- [ ] Focus indicators visible on dark backgrounds
- [ ] UI component contrast maintained (3:1)
- [ ] Color meanings still clear
- [ ] Test with high contrast mode

### Invela Dark Mode Targets
```css
/* Light mode */
--text: #181818;
--bg: #FFFFFF;

/* Dark mode */
--text: #E0E0E0;  /* Not pure white */
--bg: #181818;    /* Invela Black */
/* Contrast: 10.4:1 - passes AAA */
```
