# Rendering Performance

**Priority: MEDIUM | Impact: Paint/layout.**

## Rule 18: Virtualize Long Lists

```tsx
// BAD: Renders all 10,000 items
{items.map(item => <Row key={item.id} {...item} />)}

// GOOD: Only renders visible items
import { useVirtualizer } from '@tanstack/react-virtual';
// or use content-visibility: auto in CSS
```

## Rule 19: Use content-visibility for Off-Screen Content

```css
/* GOOD: Browser skips rendering off-screen sections */
.card {
  content-visibility: auto;
  contain-intrinsic-size: 200px;
}
```

## Rule 20: Prevent Hydration Flicker

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

## Rule 21: Optimize Images

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
