# Interactions

## Keyboard Accessibility

### Requirements
- **All flows must be keyboard-operable**
- Follow WAI-ARIA Authoring Patterns exactly
- Every focusable element displays visible focus indicator

### Focus Styling
```css
/* Prefer :focus-visible over :focus */
button:focus-visible {
  outline: 2px solid var(--color-focus);
  outline-offset: 2px;
}

/* Use :focus-within for grouped controls */
.input-group:focus-within {
  border-color: var(--color-focus);
}
```

### Focus Management
- Implement focus traps in modals/dialogs
- Move focus per WAI-ARIA patterns when content changes
- Return focus to trigger element when closing overlays

## Hit Targets

### Size Requirements
| Context | Minimum Size |
|---------|--------------|
| Visual target | Can be < 24px |
| Actual hit area | ≥ 24px always |
| Mobile touch | 44px minimum |

### Implementation
```css
/* Visual 16px, hit area 44px */
.icon-button {
  width: 16px;
  height: 16px;
  padding: 14px; /* (44 - 16) / 2 */
  margin: -14px; /* Negative margin to maintain layout */
}

/* Or use ::before/::after for invisible hit area */
.small-target {
  position: relative;
}
.small-target::before {
  content: '';
  position: absolute;
  inset: -14px;
}
```

## Mobile Optimization

### Prevent iOS Safari Auto-Zoom
```css
/* Option 1: Input font size ≥ 16px */
input, textarea, select {
  font-size: 16px;
}

/* Option 2: Viewport meta (less preferred) */
/* <meta name="viewport" content="width=device-width, maximum-scale=1"> */
```

**Never disable browser zoom** - it's an accessibility requirement.

### Touch Interactions
```css
/* Prevent double-tap zoom on interactive elements */
button, a, input {
  touch-action: manipulation;
}

/* Configure tap highlight */
* {
  -webkit-tap-highlight-color: var(--color-tap-highlight);
}
```

## Loading States

### Timing
| Phase | Timing |
|-------|--------|
| Delay before spinner | 150-300ms |
| Minimum visible time | 300-500ms |

### Implementation
```tsx
// Show spinner after delay, keep visible minimum time
const [showSpinner, setShowSpinner] = useState(false);

useEffect(() => {
  if (isLoading) {
    const showTimer = setTimeout(() => setShowSpinner(true), 200);
    return () => clearTimeout(showTimer);
  } else {
    // Keep visible for minimum time
    const hideTimer = setTimeout(() => setShowSpinner(false), 300);
    return () => clearTimeout(hideTimer);
  }
}, [isLoading]);
```

### Button Loading States
```tsx
// Preserve original label while loading
<button disabled={isSubmitting}>
  {isSubmitting ? (
    <>
      <Spinner aria-hidden="true" />
      <span>Saving...</span>
    </>
  ) : (
    'Save'
  )}
</button>
```

### Loading Text Pattern
- Use ellipsis for in-progress states: "Loading…", "Saving…", "Generating…"
- Use single ellipsis character (…) not three periods (...)

## URL State Management

### Deep-Link Everything
- Filters
- Tabs
- Pagination
- Expanded panels
- Any `useState` that represents view state

```tsx
// Use nuqs or similar library
import { useQueryState } from 'nuqs';

const [tab, setTab] = useQueryState('tab', { defaultValue: 'overview' });
const [page, setPage] = useQueryState('page', { parse: parseInt, defaultValue: 1 });
```

### Benefits
- Shareable URLs
- Refresh preserves state
- Back/forward navigation works
- Bookmarkable states

## Optimistic Updates

### Pattern
1. Update UI immediately on user action
2. Send request to server
3. Reconcile with server response
4. On failure: show error, provide rollback/undo

```tsx
const handleDelete = async (id: string) => {
  // Optimistic update
  setItems(prev => prev.filter(item => item.id !== id));

  try {
    await deleteItem(id);
  } catch (error) {
    // Rollback on failure
    setItems(prev => [...prev, deletedItem]);
    toast.error('Failed to delete. Item restored.');
  }
};
```

## Navigation Links

### Use Correct Elements
```tsx
// ✅ Correct: Use <a> or <Link> for navigation
<Link href="/dashboard">Dashboard</Link>

// ❌ Wrong: Never use button/div for navigation
<button onClick={() => router.push('/dashboard')}>Dashboard</button>
<div onClick={...}>Dashboard</div>
```

### Why It Matters
Using `<a>` preserves browser behaviors:
- Cmd/Ctrl+Click opens new tab
- Middle-click opens new tab
- Right-click shows context menu
- Proper crawlability

## Scrolling Behavior

### Restore Scroll Position
Browser handles this automatically for back/forward navigation.

### Modal/Drawer Scroll Containment
```css
.modal {
  overscroll-behavior: contain;
}
```

### Deep Link Scroll Offset
```css
/* Account for fixed headers */
[id] {
  scroll-margin-top: 80px; /* Header height + padding */
}
```

## Tooltips

### Timing Pattern
| Scenario | Delay |
|----------|-------|
| First tooltip in group | Standard delay (e.g., 500ms) |
| Subsequent peer tooltips | No delay |

### Implementation
Track whether user is "warm" (recently viewed a tooltip) and skip delay for subsequent ones.

## Destructive Actions

### Requirements
- Require confirmation dialog, OR
- Provide undo window (toast with undo action)

### Menu Items
End with ellipsis if action opens follow-up: "Rename…", "Delete…"

## Async Announcements

### Screen Reader Updates
```tsx
// Use polite aria-live for toasts and validation
<div role="status" aria-live="polite">
  {validationMessage}
</div>

// Or use assertive for critical errors
<div role="alert" aria-live="assertive">
  {criticalError}
</div>
```

## Input Handling

### Never Block
- Never disable paste on any input
- Allow text replacements
- Trim whitespace (don't error on leading/trailing spaces)

### Hydration Safety
```tsx
// Inputs must maintain focus and value after hydration
// Use uncontrolled inputs when possible
<input defaultValue={initialValue} ref={inputRef} />
```

## Internationalization

### Keyboard Shortcuts
- Internationalize for non-QWERTY layouts
- Display platform-specific symbols (⌘ on Mac, Ctrl on Windows)

```tsx
const isMac = navigator.platform.includes('Mac');
const modifier = isMac ? '⌘' : 'Ctrl';
```

## Dead Zones

**Rule:** If something looks interactive, make it interactive.

Don't leave ambiguous clickable-looking areas that do nothing.
