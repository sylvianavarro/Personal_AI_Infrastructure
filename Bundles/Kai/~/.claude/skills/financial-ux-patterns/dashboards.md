# Financial Dashboard Patterns

## Dashboard Hierarchy

### Information Architecture
```
Level 1: Summary Metrics (KPIs)
   ↓
Level 2: Trend Visualization (Charts)
   ↓
Level 3: Detail Tables (Data)
   ↓
Level 4: Actions & Alerts
```

## KPI Cards

### Standard KPI Card
```
┌─────────────────────────────────┐
│ Total Assets Under Management   │  ← Label
│ $42.5M                          │  ← Primary value
│ ▲ +12.3% vs last quarter       │  ← Change indicator
└─────────────────────────────────┘
```

### Card Variants

**Simple Metric**
```tsx
<Card>
  <CardHeader>
    <CardTitle className="text-sm text-muted">
      Total Revenue
    </CardTitle>
  </CardHeader>
  <CardContent>
    <p className="text-3xl font-bold tabular-nums">
      $1,234,567
    </p>
    <p className="text-sm text-green-600 flex items-center mt-1">
      <TrendingUp className="h-4 w-4 mr-1" />
      +15.3% from last month
    </p>
  </CardContent>
</Card>
```

**Metric with Sparkline**
```
┌─────────────────────────────────┐
│ Daily Volume                    │
│ $892K        ~~~∿~~~∿~~        │  ← Mini chart
│ ▲ +8.2%                         │
└─────────────────────────────────┘
```

**Risk Score Card**
```
┌─────────────────────────────────┐
│ Risk Score                      │
│ ████████░░░░ 72/100            │  ← Progress bar
│ Medium Risk                     │
└─────────────────────────────────┘
```

## Chart Patterns

### When to Use Each Chart Type

| Chart | Use For | Avoid For |
|-------|---------|-----------|
| Line | Trends over time | Categories |
| Bar | Comparing categories | Too many items (>12) |
| Pie/Donut | Part of whole (max 5) | Precise comparison |
| Area | Volume/accumulation | Overlapping data |
| Table | Precise values | Quick scanning |

### Financial Chart Guidelines

**Line Charts (Time Series)**
- Y-axis: Always start at meaningful baseline (not always 0)
- X-axis: Consistent time intervals
- Max 4-5 lines before it gets confusing
- Use legend or direct labels

**Bar Charts (Comparison)**
- Horizontal for long labels
- Sort by value (largest first) or logical order
- Always start Y-axis at 0 for bars

### Color Usage in Charts
```tsx
// Categorical palette (5 colors)
const chartColors = [
  '#4166F5', // Deep Blue (primary)
  '#9EC0F5', // Middle Blue
  '#4D14D8', // AI Violet
  '#22C55E', // Success green
  '#F59E0B', // Warning amber
];

// Sequential for value ranges
const sequentialBlue = [
  '#ECF2FD', // Light
  '#9EC0F5', // Medium
  '#4166F5', // Primary
  '#2D4CC4', // Dark
];
```

## Layout Patterns

### Grid System

**Desktop (lg+)**
```
┌────────────────────────────────────────────────────┐
│ [KPI] [KPI] [KPI] [KPI]                           │  4-column KPIs
├────────────────────────────┬───────────────────────┤
│ Main Chart (2/3)           │ Side Panel (1/3)     │  2:1 ratio
├────────────────────────────┴───────────────────────┤
│ Data Table (full width)                            │
└────────────────────────────────────────────────────┘
```

**Tablet (md)**
```
┌─────────────────────────────────┐
│ [KPI] [KPI]                     │  2-column KPIs
│ [KPI] [KPI]                     │
├─────────────────────────────────┤
│ Chart (full width)              │
├─────────────────────────────────┤
│ Side Panel                      │
├─────────────────────────────────┤
│ Table                           │
└─────────────────────────────────┘
```

**Mobile (xs-sm)**
```
┌─────────────────────────────────┐
│ [KPI]                           │  Stacked
│ [KPI]                           │
│ ...                             │
├─────────────────────────────────┤
│ Chart                           │
├─────────────────────────────────┤
│ Table (card view)               │
└─────────────────────────────────┘
```

## Filtering & Time Controls

### Date Range Selector
```
┌─────────────────────────────────────────────────────┐
│ [Today] [7D] [30D] [90D] [1Y] [Custom: __|__ ]     │
└─────────────────────────────────────────────────────┘
```

### Filter Bar
```
┌─────────────────────────────────────────────────────┐
│ [Status ▼] [Category ▼] [Risk Level ▼] [🔍 Search] │
│ Active filters: Status: Active × | Risk: High ×    │
└─────────────────────────────────────────────────────┘
```

## Real-Time Updates

### Live Data Indicators
```tsx
// Pulse indicator for live data
<div className="flex items-center">
  <span className="relative flex h-2 w-2 mr-2">
    <span className="animate-ping absolute h-full w-full rounded-full bg-green-400 opacity-75" />
    <span className="relative rounded-full h-2 w-2 bg-green-500" />
  </span>
  Live
</div>
```

### Update Patterns
- Highlight changed values briefly (flash animation)
- Show "Last updated: X" timestamp
- Provide manual refresh option
- Don't auto-refresh during user interaction

## Alerts & Notifications

### Alert Placement
```
┌─────────────────────────────────────────────────────┐
│ ⚠️ 3 vendors require attention                [→]  │  ← Top alert bar
├─────────────────────────────────────────────────────┤
│ Dashboard content...                                │
└─────────────────────────────────────────────────────┘
```

### Alert Severity
| Level | Color | Icon | Use |
|-------|-------|------|-----|
| Info | Blue | ℹ️ | Informational |
| Success | Green | ✓ | Completion |
| Warning | Amber | ⚠️ | Attention needed |
| Error | Red | ✕ | Action required |
