# Design:ComponentStandards Sub-Skill

Reusable UI component standards to ensure consistency, accessibility, and UX best practices across the application.

## Dropdown Component

**CRITICAL**: Never use native `<select>` elements. Always use the standardized `Dropdown` component from `@/components/ui/Dropdown`.

### Why Not Native Selects?

| Issue | Native Select | Dropdown Component |
|-------|---------------|-------------------|
| Chevron spacing | Browser-controlled, cramped | Consistent `gap-2` spacing |
| Search | Not possible | Built-in fuzzy search |
| Match highlighting | Not possible | Highlights matching text |
| Hover states | Browser default | Custom hover styles |
| Selection indicator | Browser default checkmark | Custom checkmark with left border |
| Keyboard navigation | Basic | Full Arrow/Home/End support |
| Styling | Very limited | Fully customizable |

### Required Features

All dropdowns MUST have:

1. **Proper Chevron Spacing**
   - `gap-2` between label text and chevron icon
   - Chevron rotates 180deg when open
   - Chevron is `flex-shrink-0` to prevent squishing

2. **Hover States**
   - Trigger: `hover:bg-surface-light hover:text-text hover:border-text-muted`
   - Options: `hover:bg-surface-light hover:text-text hover:border-l-primary/50`

3. **Selection Indicator**
   - Selected option: `bg-primary/10 font-medium border-l-primary`
   - Checkmark icon on right side of selected option
   - Left border accent for visual hierarchy

4. **Keyboard Navigation**
   - `ArrowDown/ArrowUp`: Navigate options
   - `Home/End`: Jump to first/last option
   - `Enter`: Select focused option
   - `Escape`: Close dropdown
   - `Space/Enter` on trigger: Open dropdown

5. **Accessibility**
   - `role="listbox"` on dropdown panel
   - `role="option"` on each option
   - `aria-selected` on options
   - `aria-expanded` on trigger
   - `aria-haspopup="listbox"` on trigger
   - `aria-label` prop required

### Searchable Dropdowns

For lists with 5+ options, enable search:

```tsx
<Dropdown
  searchable
  searchPlaceholder="Search..."
  fuzzyMatch // Enable fuzzy matching with character highlighting
/>
```

When searchable:
- Search input auto-focuses on open
- Fuzzy matching highlights individual matching characters
- No-matches state shows "No matches" message
- Results sorted by match score (best matches first)

### Match Highlighting

When `searchable` and `fuzzyMatch` are enabled:
- Each matching character is wrapped in `<mark>` tag
- Highlighted with `bg-primary/30 text-text rounded-sm px-0.5`
- Non-contiguous matches supported (fuzzy)

### Usage

```tsx
import Dropdown from '@/components/ui/Dropdown'

// Simple dropdown (no "all" option)
<Dropdown
  label="Sort"
  options={[
    { value: 'newest', label: 'Newest First' },
    { value: 'oldest', label: 'Oldest First' },
  ]}
  value={sortBy}
  onChange={(value) => setSortBy(value)}
  ariaLabel="Sort order"
/>

// With "all" option
<Dropdown
  label="Type"
  options={TYPE_OPTIONS}
  value={typeFilter}
  onChange={(value) => setTypeFilter(value)}
  allLabel="All Types"
  ariaLabel="Filter by type"
/>

// Searchable with fuzzy matching
<Dropdown
  label="Species"
  options={speciesOptions}
  value={selectedSpecies}
  onChange={setSelectedSpecies}
  allLabel="All Species"
  searchable
  fuzzyMatch
  searchPlaceholder="Search species..."
  ariaLabel="Filter by species"
/>
```

### Panel Width

Control dropdown panel width with `panelWidth` prop:
- Default: `w-56` (224px)
- Common values: `w-40`, `w-44`, `w-48`, `w-56`, `w-64`

### Migration from Native Selects

When finding native `<select>` elements, replace:

```tsx
// BEFORE (BAD)
<select
  value={filter}
  onChange={(e) => setFilter(e.target.value)}
  className="..."
>
  <option value="all">All</option>
  <option value="active">Active</option>
</select>

// AFTER (GOOD)
<Dropdown
  label="Filter"
  options={[{ value: 'active', label: 'Active' }]}
  value={filter === 'all' ? null : filter}
  onChange={(value) => setFilter(value ?? 'all')}
  allLabel="All"
  ariaLabel="Filter items"
/>
```

## Audit Checklist

- [ ] No native `<select>` elements used
- [ ] All dropdowns use `@/components/ui/Dropdown`
- [ ] Chevron has proper spacing (`gap-2`)
- [ ] Hover states implemented
- [ ] Selection indicator visible (checkmark + left border)
- [ ] Keyboard navigation works
- [ ] `ariaLabel` provided
- [ ] Lists with 5+ items use `searchable`
- [ ] Fuzzy matching enabled where appropriate

## Related Components

- **FilterDropdown** (`avatar-toolbar/FilterDropdown.tsx`) - Legacy, use `Dropdown` instead
- **Dropdown** (`ui/Dropdown.tsx`) - Standardized component, use this

## Future Standards (TBD)

- Button component standards
- Input field standards
- Modal standards
- Toast standards
