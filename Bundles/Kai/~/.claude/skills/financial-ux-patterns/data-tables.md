# Financial Data Tables

## Table Structure

### Anatomy
```
┌─────────────────────────────────────────────────────────┐
│ Title                              [Filter] [Export]    │  ← Header area
├──────────────┬──────────┬───────────┬─────────┬────────┤
│ Company      │ Risk     │ Amount    │ Change  │ Action │  ← Column headers
├──────────────┼──────────┼───────────┼─────────┼────────┤
│ Acme Corp    │ Low      │ $1,234.56 │ +5.2%   │ [...]  │  ← Data rows
│ Beta Inc     │ Medium   │ $2,345.67 │ -3.1%   │ [...]  │
│ Gamma LLC    │ High     │   $456.78 │ +12.8%  │ [...]  │
├──────────────┴──────────┴───────────┴─────────┴────────┤
│ Total: 3 items                    $4,037.01            │  ← Footer/summary
└─────────────────────────────────────────────────────────┘
```

## Column Types

### Numeric Columns
```tsx
// Right-aligned, tabular figures
<td className="text-right font-[tabular-nums]">
  {formatCurrency(value)}
</td>

// With change indicator
<td className="text-right">
  <span className={value >= 0 ? 'text-green-600' : 'text-red-600'}>
    {value >= 0 ? '+' : ''}{value.toFixed(2)}%
    {value >= 0 ? <ArrowUp /> : <ArrowDown />}
  </span>
</td>
```

### Status/Risk Columns
```tsx
// Badge-style status
<td className="text-center">
  <Badge variant={getRiskVariant(risk)}>
    {risk}
  </Badge>
</td>

// Risk levels
const riskVariants = {
  low: 'bg-green-100 text-green-800',
  medium: 'bg-amber-100 text-amber-800',
  high: 'bg-red-100 text-red-800',
  critical: 'bg-red-600 text-white',
};
```

### Date Columns
```tsx
// Consistent width formatting
<td className="text-left tabular-nums">
  {format(date, 'MMM dd, yyyy')} // Jan 15, 2026
</td>

// With relative time
<td>
  <span>{format(date, 'MMM dd')}</span>
  <span className="text-muted ml-2">
    ({formatDistanceToNow(date)} ago)
  </span>
</td>
```

## Sorting

### Visual Indicators
```tsx
<th onClick={handleSort} className="cursor-pointer">
  Amount
  {sortColumn === 'amount' && (
    sortDirection === 'asc'
      ? <ChevronUp className="inline" />
      : <ChevronDown className="inline" />
  )}
</th>
```

### Sort Order for Financial Data
| Data Type | Default Sort | Reason |
|-----------|--------------|--------|
| Amounts | Descending | Highest first |
| Risk | High → Low | Critical items first |
| Dates | Most recent | Latest activity |
| Status | Active first | Focus on current |
| Names | A-Z | Alphabetical |

## Row Patterns

### Expandable Rows
For showing additional detail without leaving context:
```
│ Acme Corp    │ Low      │ $1,234.56 │ +5.2%   │ [▶]    │
├──────────────┴──────────┴───────────┴─────────┴────────┤
│   ↳ Details: Last assessed: Jan 1, 2026                │
│     Documents: 12 | Compliance: 98%                    │
└─────────────────────────────────────────────────────────┘
```

### Selection
```tsx
// Checkbox column
<td className="w-12">
  <Checkbox
    checked={isSelected}
    onCheckedChange={onSelect}
    aria-label={`Select ${row.name}`}
  />
</td>
```

### Row Actions
```tsx
// Dropdown menu for actions
<td className="text-right">
  <DropdownMenu>
    <DropdownMenuTrigger asChild>
      <Button variant="ghost" size="sm">
        <MoreHorizontal className="h-4 w-4" />
        <span className="sr-only">Actions for {row.name}</span>
      </Button>
    </DropdownMenuTrigger>
    <DropdownMenuContent align="end">
      <DropdownMenuItem>View details</DropdownMenuItem>
      <DropdownMenuItem>Edit</DropdownMenuItem>
      <DropdownMenuSeparator />
      <DropdownMenuItem className="text-red-600">
        Delete
      </DropdownMenuItem>
    </DropdownMenuContent>
  </DropdownMenu>
</td>
```

## Responsive Tables

### Stacking Pattern (Mobile)
At `xs`-`sm` breakpoints, convert to cards:
```
┌─────────────────────────────────┐
│ Acme Corp                   Low │
│ ─────────────────────────────── │
│ Amount        │      $1,234.56  │
│ Change        │          +5.2%  │
│ ─────────────────────────────── │
│              [View Details]     │
└─────────────────────────────────┘
```

### Horizontal Scroll Pattern
For complex tables, maintain structure with scroll:
```tsx
<div className="overflow-x-auto">
  <table className="min-w-[800px]">
    {/* table content */}
  </table>
</div>
```

### Priority Columns
On small screens, show only critical columns:
```tsx
<th className="hidden md:table-cell">Secondary Data</th>
```

## Empty & Loading States

### Empty State
```tsx
<tr>
  <td colSpan={columns.length} className="text-center py-12">
    <FileQuestion className="mx-auto h-12 w-12 text-muted" />
    <p className="mt-4 text-lg font-medium">No data found</p>
    <p className="text-muted">Try adjusting your filters</p>
  </td>
</tr>
```

### Loading Skeleton
```tsx
{isLoading && (
  <tr>
    <td><Skeleton className="h-4 w-24" /></td>
    <td><Skeleton className="h-4 w-16" /></td>
    <td><Skeleton className="h-4 w-20" /></td>
  </tr>
)}
```

## Accessibility

- Use `<th scope="col">` for column headers
- Use `<th scope="row">` for row headers
- Provide `aria-sort` on sortable columns
- Ensure 4.5:1 contrast for all text
- Keyboard-navigable actions
- Screen reader announcements for updates
