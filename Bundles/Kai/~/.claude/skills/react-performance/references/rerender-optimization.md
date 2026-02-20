# Re-render Optimization

**Priority: MEDIUM | Impact: UI responsiveness.**

## Rule 14: Memoize Expensive Computations

```tsx
// BAD: Recalculates every render
const sorted = items.sort((a, b) => a.date - b.date);

// GOOD: Only recalculates when items change
const sorted = useMemo(
  () => items.sort((a, b) => a.date - b.date),
  [items]
);
```

## Rule 15: Use Functional setState

```tsx
// BAD: Stale closure risk
setCount(count + 1);
setCount(count + 1); // Still uses old count

// GOOD: Always uses latest state
setCount(c => c + 1);
setCount(c => c + 1); // Correctly increments twice
```

## Rule 16: useTransition for Non-Urgent Updates

```tsx
// BAD: Blocks UI during expensive update
setSearchResults(filterResults(query));

// GOOD: Keeps UI responsive
const [isPending, startTransition] = useTransition();
startTransition(() => {
  setSearchResults(filterResults(query));
});
```

## Rule 17: Avoid Inline Object/Array Props

```tsx
// BAD: New object every render, breaks memoization
<Component style={{ color: 'red' }} items={[1, 2, 3]} />

// GOOD: Stable references
const style = useMemo(() => ({ color: 'red' }), []);
const items = useMemo(() => [1, 2, 3], []);
<Component style={style} items={items} />
```
