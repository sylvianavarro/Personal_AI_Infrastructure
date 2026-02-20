# Bundle Size

**Priority: CRITICAL | Impact: Directly affects initial load time.**

## Rule 4: Dynamic Imports for Heavy Components

```tsx
// BAD: Always loaded
import { Chart } from 'heavy-chart-library';

// GOOD: Loaded only when needed
const Chart = dynamic(() => import('heavy-chart-library'), {
  loading: () => <ChartSkeleton />,
  ssr: false
});
```

## Rule 5: Avoid Barrel Files

```tsx
// BAD: Imports entire barrel (tree-shaking fails)
import { Button } from '@/components';
import { debounce } from 'lodash';

// GOOD: Direct imports
import { Button } from '@/components/Button';
import debounce from 'lodash/debounce';
```

## Rule 6: Defer Third-Party Scripts

```tsx
// BAD: Blocks rendering
<script src="https://analytics.com/script.js" />

// GOOD: Deferred loading
<Script
  src="https://analytics.com/script.js"
  strategy="lazyOnload"
/>
```

## Rule 7: Code Split by Route

```tsx
// Next.js does this automatically with app router
// For manual splitting:
const AdminDashboard = lazy(() => import('./AdminDashboard'));
```
