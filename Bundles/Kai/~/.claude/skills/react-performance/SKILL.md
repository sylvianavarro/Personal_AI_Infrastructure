---
name: react-performance
description: React and Next.js performance optimization. Use when writing, reviewing, or refactoring React/Next.js code, optimizing bundle size, or fixing performance issues.
---

# React Performance Optimization

23 rules across 7 priority categories for React and Next.js.

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

---

## Rules Summary

### CRITICAL

| # | Rule | Key Takeaway |
|---|------|-------------|
| 1 | Parallel data fetching | `Promise.all` over sequential awaits |
| 2 | Suspense boundaries | Independent loading states per section |
| 3 | Avoid fetch-then-render | Fetch at route level, not in useEffect |
| 4 | Dynamic imports | `dynamic()` for heavy components |
| 5 | Avoid barrel files | Direct imports for tree-shaking |
| 6 | Defer third-party scripts | `strategy="lazyOnload"` |
| 7 | Code split by route | App router does this; `lazy()` for manual |

### HIGH

| # | Rule | Key Takeaway |
|---|------|-------------|
| 8 | React.cache() | Deduplicate server-side data fetches |
| 9 | Parallel route segments | `@slot` parallel routes in Next.js |
| 10 | Streaming with loading UI | `loading.tsx` for instant feedback |

### MEDIUM-HIGH

| # | Rule | Key Takeaway |
|---|------|-------------|
| 11 | SWR/React Query | Deduplicate + cache client fetches |
| 12 | Consolidate event listeners | Custom hooks over raw addEventListener |
| 13 | Debounce expensive ops | `debounce(fn, 300)` for search/resize |

### MEDIUM

| # | Rule | Key Takeaway |
|---|------|-------------|
| 14 | useMemo for expensive compute | Recalculate only when deps change |
| 15 | Functional setState | `setCount(c => c + 1)` avoids stale closures |
| 16 | useTransition | Non-urgent updates don't block UI |
| 17 | Stable prop references | Memoize objects/arrays passed as props |
| 18 | Virtualize long lists | `@tanstack/react-virtual` for 50+ items |
| 19 | content-visibility CSS | Browser skips off-screen rendering |
| 20 | Prevent hydration flicker | Client-only for dynamic values |
| 21 | Next.js Image | Width/height, priority, lazy loading |

### LOWER

| # | Rule | Key Takeaway |
|---|------|-------------|
| 22 | Set/Map for lookups | O(1) vs O(n) with `includes` |
| 23 | No functions in loops | Single handler + data attributes |

## Reference Loading

When working on a specific area, read the corresponding reference file for detailed rules and code examples:

| Area | Reference |
|------|-----------|
| Waterfalls (Rules 1-3) | `references/eliminating-waterfalls.md` |
| Bundle Size (Rules 4-7) | `references/bundle-size.md` |
| Server-Side (Rules 8-10) | `references/server-side.md` |
| Client Fetching (Rules 11-13) | `references/client-data-fetching.md` |
| Re-renders (Rules 14-17) | `references/rerender-optimization.md` |
| Rendering (Rules 18-21) | `references/rendering-performance.md` |
| JS Performance (Rules 22-23) | `references/javascript-performance.md` |

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
| **requesting-code-review** | Performance in review checklist |
| **design-system** | Component patterns |
| **systematic-debugging** | Performance debugging |
