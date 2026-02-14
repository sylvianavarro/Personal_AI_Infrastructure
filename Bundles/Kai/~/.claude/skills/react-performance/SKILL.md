---
name: react-performance
description: React and Next.js performance optimization. Use when writing, reviewing, or refactoring React/Next.js code, optimizing bundle size, or fixing performance issues.
---

# React Performance Optimization

45+ rules across 8 priority categories for React and Next.js.

## When to Use

- Writing new React components
- Reviewing React/Next.js code
- Debugging performance issues
- Optimizing bundle size
- Fixing slow renders or waterfalls

---

## Priority Categories

| Priority | Category | Impact |
|----------|----------|--------|
| CRITICAL | Eliminating Waterfalls | Seconds of delay |
| CRITICAL | Bundle Size | Initial load time |
| HIGH | Server-Side Performance | TTFB, data fetching |
| MEDIUM-HIGH | Client Data Fetching | Runtime efficiency |
| MEDIUM | Re-render Optimization | UI responsiveness |
| MEDIUM | Rendering Performance | Paint/layout |
| LOWER | JavaScript Performance | Micro-optimizations |
| LOWER | Advanced Patterns | Edge cases |

---

## CRITICAL: Eliminating Waterfalls

**Impact:** Can save seconds of load time.

### Rule 1: Parallel Data Fetching

```tsx
// BAD: Sequential (waterfall)
const user = await getUser();
const posts = await getPosts(user.id);
const comments = await getComments(posts[0].id);

// GOOD: Parallel where possible
const [user, posts] = await Promise.all([
  getUser(),
  getPosts(userId)
]);
```

### Rule 2: Use Suspense Boundaries

```tsx
// BAD: Parent waits for all children
function Page() {
  const data = await fetchAllData(); // blocks everything
  return <Content data={data} />;
}

// GOOD: Independent Suspense boundaries
function Page() {
  return (
    <>
      <Suspense fallback={<HeaderSkeleton />}>
        <Header />
      </Suspense>
      <Suspense fallback={<ContentSkeleton />}>
        <Content />
      </Suspense>
    </>
  );
}
```

### Rule 3: Avoid Fetch-Then-Render

```tsx
// BAD: Component fetches after mount
function Profile() {
  const [user, setUser] = useState(null);
  useEffect(() => {
    fetchUser().then(setUser);
  }, []);
}

// GOOD: Fetch at route level, pass down
// app/profile/page.tsx
async function ProfilePage() {
  const user = await fetchUser();
  return <Profile user={user} />;
}
```

---

## CRITICAL: Bundle Size

**Impact:** Directly affects initial load time.

### Rule 4: Dynamic Imports for Heavy Components

```tsx
// BAD: Always loaded
import { Chart } from 'heavy-chart-library';

// GOOD: Loaded only when needed
const Chart = dynamic(() => import('heavy-chart-library'), {
  loading: () => <ChartSkeleton />,
  ssr: false
});
```

### Rule 5: Avoid Barrel Files

```tsx
// BAD: Imports entire barrel (tree-shaking fails)
import { Button } from '@/components';
import { debounce } from 'lodash';

// GOOD: Direct imports
import { Button } from '@/components/Button';
import debounce from 'lodash/debounce';
```

### Rule 6: Defer Third-Party Scripts

```tsx
// BAD: Blocks rendering
<script src="https://analytics.com/script.js" />

// GOOD: Deferred loading
<Script
  src="https://analytics.com/script.js"
  strategy="lazyOnload"
/>
```

### Rule 7: Code Split by Route

```tsx
// Next.js does this automatically with app router
// For manual splitting:
const AdminDashboard = lazy(() => import('./AdminDashboard'));
```

---

## HIGH: Server-Side Performance

### Rule 8: Use React.cache() for Deduplication

```tsx
// BAD: Same data fetched multiple times
// Component A fetches user, Component B fetches user again

// GOOD: Cached at request level
import { cache } from 'react';

const getUser = cache(async (id: string) => {
  return db.user.findUnique({ where: { id } });
});

// Now multiple components can call getUser(id) - only one DB hit
```

### Rule 9: Parallel Route Segments

```tsx
// GOOD: Next.js parallel routes
// app/@analytics/page.tsx loads in parallel with
// app/@dashboard/page.tsx
```

### Rule 10: Streaming with Loading UI

```tsx
// app/dashboard/loading.tsx - shows immediately
export default function Loading() {
  return <DashboardSkeleton />;
}

// app/dashboard/page.tsx - streams when ready
export default async function Dashboard() {
  const data = await fetchDashboard();
  return <DashboardContent data={data} />;
}
```

---

## MEDIUM-HIGH: Client Data Fetching

### Rule 11: Use SWR/React Query for Deduplication

```tsx
// BAD: Multiple components fetch same data
useEffect(() => { fetch('/api/user') }, []);

// GOOD: Automatic deduplication and caching
const { data } = useSWR('/api/user', fetcher);
```

### Rule 12: Consolidate Event Listeners

```tsx
// BAD: Multiple listeners
useEffect(() => {
  window.addEventListener('resize', handleResize);
  window.addEventListener('scroll', handleScroll);
}, []);

// GOOD: Single consolidated listener or use hooks
import { useWindowSize } from '@/hooks/useWindowSize';
```

### Rule 13: Debounce Expensive Operations

```tsx
// BAD: Fires on every keystroke
<input onChange={(e) => search(e.target.value)} />

// GOOD: Debounced
const debouncedSearch = useMemo(
  () => debounce(search, 300),
  []
);
<input onChange={(e) => debouncedSearch(e.target.value)} />
```

---

## MEDIUM: Re-render Optimization

### Rule 14: Memoize Expensive Computations

```tsx
// BAD: Recalculates every render
const sorted = items.sort((a, b) => a.date - b.date);

// GOOD: Only recalculates when items change
const sorted = useMemo(
  () => items.sort((a, b) => a.date - b.date),
  [items]
);
```

### Rule 15: Use Functional setState

```tsx
// BAD: Stale closure risk
setCount(count + 1);
setCount(count + 1); // Still uses old count

// GOOD: Always uses latest state
setCount(c => c + 1);
setCount(c => c + 1); // Correctly increments twice
```

### Rule 16: useTransition for Non-Urgent Updates

```tsx
// BAD: Blocks UI during expensive update
setSearchResults(filterResults(query));

// GOOD: Keeps UI responsive
const [isPending, startTransition] = useTransition();
startTransition(() => {
  setSearchResults(filterResults(query));
});
```

### Rule 17: Avoid Inline Object/Array Props

```tsx
// BAD: New object every render, breaks memoization
<Component style={{ color: 'red' }} items={[1, 2, 3]} />

// GOOD: Stable references
const style = useMemo(() => ({ color: 'red' }), []);
const items = useMemo(() => [1, 2, 3], []);
<Component style={style} items={items} />
```

---

## MEDIUM: Rendering Performance

### Rule 18: Virtualize Long Lists

```tsx
// BAD: Renders all 10,000 items
{items.map(item => <Row key={item.id} {...item} />)}

// GOOD: Only renders visible items
import { useVirtualizer } from '@tanstack/react-virtual';
// or use content-visibility: auto in CSS
```

### Rule 19: Use content-visibility for Off-Screen Content

```css
/* GOOD: Browser skips rendering off-screen sections */
.card {
  content-visibility: auto;
  contain-intrinsic-size: 200px;
}
```

### Rule 20: Prevent Hydration Flicker

```tsx
// BAD: Server/client mismatch
function Time() {
  return <span>{new Date().toLocaleString()}</span>;
}

// GOOD: Client-only rendering for dynamic content
function Time() {
  const [time, setTime] = useState<string>();
  useEffect(() => {
    setTime(new Date().toLocaleString());
  }, []);
  return <span>{time ?? 'Loading...'}</span>;
}
```

### Rule 21: Optimize Images

```tsx
// BAD: No optimization
<img src="/hero.png" />

// GOOD: Next.js Image with optimization
<Image
  src="/hero.png"
  width={800}
  height={600}
  priority // for above-fold
  // or loading="lazy" for below-fold
/>
```

---

## LOWER: JavaScript Performance

### Rule 22: Use Set/Map for Lookups

```tsx
// BAD: O(n) lookup
const isSelected = selectedIds.includes(id);

// GOOD: O(1) lookup
const selectedSet = useMemo(() => new Set(selectedIds), [selectedIds]);
const isSelected = selectedSet.has(id);
```

### Rule 23: Avoid Creating Functions in Loops

```tsx
// BAD: New function for each item
{items.map(item => (
  <Button onClick={() => handleClick(item.id)} />
))}

// GOOD: Single handler with data attribute
const handleClick = useCallback((e) => {
  const id = e.currentTarget.dataset.id;
  // handle click
}, []);

{items.map(item => (
  <Button data-id={item.id} onClick={handleClick} />
))}
```

---

## Quick Checklist

Before shipping React code:

- [ ] No sequential awaits that could be parallel?
- [ ] Heavy components dynamically imported?
- [ ] Direct imports, not barrel files?
- [ ] Lists >50 items virtualized?
- [ ] Images have width/height?
- [ ] Below-fold images lazy loaded?
- [ ] Expensive computations memoized?
- [ ] No hydration mismatches?

---

## Integration with Other Skills

| Skill | Integration |
|-------|-------------|
| **ui-review** | UI/accessibility audit |
| **commit** | Performance checks before commit |
| **test-patterns** | Testing performance improvements |
