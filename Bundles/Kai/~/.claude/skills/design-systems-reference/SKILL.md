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

## Audit Mode

When benchmarking a codebase against industry design system standards, use this structured methodology.

### Required Sections

Audit these 10 dimensions, comparing against the 8 reference systems above:

1. **Token Architecture** — tier count (flat vs. primitive/semantic/component), format (CSS/JSON/SCSS), pipeline (style-dictionary, manual)
2. **Token Coverage** — % of values using tokens vs. raw px/hex; count raw values in stylesheets
3. **Spacing System** — base unit, scale size, consistency with Material/Carbon/Polaris scales
4. **Color System** — palette size, semantic aliases, dark mode support, theming capability
5. **Typography** — scale steps, role tokens (display/headline/body/label), fluid vs. static, weight tokens
6. **Component API** — variants, sizes, polymorphic (`as`), `forwardRef`, ARIA patterns, loading states
7. **Component Coverage** — primitives available vs. patterns used only in CSS/markup
8. **Accessibility** — touch targets, focus indicators, reduced motion, keyboard nav, ARIA landmarks
9. **Motion/Animation** — duration tokens, easing tokens, reduced motion override
10. **Consistency** — single source of truth? dual systems? CSS vs. JS token duplication?

### Scoring Scale

| Score | Meaning |
|-------|---------|
| 5 | Exceeds industry standard |
| 4 | Matches industry standard |
| 3 | Partial implementation |
| 2 | Significant gaps |
| 1 | Missing or broken |

### Audit Output Template

```markdown
## Design Systems Benchmark: [Project Name] vs. Industry Standards

### Scorecard

| Dimension | Score (1-5) | Industry Median | Gap | Notes |
|-----------|-------------|----------------|-----|-------|
| Token Architecture | X | 4 | ... | ... |
| Token Coverage | X | 4 | ... | ... |
| ... | ... | ... | ... | ... |

**Overall: X.X / 5.0**

### Critical Findings (Priority Order)
[Ranked by impact, with file:line references]

### Strengths
[What the project does better than or equal to reference systems]
```

### Severity Levels (match DesignAudit workflow)

| Level | Criteria | Example |
|-------|----------|---------|
| **Blocker** | Renders component library non-functional | Tailwind classes without Tailwind installed |
| **Critical** | Breaks token system or creates dual source of truth | CSS tokens + JS constants with same values |
| **Warning** | Deviates from industry norms without justification | Flat token layer, no semantic aliases |
| **Info** | Ahead of or equivalent to reference systems | Fluid `clamp()` typography |

## See Also
- `patterns/` - Detailed component patterns
- `tokens/` - Token comparison tables
