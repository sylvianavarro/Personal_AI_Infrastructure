# Server-Side Performance

**Priority: HIGH | Impact: TTFB, data fetching.**

## Rule 8: Use React.cache() for Deduplication

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

## Rule 9: Parallel Route Segments

```tsx
// GOOD: Next.js parallel routes
// app/@analytics/page.tsx loads in parallel with
// app/@dashboard/page.tsx
```

## Rule 10: Streaming with Loading UI

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
