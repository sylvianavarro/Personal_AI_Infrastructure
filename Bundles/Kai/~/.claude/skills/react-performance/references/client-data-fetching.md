# Client Data Fetching

**Priority: MEDIUM-HIGH | Impact: Runtime efficiency.**

## Rule 11: Use SWR/React Query for Deduplication

```tsx
// BAD: Multiple components fetch same data
useEffect(() => { fetch('/api/user') }, []);

// GOOD: Automatic deduplication and caching
const { data } = useSWR('/api/user', fetcher);
```

## Rule 12: Consolidate Event Listeners

```tsx
// BAD: Multiple listeners
useEffect(() => {
  window.addEventListener('resize', handleResize);
  window.addEventListener('scroll', handleScroll);
}, []);

// GOOD: Single consolidated listener or use hooks
import { useWindowSize } from '@/hooks/useWindowSize';
```

## Rule 13: Debounce Expensive Operations

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
