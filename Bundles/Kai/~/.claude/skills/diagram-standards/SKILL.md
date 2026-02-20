---
name: diagram-standards
description: Use when creating SVG diagrams for documentation — architecture diagrams, flow charts, data flow diagrams, sequence diagrams, or dashboard wireframes — ensures accessible, brand-consistent, version-controllable diagrams
---

# Diagram Standards

## Overview

SVG diagrams are first-class documentation artifacts — version-controllable, accessible, searchable, and scalable. This skill standardizes how to create them across all documentation tiers, ensuring visual consistency through the project's brand manifest rather than hardcoded colors.

**Announce at start:** "I'm using the diagram-standards skill for this diagram."

**REQUIRED:** If the project has a brand manifest (`manifest.json`), load it first via the AssetManagement skill. All colors and typography MUST come from the manifest. The defaults in this skill are fallbacks only.

## When to Use

- Creating any SVG diagram for documentation (L1 through L3)
- Illustrating system architecture, data flows, or process workflows
- Building sequence diagrams for API interactions
- Wireframing dashboard layouts
- Reviewing existing diagrams for accessibility or brand compliance

**Don't use when:**
- Creating quick ASCII diagrams in code comments
- Using Mermaid in markdown (reference accessibility rules only)
- Creating throwaway whiteboard sketches

## Color Token System

Colors come from the brand manifest. Map manifest keys to diagram roles:

| Diagram Role | Manifest Key | Fallback | Usage |
|-------------|-------------|----------|-------|
| Primary accent | `palette.accent` | `#3B82F6` | Key flows, active states, primary highlights |
| Primary text | `palette.foreground` | `#111827` | Labels, headings, emphasis |
| Secondary text | `palette.secondary` | `#6B7280` | Metadata, descriptions, muted labels |
| Node fill | `palette.background` | `#FFFFFF` | Node backgrounds, text regions |
| Region fill | `palette.muted` | `#F3F4F6` | Subtle backgrounds, system boundaries |
| Borders/dividers | `palette.secondary` | `#6B7280` | External system borders, separators |
| Success | `palette.success` | `#16A34A` | Complete, healthy, operational |
| Warning | `palette.warning` | `#CA8A04` | In-progress, attention needed |
| Error | `palette.error` | `#DC2626` | Failed, critical, blocked |

### Derived Colors

- **Accent light** (region fills): accent at 10% opacity, or lighten by 80%
- **Accent dark** (secondary emphasis): darken accent by 15%
- **Async/event flows**: use `palette.warning` for async arrows

**Never hardcode hex values in final diagrams.** Always reference manifest tokens. If no manifest exists, use the fallback column and document that defaults are in use.

---

## Typography in SVG

| Role | Manifest Key | Fallback Stack |
|------|-------------|---------------|
| Labels, titles | `typography.families.heading` | `"Inter", "Segoe UI", sans-serif` |
| Body text | `typography.families.body` | `"Inter", "Segoe UI", sans-serif` |
| Code, IDs | `typography.families.mono` | `"JetBrains Mono", "Fira Code", "Courier New", monospace` |

| Role | Size | Weight | Color Role |
|------|------|--------|------------|
| Diagram title | 18px (L2/L3) or 16px (L1) | 600 | Primary text |
| Node title | 13px | 600 | Primary text (or white on colored headers) |
| Body/label | 12-14px | 400 | Primary text |
| Metadata/small | 10-12px | 400 | Secondary text |
| Technical ID | 11px | 500 | Primary text, mono font |

- Minimum readable size: **10px** (metadata only). Prefer 12px+.
- Never use ALL CAPS for emphasis. Use bold (weight 600).
- Technical identifiers always use the mono font stack.

---

## Diagram Types

See `diagram-types.md` in this directory for type-specific structure examples and conventions.

Five supported types:

| Type | Purpose | Typical Size |
|------|---------|-------------|
| Architecture | System components, relationships, topology | 1200 x 800 |
| Flow / Process | Workflows, decision trees, user journeys | 1000 x 700 |
| Data Flow | Data movement, event flows, message queues | 1100 x 700 |
| Sequence | System interactions over time, API flows | 1000 x 700 |
| Dashboard / Wireframe | Layouts, widget structures, UI specs | 1100 x 800 |

---

## SVG Construction Rules

### Dimensions and ViewBox

| Documentation Tier | Size | Aspect |
|-------------------|------|--------|
| L1 (client-facing) | 1000 x 700 | ~16:11 |
| L2 (internal docs) | 1100 x 750 | ~16:11 |
| L3 (technical deep-dives) | 1200 x 800 | 3:2 |

- Always use `viewBox="0 0 [width] [height]"` for responsive scaling
- Always include a white background rect

### Node Sizing

| Element | Width | Height | Border Radius |
|---------|-------|--------|--------------|
| Service node | 160-200px | 80-120px | 4px |
| Database node | 140px | 80px | 4px |
| External system | 140px | 80px | 3px |
| Container/region | 250px+ | 150px+ | 6-8px |
| Badge/icon | 20-40px | 20-40px | 3px |

### Spacing

- Between adjacent nodes: 20-40px
- Column gaps: 100-120px
- Row gaps: 80-120px
- Within groups: 20-30px

### Connectors

- Solid lines = synchronous, direct (accent color, 2px)
- Dashed lines = async, optional, event-driven (accent-dark, 2px, `stroke-dasharray="2,2"`)
- Define arrow markers once in `<defs>`, reuse via `marker-end="url(#arrow)"`
- Line width: **2px** primary flows, **1px** secondary/supporting

---

## Reusable SVG Components

See `svg-components.md` in this directory for copy-paste SVG templates.

Available components: Service Node, Database Node, External System Node, System Boundary Region, Status Badges (success/warning/error), Connector definitions (arrow marker, solid line, dashed line).

---

## Accessibility Requirements

Every SVG diagram MUST meet these standards:

### Text Alternatives
- SVG root: `role="img"`, `aria-label="[brief description]"`
- Include `<title>` and `<desc>` elements inside the SVG
- Include a prose **Diagram Description** in the parent document

### Color Contrast
- Text on dark backgrounds: **7:1** minimum (WCAG AAA)
- Text on light backgrounds: **4.5:1** minimum (WCAG AA)
- Never rely on color alone — always pair with labels, patterns, or icons

### Minimum Sizes
- Minimum text: 10px (metadata only), prefer 12px+
- Headings: 16-18px
- Minimum line thickness: 1px (secondary), 2px (primary)

### Semantic Structure
- Use `<g>` with descriptive `id` attributes for grouping
- Use `class` attributes for component types (e.g., `class="service-node"`)
- Use `<defs>` for reusable markers, not inline duplication

---

## Embedding in Documentation

### Markdown
```markdown
![Architecture Diagram](./diagrams/architecture-overview.svg)
*Figure 1: Platform Service Architecture*
**Diagram Description:** The platform architecture shows...
```

### HTML (accessible)
```html
<figure aria-labelledby="fig-arch">
  <img src="./diagrams/architecture-overview.svg"
       alt="[Concise alt text]" title="[Diagram title]" />
  <figcaption id="fig-arch"><strong>Figure 1:</strong> [Caption]</figcaption>
</figure>
```

### Inline SVG
```html
<div class="diagram-container">
  <svg viewBox="0 0 1200 800" role="img" aria-label="[Description]">
    <!-- SVG content -->
  </svg>
</div>
```

### Why SVG over raster
- Searchable, scalable, accessible (`<title>`, `<desc>`, ARIA)
- Maintainable (update labels without redrawing), efficient, version-controllable

---

## Finalization Checklist

### Content Accuracy
- [ ] Component names match current system state
- [ ] Technical identifiers are current
- [ ] Data flows accurately represent interactions
- [ ] No references to deprecated systems

### Visual Quality
- [ ] All text legible at 100% zoom and scaled down
- [ ] Colors from manifest (no hardcoded off-brand values)
- [ ] Uniform spacing and alignment, no overlapping text
- [ ] Adequate white space

### Accessibility
- [ ] `role="img"`, `aria-label`, `<title>`, `<desc>` present
- [ ] Text description in parent document
- [ ] Color contrast meets WCAG AA minimum
- [ ] Color not sole means of conveying information
- [ ] Mono font for technical identifiers
- [ ] Font sizes >= 10px

### Structure
- [ ] Valid SVG syntax (test in browser)
- [ ] `<defs>` for reusable markers
- [ ] Semantic, descriptive IDs
- [ ] `viewBox` set for responsive scaling
- [ ] White background rect included

### File Management
- [ ] Descriptive filename (e.g., `service-architecture-overview.svg`)
- [ ] Placed in `docs/diagrams/` or project's diagram directory
- [ ] Figure number and caption in parent document
- [ ] Legend included if using special symbols or line styles

---

## Common Mistakes

- **Hardcoded colors** — Always resolve from manifest. Document when using fallbacks.
- **Raster diagrams** — Use SVG. Always. Screenshots are temporary only.
- **No accessibility** — Every diagram needs SVG `<title>` + `<desc>` + prose description in parent doc.
- **Color as sole info carrier** — Always pair color with text labels, icons, or patterns.
- **Inconsistent node styles** — Use the reusable components. Same type = same visual treatment.
- **Missing legend** — Include whenever using multiple line styles, colors, or non-obvious symbols.
