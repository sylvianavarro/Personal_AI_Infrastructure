# JavaScript Performance

**Priority: LOWER | Impact: Micro-optimizations.**

## Rule 22: Use Set/Map for Lookups

```tsx
// BAD: O(n) lookup
const isSelected = selectedIds.includes(id);

// GOOD: O(1) lookup
const selectedSet = useMemo(() => new Set(selectedIds), [selectedIds]);
const isSelected = selectedSet.has(id);
```

## Rule 23: Avoid Creating Functions in Loops

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
