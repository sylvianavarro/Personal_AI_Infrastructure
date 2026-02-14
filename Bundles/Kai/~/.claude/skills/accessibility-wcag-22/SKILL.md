---
name: accessibility-wcag-22
description: Use when checking accessibility, validating contrast, focus states, touch targets, or any WCAG compliance. Context-aware - surfaces relevant criteria based on element type (icons, text, buttons, forms, etc.).
---

# WCAG 2.2 Accessibility Expert

Complete WCAG 2.2 AA/AAA reference with contextual intelligence.

## How This Skill Works

When invoked, I analyze the **element type** you're working with and surface only the relevant WCAG criteria:

| Element Type | Relevant Criteria |
|--------------|-------------------|
| Text/Typography | 1.4.3, 1.4.4, 1.4.12 |
| Icons | 1.4.11, 2.5.8, 1.1.1 |
| Buttons/Links | 2.4.7, 2.5.8, 1.4.11, 2.4.4 |
| Forms | 1.3.5, 3.3.1-3.3.4, 2.4.6 |
| Colors | 1.4.1, 1.4.3, 1.4.11 |
| Focus States | 2.4.7, 2.4.11, 2.4.13 |
| Tables | 1.3.1, 1.3.2 |
| Images | 1.1.1, 1.4.5 |
| Motion | 2.2.2, 2.3.1, 2.3.3 |

## Quick Checks (AA Required)

### Contrast Ratios
```
Normal text (<18pt): 4.5:1 minimum
Large text (18pt+ or 14pt bold): 3:1 minimum
UI components & graphics: 3:1 minimum
```

### Target Sizes (NEW in 2.2)
```
Minimum: 24x24 CSS pixels (SC 2.5.8)
Recommended: 44x44 CSS pixels
Inline links: Exempt if within text
```

### Focus Indicators (Enhanced in 2.2)
```
Must be visible (SC 2.4.7)
Not obscured by other content (SC 2.4.11)
AAA: 2px outline, 3:1 contrast (SC 2.4.13)
```

## Authoritative Sources

| # | Source | URL | Use For |
|---|--------|-----|---------|
| 1 | W3C WCAG 2.2 | https://www.w3.org/TR/WCAG22/ | Official spec |
| 2 | W3C WAI Overview | https://www.w3.org/WAI/standards-guidelines/wcag/ | Guidelines |
| 3 | What's New in 2.2 | https://www.w3.org/WAI/standards-guidelines/wcag/new-in-22/ | 9 new criteria |
| 4 | WebAIM Contrast | https://webaim.org/resources/contrastchecker/ | Contrast testing |
| 5 | WebAIM Articles | https://webaim.org/articles/contrast/ | Understanding |
| 6 | Deque University | https://dequeuniversity.com/resources/ | Code examples |
| 7 | Deque axe-core | https://github.com/dequelabs/axe-core | Automated testing |
| 8 | A11Y Project | https://www.a11yproject.com/checklist/ | Practical checklist |
| 9 | MDN Accessibility | https://developer.mozilla.org/en-US/docs/Web/Accessibility | Developer ref |
| 10 | Inclusive Components | https://inclusive-components.design/ | Pattern library |
| 11 | Apple HIG A11y | https://developer.apple.com/design/human-interface-guidelines/accessibility | Platform guidance |
| 12 | Material A11y | https://m3.material.io/foundations/accessible-design/overview | DS approach |

## Usage

When working on any UI element, invoke this skill to get relevant WCAG criteria.

**Example query:** "Check accessibility for a button"
**Response:** Surfaces SC 2.4.7 (focus visible), SC 2.5.8 (target size 24x24), SC 1.4.11 (3:1 contrast for the button), SC 2.4.4 (link/button purpose)

See supporting files for detailed criteria:
- `criteria-reference.md` - All WCAG 2.2 success criteria
- `element-checklists.md` - Per-element checklists
