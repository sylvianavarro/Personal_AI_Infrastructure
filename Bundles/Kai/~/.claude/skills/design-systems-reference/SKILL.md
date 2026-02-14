---
name: design-systems-reference
description: Use when benchmarking design decisions against industry standards. References Material Design 3, IBM Carbon, Shopify Polaris, Adobe Spectrum, GitHub Primer, Salesforce Lightning, and more.
---

# Design Systems Reference Expert

Industry design system patterns for benchmarking decisions.

## Quick Reference Matrix

| System | Company | Focus | Best For |
|--------|---------|-------|----------|
| Material Design 3 | Google | Universal | Components, motion |
| Carbon | IBM | Enterprise | Data-heavy, accessibility |
| Polaris | Shopify | Commerce | E-commerce, merchant UX |
| Spectrum | Adobe | Creative | Complex tools, workspaces |
| Primer | GitHub | Developer | Code-focused, technical |
| Lightning | Salesforce | CRM | Forms, data management |
| Fluent 2 | Microsoft | Enterprise | Productivity, cross-platform |
| Ant Design | Alibaba | Enterprise | React components, tables |

## When to Reference Each

### For Financial/Data UX (like Invela)
1. **IBM Carbon** - Best for data tables, complex forms, dashboards
2. **Salesforce Lightning** - Best for CRM patterns, record management
3. **Material Design** - Best for general components, accessibility
4. **Ant Design** - Best for dense data displays

### For Component Decisions
- **Buttons** → Material, Carbon
- **Forms** → Lightning, Carbon
- **Data Tables** → Carbon, Ant Design
- **Navigation** → Polaris, Primer
- **Charts** → Carbon, Material

## Authoritative Sources

| # | System | URL | Documentation |
|---|--------|-----|---------------|
| 1 | Material Design 3 | https://m3.material.io/ | Full spec |
| 2 | Material Components | https://m3.material.io/components | Component library |
| 3 | IBM Carbon | https://carbondesignsystem.com/ | Full spec |
| 4 | Carbon Components | https://carbondesignsystem.com/components/overview | Component library |
| 5 | Shopify Polaris | https://polaris.shopify.com/ | Full spec |
| 6 | Adobe Spectrum | https://spectrum.adobe.com/ | Full spec |
| 7 | GitHub Primer | https://primer.style/ | Full spec |
| 8 | Salesforce Lightning | https://www.lightningdesignsystem.com/ | Full spec |
| 9 | Microsoft Fluent 2 | https://fluent2.microsoft.design/ | Full spec |
| 10 | Atlassian Design | https://atlassian.design/ | Full spec |
| 11 | Ant Design | https://ant.design/ | Full spec |
| 12 | Apple HIG | https://developer.apple.com/design/human-interface-guidelines/ | Platform guide |

## Comparison Tables

### Spacing Systems

| System | Base Unit | Scale |
|--------|-----------|-------|
| Material | 4px | 4, 8, 12, 16, 24, 32, 40, 48 |
| Carbon | 8px (mini 2px) | 2, 4, 8, 12, 16, 24, 32, 48 |
| Polaris | 4px | 4, 8, 12, 16, 20, 24, 32 |
| Lightning | 4px (0.25rem) | 4, 8, 12, 16, 24, 32 |
| **Invela** | **4px** | **Align with Material/Polaris** |

### Color Systems

| System | Approach | Semantic Tokens |
|--------|----------|-----------------|
| Material | Tonal palettes | surface, on-surface, primary, etc. |
| Carbon | 10-step scales | $ui-01, $text-01, $interactive-01 |
| Polaris | Role-based | surface, text, interactive, critical |
| Lightning | Utility-first | $color-background-*, $color-text-* |

### Typography Scales

| System | Base Size | Scale Type |
|--------|-----------|------------|
| Material | 16px | Modular (1.2 ratio) |
| Carbon | 14px | Fixed scale |
| Polaris | 14px | Custom scale |
| Lightning | 13px | Fixed scale |
| **Invela** | **16px** | **Custom (align with Material)** |

## Usage Pattern

When making a design decision, query like:
> "How do Carbon, Material, and Polaris handle [component/pattern]?"

**Example Response Structure:**
```
## Button States Comparison

### Material Design 3
- Uses tonal variations
- Elevation changes on hover
- Ripple effect on click

### IBM Carbon
- Color shift on hover
- Border change on focus
- No ripple (too playful for enterprise)

### Shopify Polaris
- Background color change
- Consistent border treatment
- Focus ring always visible

### Recommendation for Invela
Based on enterprise context (like Carbon) but with Radix primitives...
```

## See Also
- `patterns/` - Detailed component patterns
- `tokens/` - Token comparison tables
