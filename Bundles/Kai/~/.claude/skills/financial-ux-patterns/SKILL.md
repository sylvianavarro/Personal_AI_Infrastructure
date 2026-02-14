---
name: financial-ux-patterns
description: Use when designing financial data displays, dashboards, risk visualization, data tables, or any fintech UX. Covers number formatting, compliance UI, and trust patterns.
---

# Financial UX Patterns Expert

Domain-specific UX patterns for fintech, financial data, and GRC/TPRM applications.

## Core Principles

### Trust is Everything
Financial UX must prioritize:
1. **Clarity** - No ambiguity in numbers/actions
2. **Transparency** - Show how things work
3. **Accuracy** - Verified, real-time data
4. **Security cues** - Visible trust indicators
5. **Error prevention** - Confirm destructive actions

### Data Display Hierarchy
1. Most important metric: Large, prominent
2. Supporting data: Medium, contextual
3. Historical/comparison: Smaller, subdued

## Data Table Patterns

### Alignment Rules
| Data Type | Alignment | Why |
|-----------|-----------|-----|
| Numbers | Right | Decimal alignment |
| Currency | Right | Easy comparison |
| Percentages | Right | Numeric comparison |
| Text | Left | Natural reading |
| Dates | Left or Center | Consistent width |
| Status | Center | Visual scanning |
| Actions | Right | End of row |

### Number Formatting

```css
/* Enable tabular figures for aligned numbers */
.financial-data {
  font-variant-numeric: lining-nums tabular-nums;
}
```

| Format | Example | Rule |
|--------|---------|------|
| Currency | $1,234.56 | Always 2 decimals, thousand separators |
| Large Currency | $1.2M | Abbreviate >$1M with 1 decimal |
| Percentage | 12.34% | 2 decimals for precision |
| Change % | +5.67% / -3.21% | Sign always shown |
| Negative | ($1,234.56) or -$1,234.56 | Parentheses or minus |

### Color for Financial Data
| Meaning | Color | Note |
|---------|-------|------|
| Positive/Gain | Green (#22C55E) | With + symbol |
| Negative/Loss | Red (#EF4444) | With - or () |
| Neutral | Default text | No change |
| Warning | Amber (#F59E0B) | Approaching threshold |

**Accessibility Note:** Never use color alone. Always pair with:
- +/- symbols
- Parentheses for negatives
- Icons (↑↓)
- Text labels

## Authoritative Sources

| # | Source | URL | Focus |
|---|--------|-----|-------|
| 1 | NNGroup Financial UX | https://www.nngroup.com/topic/financial-ux/ | UX research |
| 2 | NNGroup Data Tables | https://www.nngroup.com/articles/data-tables/ | Table design |
| 3 | Baymard Institute | https://baymard.com/research | E-commerce/checkout |
| 4 | BlackRock Design | https://www.blackrock.com/corporate/about-us/design | Enterprise finance |
| 5 | Stripe Design | https://stripe.com/blog/designing-for-trust | Trust patterns |
| 6 | Plaid UX | https://plaid.com/resources/ | Banking UX |
| 7 | SEC Design Guide | https://www.sec.gov/fast-answers | Compliance writing |
| 8 | Material Finance | https://m3.material.io/styles/motion/applying-motion/data-visualization | Data viz motion |
| 9 | Financial Times Visual | https://www.ft.com/visual-vocabulary | Chart guidelines |
| 10 | Observable Finance | https://observablehq.com/@observablehq/financial-charts | Chart patterns |
| 11 | Edward Tufte | https://www.edwardtufte.com/tufte/ | Data visualization |
| 12 | Fidelity Design | https://design.fidelity.com/ | Investment UX |

## Usage

See supporting files:
- `data-tables.md` - Complete table patterns
- `dashboards.md` - Dashboard layouts
- `risk-visualization.md` - Risk/compliance displays
