# Risk Visualization Patterns

## Risk Scoring

### Risk Level Scale

| Score | Level | Color | Badge |
|-------|-------|-------|-------|
| 0-25 | Low | Green (#22C55E) | `bg-green-100 text-green-800` |
| 26-50 | Medium | Amber (#F59E0B) | `bg-amber-100 text-amber-800` |
| 51-75 | High | Orange (#F97316) | `bg-orange-100 text-orange-800` |
| 76-100 | Critical | Red (#EF4444) | `bg-red-100 text-red-800` |

### Visual Representations

**Progress Bar**
```tsx
<div className="w-full bg-gray-200 rounded-full h-2">
  <div
    className={`h-2 rounded-full ${getRiskColor(score)}`}
    style={{ width: `${score}%` }}
    role="progressbar"
    aria-valuenow={score}
    aria-valuemin={0}
    aria-valuemax={100}
    aria-label={`Risk score: ${score} out of 100`}
  />
</div>
```

**Gauge/Dial**
```
         Critical
           ↑
     High  │  Low
       ╲   │   ╱
        ╲  │  ╱
         ╲ │ ╱
          ◉──→ 72
```

**Heat Map (for multiple entities)**
```
┌─────────────────────────────────────────────────────┐
│ Vendor Risk Matrix                                  │
│                                                     │
│ Vendor A  ██████████░░░░░░░░░░  45%  Medium       │
│ Vendor B  ████████████████░░░░  78%  Critical     │
│ Vendor C  ████░░░░░░░░░░░░░░░░  22%  Low          │
│ Vendor D  █████████████░░░░░░░  62%  High         │
└─────────────────────────────────────────────────────┘
```

## Compliance Status

### Status Badges
```tsx
const complianceStatuses = {
  compliant: {
    label: 'Compliant',
    icon: <CheckCircle />,
    className: 'bg-green-100 text-green-800',
  },
  partial: {
    label: 'Partially Compliant',
    icon: <AlertCircle />,
    className: 'bg-amber-100 text-amber-800',
  },
  nonCompliant: {
    label: 'Non-Compliant',
    icon: <XCircle />,
    className: 'bg-red-100 text-red-800',
  },
  pending: {
    label: 'Pending Review',
    icon: <Clock />,
    className: 'bg-blue-100 text-blue-800',
  },
  expired: {
    label: 'Expired',
    icon: <AlertTriangle />,
    className: 'bg-gray-100 text-gray-800',
  },
};
```

### Compliance Timeline
```
┌─────────────────────────────────────────────────────────┐
│ Compliance Timeline                                     │
│                                                         │
│ Jan ──●── Feb ──●── Mar ──●── Apr ──○── May ──○── Jun  │
│       ↑         ↑         ↑                             │
│    Audit     Renewal   Assessment    Upcoming ───────→  │
│    Complete  Complete  Complete                         │
└─────────────────────────────────────────────────────────┘
```

## Third-Party Risk (TPRM)

### Vendor Risk Card
```
┌─────────────────────────────────────────────────────┐
│ Acme Corporation                         [Critical] │
│ ─────────────────────────────────────────────────── │
│ Overall Risk Score                                  │
│ ████████████████░░░░  78/100                       │
│                                                     │
│ Risk Factors:                                       │
│ ├─ Security    ██████████████░░░░░░  72            │
│ ├─ Financial   █████████████████░░░  85            │
│ ├─ Operational ████████████░░░░░░░░  58            │
│ └─ Compliance  ███████████████████░  95            │
│                                                     │
│ Last Assessment: Jan 15, 2026                       │
│ Next Review: Apr 15, 2026                           │
│                                           [Details] │
└─────────────────────────────────────────────────────┘
```

### Risk Matrix (Impact vs Likelihood)
```
                  ┌─────────────────────────────────────┐
    High          │  Medium   │   High    │  Critical  │
                  ├───────────┼───────────┼────────────┤
    Impact        │   Low     │  Medium   │    High    │
                  ├───────────┼───────────┼────────────┤
    Low           │ Very Low  │    Low    │   Medium   │
                  └───────────┴───────────┴────────────┘
                      Low       Medium        High
                              Likelihood
```

## Trend Indicators

### Change Over Time
```tsx
// Positive change (good)
<span className="text-green-600 flex items-center">
  <TrendingUp className="h-4 w-4 mr-1" />
  Improved 12% since last quarter
</span>

// Negative change (bad for risk = good)
<span className="text-green-600 flex items-center">
  <TrendingDown className="h-4 w-4 mr-1" />
  Risk decreased 8%
</span>

// Context matters: for revenue, down = bad
<span className="text-red-600 flex items-center">
  <TrendingDown className="h-4 w-4 mr-1" />
  Revenue down 5%
</span>
```

### Sparklines
Small inline charts showing trend:
```
Risk Score: 72  ∿∿∿∿∿∿∿∿╱  ↑ Increasing
Compliance: 95  ╲∿∿∿∿∿∿∿∿  ↓ Stable
```

## Alert Thresholds

### Threshold Configuration
```tsx
interface AlertThreshold {
  metric: string;
  warning: number;
  critical: number;
  direction: 'above' | 'below';
}

const riskThresholds: AlertThreshold = {
  metric: 'Overall Risk Score',
  warning: 50,  // Amber alert
  critical: 75, // Red alert
  direction: 'above',
};
```

### Visual Threshold Markers
```
Risk Score
100 ─────────── Critical Zone
 75 ─ ─ ─ ─ ─ ─ Critical Threshold ⚠️
 50 ─ ─ ─ ─ ─ ─ Warning Threshold
 25 ───────────
  0 ─────────── Safe Zone
```

## Accessibility for Risk Visualization

- **Never use color alone** - always include:
  - Text labels (Low, Medium, High, Critical)
  - Icons or patterns
  - Numerical values

- **Provide text alternatives**
  ```tsx
  <div aria-label="Risk score 72 out of 100, rated High">
    {/* Visual gauge */}
  </div>
  ```

- **Announce changes** for live updates:
  ```tsx
  <div role="status" aria-live="polite">
    Risk score changed from 68 to 72
  </div>
  ```
