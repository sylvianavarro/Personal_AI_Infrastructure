# Forms

## Submission Behavior

### Enter Key Behavior
| Context | Behavior |
|---------|----------|
| Single text input | Enter submits |
| Multiple controls | Enter on last control submits |
| Textarea | Cmd/Ctrl+Enter submits, Enter = new line |

### Submit Button State
```tsx
// ✅ Keep enabled until submission starts
<button type="submit" disabled={isSubmitting}>
  {isSubmitting ? 'Saving…' : 'Save'}
</button>

// ❌ Don't pre-disable based on validation
<button type="submit" disabled={!isValid}>Save</button>
```

**Why:** Let users click submit to see all validation errors, not discover them one-by-one.

### Idempotency
```tsx
// Include idempotency key to prevent duplicate submissions
const handleSubmit = async () => {
  setIsSubmitting(true);
  await submitForm({
    ...data,
    idempotencyKey: crypto.randomUUID()
  });
};
```

## Labels

### Every Control Needs a Label
```tsx
// ✅ Explicit label association
<label htmlFor="email">Email</label>
<input id="email" type="email" />

// ✅ Wrapping association
<label>
  Email
  <input type="email" />
</label>

// ✅ Hidden label for screen readers
<label htmlFor="search" className="sr-only">Search</label>
<input id="search" type="search" placeholder="Search…" />
```

### Click Behavior
Clicking label should focus the associated control.

## Input Validation

### Never Block Input
```tsx
// ❌ Bad - blocking input
const handleChange = (e) => {
  if (/^[0-9]*$/.test(e.target.value)) {
    setValue(e.target.value);
  }
};

// ✅ Good - accept all input, show validation
const handleChange = (e) => {
  setValue(e.target.value);
  setError(/^[0-9]*$/.test(e.target.value) ? null : 'Numbers only');
};
```

### Error Display
- Show errors adjacent to the field
- On submit, focus first error field
- Use `aria-describedby` to associate error with input

```tsx
<div>
  <label htmlFor="email">Email</label>
  <input
    id="email"
    type="email"
    aria-invalid={!!error}
    aria-describedby={error ? 'email-error' : undefined}
  />
  {error && (
    <p id="email-error" role="alert" className="text-red-500">
      {error}
    </p>
  )}
</div>
```

### Focus First Error
```tsx
const handleSubmit = () => {
  const errors = validate(formData);
  if (Object.keys(errors).length) {
    const firstErrorField = document.querySelector('[aria-invalid="true"]');
    firstErrorField?.focus();
  }
};
```

## Hit Targets

### Checkbox/Radio
Avoid dead zones - label and control share single generous hit target:

```tsx
// ✅ Label wraps entire clickable area
<label className="flex items-center gap-2 p-2 cursor-pointer">
  <input type="checkbox" />
  <span>Accept terms</span>
</label>
```

## Autocomplete

### Set Meaningful Attributes
```tsx
// User data fields
<input type="text" name="name" autoComplete="name" />
<input type="email" name="email" autoComplete="email" />
<input type="tel" name="phone" autoComplete="tel" />
<input type="text" name="address" autoComplete="street-address" />
<input type="text" name="city" autoComplete="address-level2" />
<input type="text" name="zip" autoComplete="postal-code" />

// Payment
<input type="text" name="cc-number" autoComplete="cc-number" />
<input type="text" name="cc-exp" autoComplete="cc-exp" />
```

### Disable Spellcheck
```tsx
// Don't spellcheck these
<input type="email" spellCheck="false" />
<input name="username" spellCheck="false" />
<input name="code" spellCheck="false" />
```

## Input Types & Modes

### Correct Types
```tsx
<input type="email" />     // Email validation, @ keyboard
<input type="tel" />       // Phone pad keyboard
<input type="url" />       // URL keyboard
<input type="number" />    // Numeric with spinners
<input type="search" />    // Search with clear button
```

### Input Modes
```tsx
// Numeric-only keyboard (no spinners)
<input inputMode="numeric" pattern="[0-9]*" />

// Decimal keyboard
<input inputMode="decimal" />

// URL keyboard without validation
<input inputMode="url" />
```

## Placeholders

### Format
- End with ellipsis to signal emptiness
- Use realistic example values

```tsx
// ✅ Good placeholders
<input placeholder="Search…" />
<input placeholder="+1 (123) 456-7890" />
<input placeholder="sk-012345679…" />
<input placeholder="you@example.com" />

// ❌ Bad
<input placeholder="Enter your email" />
<input placeholder="Type here" />
```

## Data Loss Prevention

### Warn Before Navigation
```tsx
useEffect(() => {
  const handleBeforeUnload = (e: BeforeUnloadEvent) => {
    if (hasUnsavedChanges) {
      e.preventDefault();
      e.returnValue = '';
    }
  };
  window.addEventListener('beforeunload', handleBeforeUnload);
  return () => window.removeEventListener('beforeunload', handleBeforeUnload);
}, [hasUnsavedChanges]);
```

## Authentication

### Password Manager Compatibility
```tsx
// Login form
<input type="text" name="username" autoComplete="username" />
<input type="password" name="password" autoComplete="current-password" />

// Signup form
<input type="password" name="new-password" autoComplete="new-password" />
```

### 2FA / OTP
```tsx
// One-time codes
<input
  type="text"
  inputMode="numeric"
  autoComplete="one-time-code"
  pattern="[0-9]*"
  maxLength={6}
/>
```

### Don't Trigger Password Managers
For non-auth fields, use:
```tsx
<input autoComplete="off" />
// or more specific
<input autoComplete="new-password" /> // Triggers password generator, not fill
```

## Windows Dark Mode Fix

```css
/* Native <select> needs explicit colors on Windows */
select {
  background-color: var(--bg-color);
  color: var(--text-color);
}
```

## Never Disable Paste

```tsx
// ❌ NEVER do this
<input onPaste={(e) => e.preventDefault()} />

// ✅ Allow pasting everywhere, including:
// - Password fields
// - OTP inputs
// - Any text field
```

## Whitespace Handling

```tsx
// Trim whitespace - don't error on leading/trailing spaces
const handleSubmit = () => {
  const trimmedEmail = email.trim();
  validate(trimmedEmail);
};
```
