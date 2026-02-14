# Performance

## Testing Environment

### Required Testing
- iOS Low Power Mode
- macOS Safari
- Chrome with throttling (CPU 4x, Network 3G)

### Before Testing
- Disable browser extensions that add overhead
- Use incognito/private mode for clean baseline

### Tools
```bash
# React re-render detection
npm install @react-scan/core

# In component
import { scan } from '@react-scan/core';
scan();

# Or use React DevTools Profiler
```

## Re-Render Optimization

### Core Principle
**Minimize re-renders, and make necessary ones fast.**

### Common Patterns
```tsx
// ❌ Bad - causes parent re-renders
const Parent = () => {
  const [count, setCount] = useState(0);
  return (
    <div>
      <ExpensiveChild />
      <button onClick={() => setCount(c => c + 1)}>
        Count: {count}
      </button>
    </div>
  );
};

// ✅ Good - isolate state
const Counter = () => {
  const [count, setCount] = useState(0);
  return (
    <button onClick={() => setCount(c => c + 1)}>
      Count: {count}
    </button>
  );
};

const Parent = () => (
  <div>
    <ExpensiveChild />
    <Counter />
  </div>
);
```

### Memoization
```tsx
// Memoize expensive computations
const sortedItems = useMemo(
  () => items.sort((a, b) => a.name.localeCompare(b.name)),
  [items]
);

// Memoize callbacks passed to children
const handleClick = useCallback(() => {
  doSomething(id);
}, [id]);

// Memoize components that receive objects/arrays
const MemoizedChild = memo(ExpensiveChild);
```

## Layout Thrash Prevention

### Batch DOM Reads/Writes
```tsx
// ❌ Bad - layout thrash
elements.forEach(el => {
  const height = el.offsetHeight; // Read
  el.style.height = height + 10 + 'px'; // Write
});

// ✅ Good - batch reads, then writes
const heights = elements.map(el => el.offsetHeight);
elements.forEach((el, i) => {
  el.style.height = heights[i] + 10 + 'px';
});
```

### Prefer CSS Over JS
```tsx
// ❌ Bad - JS measurement
const [width, setWidth] = useState(0);
useLayoutEffect(() => {
  setWidth(ref.current.offsetWidth);
}, []);

// ✅ Good - CSS handles it
<div className="flex gap-4">
  <div className="flex-1">Auto width</div>
</div>
```

## API Response Times

### Target
- POST/PATCH/DELETE: < 500ms

### Implementation
```tsx
// Show optimistic update immediately
const handleSave = async () => {
  // Optimistic update
  setData(newData);

  // Background save
  try {
    await api.save(newData);
  } catch {
    // Rollback
    setData(previousData);
    toast.error('Save failed');
  }
};
```

## Input Performance

### Prefer Uncontrolled
```tsx
// ✅ Uncontrolled - no re-renders on typing
<input
  defaultValue={initialValue}
  ref={inputRef}
  onBlur={() => handleChange(inputRef.current?.value)}
/>

// If controlled is needed, make the loop cheap
const [value, setValue] = useState('');
// Avoid expensive derivations during typing
```

### Debounce Expensive Operations
```tsx
const debouncedSearch = useMemo(
  () => debounce((query: string) => {
    fetchResults(query);
  }, 300),
  []
);
```

## Large Lists

### Virtualization
```tsx
import { VList } from 'virtua';

// Only renders visible items
<VList style={{ height: 400 }}>
  {items.map(item => (
    <ListItem key={item.id} item={item} />
  ))}
</VList>
```

### CSS Alternative
```css
/* Native content visibility for long pages */
.list-item {
  content-visibility: auto;
  contain-intrinsic-size: 0 80px; /* Estimated height */
}
```

## Images

### Loading Strategy
| Position | Strategy |
|----------|----------|
| Above fold | Preload, `loading="eager"` |
| Below fold | `loading="lazy"` |

### Prevent Layout Shift
```tsx
// ✅ Always set dimensions
<Image
  src="/photo.jpg"
  width={800}
  height={600}
  alt="Photo"
/>

// Or use aspect-ratio
<div className="aspect-video">
  <img src="/photo.jpg" className="w-full h-full object-cover" />
</div>
```

### Preconnect to CDNs
```html
<link rel="preconnect" href="https://cdn.example.com" crossorigin />
```

## Fonts

### Preload Critical Fonts
```html
<link
  rel="preload"
  href="/fonts/inter-var.woff2"
  as="font"
  type="font/woff2"
  crossorigin
/>
```

### Subset Fonts
```css
/* Only load needed characters */
@font-face {
  font-family: 'Inter';
  src: url('/fonts/inter-latin.woff2') format('woff2');
  unicode-range: U+0000-00FF, U+0131, U+0152-0153;
}
```

### Limit Variable Font Axes
```css
/* Only include axes you use */
@font-face {
  font-family: 'Inter';
  src: url('/fonts/inter-var.woff2') format('woff2');
  font-weight: 400 700; /* Only weights 400-700 */
}
```

## Web Workers

### Move Expensive Work Off Main Thread
```tsx
// worker.ts
self.onmessage = (e) => {
  const result = expensiveComputation(e.data);
  self.postMessage(result);
};

// component.tsx
const worker = new Worker(new URL('./worker.ts', import.meta.url));

worker.postMessage(data);
worker.onmessage = (e) => {
  setResult(e.data);
};
```

### Good Candidates for Workers
- JSON parsing large responses
- Data transformations
- Complex filtering/sorting
- Crypto operations
- Image processing

## Bundle Size

### Code Splitting
```tsx
// Lazy load routes
const Dashboard = lazy(() => import('./Dashboard'));

// Lazy load heavy components
const Chart = lazy(() => import('./Chart'));

<Suspense fallback={<Loading />}>
  <Chart />
</Suspense>
```

### Import Analysis
```bash
# Analyze bundle
npx @next/bundle-analyzer
```
