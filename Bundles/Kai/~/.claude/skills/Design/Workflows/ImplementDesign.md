# ImplementDesign Workflow

Apply design system to components while maintaining design spec compliance.

## Trigger

- "implement design"
- "apply design"
- Creating new components

## Prerequisites

- Design spec exists for project
- Design tokens defined

## Process

### 1. Load Design Context

```
1. Read design spec from project
2. Extract design tokens
3. Identify component patterns
4. Check existing implementations for consistency
```

### 2. Component Implementation

For each component:

```
1. Reference design spec patterns
2. Use design tokens (never hardcode values)
3. Implement all states:
   - Default
   - Hover
   - Active/Pressed
   - Focus (visible)
   - Disabled
   - Loading (if applicable)
   - Error (if applicable)
4. Add accessibility attributes
5. Ensure responsive behavior
```

### 3. Token Usage Rules

```css
/* CORRECT: Use tokens */
.button {
  background: var(--color-primary);
  padding: var(--space-3) var(--space-4);
  border-radius: var(--radius-md);
  font-family: var(--font-body);
  transition: all var(--duration-fast) var(--ease-default);
}

/* WRONG: Hardcoded values */
.button {
  background: #5BBCB4;     /* Should be --color-primary */
  padding: 12px 16px;      /* Should be --space-3 --space-4 */
  border-radius: 8px;      /* Should be --radius-md */
  font-family: 'DM Sans';  /* Should be --font-body */
  transition: all 150ms ease;
}
```

### 4. State Implementation Checklist

For interactive elements:

```tsx
// Button example with all states
<button
  className={cn(
    // Base styles
    "inline-flex items-center justify-center",
    "font-medium transition-colors",

    // Size variants
    "px-4 py-2 text-sm",

    // Visual variants
    "bg-primary text-primary-foreground",

    // States
    "hover:bg-primary/90",
    "focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring",
    "disabled:pointer-events-none disabled:opacity-50",

    // Loading state
    isLoading && "cursor-wait"
  )}
  disabled={disabled || isLoading}
  aria-busy={isLoading}
>
  {isLoading ? <Spinner /> : children}
</button>
```

### 5. Accessibility Implementation

```tsx
// Form input with proper accessibility
<div className="space-y-2">
  <label
    htmlFor={id}
    className="text-sm font-medium"
  >
    {label}
    {required && <span className="text-error" aria-hidden="true">*</span>}
  </label>

  <input
    id={id}
    type={type}
    className={cn(
      "w-full px-3 py-2 border rounded-md",
      "focus:outline-none focus:ring-2 focus:ring-primary",
      error && "border-error"
    )}
    aria-invalid={!!error}
    aria-describedby={error ? `${id}-error` : undefined}
    aria-required={required}
    {...props}
  />

  {error && (
    <p id={`${id}-error`} className="text-sm text-error" role="alert">
      {error}
    </p>
  )}
</div>
```

### 6. Responsive Implementation

```tsx
// Card with responsive layout using container queries
<div className="@container">
  <article className={cn(
    "flex flex-col gap-4",
    "@md:flex-row @md:gap-6"
  )}>
    <div className="@md:w-1/3">
      <img ... />
    </div>
    <div className="@md:w-2/3">
      <h2>...</h2>
      <p>...</p>
    </div>
  </article>
</div>
```

### 7. Animation Implementation

```tsx
// Motion with reduced motion support
const variants = {
  initial: { opacity: 0, y: 20 },
  animate: { opacity: 1, y: 0 },
  exit: { opacity: 0, y: -20 }
};

<motion.div
  variants={variants}
  initial="initial"
  animate="animate"
  exit="exit"
  transition={{
    type: "spring",
    stiffness: 300,
    damping: 30
  }}
  // Respect reduced motion
  style={{
    ...(prefersReducedMotion && {
      transition: { duration: 0 }
    })
  }}
>
```

### 8. Post-Implementation Audit

After implementation:
```
1. Run DesignAudit workflow
2. Verify all tokens used correctly
3. Check accessibility compliance
4. Test responsive behavior
5. Verify motion respects preferences
```

## Quality Checklist

- [ ] All values from design tokens (no hardcodes)
- [ ] All interactive states implemented
- [ ] Focus states visible and styled
- [ ] ARIA attributes where needed
- [ ] Responsive breakpoints work
- [ ] Animations respect prefers-reduced-motion
- [ ] Component matches design spec pattern
- [ ] Audit passes with no blockers
