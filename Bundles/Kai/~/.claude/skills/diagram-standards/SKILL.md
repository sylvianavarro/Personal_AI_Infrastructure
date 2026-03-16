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
- Creating quick ASCII diagrams in code comments (no framework needed)
- Using Mermaid in markdown (different syntax, but reference the accessibility rules here)
- Creating throwaway whiteboard sketches

## Color Token System

### Resolving Colors

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

For diagrams that need more than the base palette, derive shades:

- **Accent light** (region fills): accent at 10% opacity, or lighten accent by 80%
- **Accent dark** (hover/secondary emphasis): darken accent by 15%
- **Async/event flows**: use `palette.warning` color for async arrows

### Rule

**Never hardcode hex values in final diagrams.** Always reference manifest tokens. If no manifest exists, use the fallback column above and document that defaults are in use.

---

## Typography in SVG

### Font Stacks

Resolve from manifest, fall back to web-safe:

| Role | Manifest Key | Fallback Stack |
|------|-------------|---------------|
| Labels, titles | `typography.families.heading` | `"Inter", "Segoe UI", sans-serif` |
| Body text | `typography.families.body` | `"Inter", "Segoe UI", sans-serif` |
| Code, IDs | `typography.families.mono` | `"JetBrains Mono", "Fira Code", "Courier New", monospace` |

### Text Sizes

| Role | Size | Weight | Color Role |
|------|------|--------|------------|
| Diagram title | 18px (L2/L3) or 16px (L1) | 600 | Primary text |
| Node title | 13px | 600 | Primary text (or white on colored headers) |
| Body/label | 12-14px | 400 | Primary text |
| Metadata/small | 10-12px | 400 | Secondary text |
| Technical ID | 11px | 500 | Primary text, mono font |

### Rules

- Minimum readable size: **10px** (metadata only). Prefer 12px+.
- Never use ALL CAPS for emphasis. Use bold (weight 600).
- Technical identifiers (service IDs, API endpoints, code) always use the mono font stack.

---

## Diagram Types

### Architecture Diagram

**Purpose:** System components, relationships, and data flow.
**Best for:** Platform overview, microservices, system topology.
**Typical size:** 1200 x 800

**Structure:**
```
+--------------------------------------------------+
|  Title                                            |
|  +----------------------------------------------+ |
|  | System Boundary (dashed, region fill)         | |
|  |  [Service A]-->[Service B]-->[Service C]      | |
|  |       |              |                        | |
|  |       v              v                        | |
|  |  [Database]     [Cache]                       | |
|  +----------------------------------------------+ |
|  +----------------------------------------------+ |
|  | External Integrations (muted fill)            | |
|  |  [Email]    [Storage]    [Auth Provider]      | |
|  +----------------------------------------------+ |
|  Legend: -- sync  - - async                       |
+--------------------------------------------------+
```

**Key conventions:**
- System boundary: dashed border, region fill, labeled
- Service nodes: white fill, accent border, colored header bar
- Database nodes: accent-dark border, horizontal line under title
- External systems: secondary border (thinner: 1px vs 2px)
- Solid lines = synchronous; dashed lines = async/event-driven

---

### Flow / Process Diagram

**Purpose:** Step-by-step workflows, decision trees, user journeys.
**Best for:** Onboarding flows, approval workflows, setup procedures.
**Typical size:** 1000 x 700

**Structure:**
```
(START) --> [Step 1] --> [Step 2] --> <Decision?>
                                       /       \
                                    Yes         No
                                     |           |
                                 [Step 3a]  [Step 3b]
                                     \         /
                                      v       v
                                    [Step 4] --> (END)
```

**Key conventions:**
- Start/End: circles with accent fill, white text
- Process steps: rectangles with accent border
- Decision points: diamonds with accent-light fill
- Yes/No labels on decision branches
- Warning-colored borders for steps requiring attention/approval
- Success-colored borders for completion states

---

### Data Flow / Integration Diagram

**Purpose:** Data movement between systems, event flows, message queues.
**Best for:** Pipeline docs, integration architecture, API data contracts.
**Typical size:** 1100 x 700

**Structure:**
```
[Source] --event:--> [Queue] --async--> [Processor]
                                            |
                                        sync v
                                       [Database] --> [Cache] --> [API] --> [Client]
```

**Key conventions:**
- Sync arrows: accent color, solid
- Async arrows: warning color, solid (distinct from sync)
- Event labels above async arrows (e.g., `event:report.requested`)
- Queue nodes: warning-colored fill with horizontal lines suggesting stacked messages
- Status badge section showing data states (processing, available, cached)

---

### Sequence Diagram

**Purpose:** Interactions between systems over time.
**Best for:** API interactions, auth flows, multi-step transactions.
**Typical size:** 1000 x 700

**Structure:**
```
[Client]          [API Gateway]       [Auth Service]
    |                    |                    |
    |--- POST /login --->|                    |
    |                    |-- validate() ----->|
    |                    |                    |
    |                    |<-- token + user ---|
    |<-- 200 OK + JWT --|                    |
    |                    |                    |
```

**Key conventions:**
- Actor boxes: accent border at top, dashed lifeline below
- Request arrows: solid, accent color, left-to-right
- Response arrows: dashed, accent-dark color, right-to-left
- Activation boxes: accent-light fill on lifeline during processing
- Notes: warning-colored background for callouts
- Labels in mono font for API calls and method names

---

### Dashboard / Wireframe Diagram

**Purpose:** Dashboard layouts, widget structures, UI component documentation.
**Best for:** UI specs, analytics views, monitoring dashboards.
**Typical size:** 1100 x 800

**Structure:**
```
+----------+------------------------------------------+
| Sidebar  |  Header (user info, navigation)          |
|  Nav     |------------------------------------------|
|  items   |  [Metric 1]  [Metric 2]  [Metric 3]     |
|          |------------------------------------------|
|          |  [Chart: Growth]     [Chart: Breakdown]  |
|          |------------------------------------------|
|          |  [Table: Recent Activity]                |
+----------+------------------------------------------+
```

**Key conventions:**
- Sidebar: dark primary background, accent highlight on active item
- Metric cards: white fill, large number in accent color, trend indicator
- Trend up: success color. Trend down: warning or error color.
- Charts: accent color for primary series, accent-light for secondary
- Tables: muted header row, alternating subtle backgrounds

---

## SVG Construction Rules

### Dimensions and ViewBox

| Documentation Tier | Size | Aspect |
|-------------------|------|--------|
| L1 (client-facing) | 1000 x 700 | ~16:11 |
| L2 (internal docs) | 1100 x 750 | ~16:11 |
| L3 (technical deep-dives) | 1200 x 800 | 3:2 |

Always use `viewBox="0 0 [width] [height]"` for responsive scaling.
Always include a white background rect.

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

**Solid lines** — synchronous, direct:
```xml
<line x1="..." y1="..." x2="..." y2="..." stroke="[accent]" stroke-width="2" marker-end="url(#arrow)"/>
```

**Dashed lines** — async, optional, event-driven:
```xml
<line x1="..." y1="..." x2="..." y2="..." stroke="[accent-dark]" stroke-width="2" stroke-dasharray="2,2" marker-end="url(#arrow)"/>
```

**Arrow markers** — define once in `<defs>`, reuse everywhere:
```xml
<defs>
  <marker id="arrow" markerWidth="10" markerHeight="10" refX="9" refY="3" orient="auto" markerUnits="strokeWidth">
    <path d="M0,0 L0,6 L9,3 z" fill="[accent]"/>
  </marker>
</defs>
```

Line width: **2px** primary flows, **1px** secondary/supporting.

---

## Reusable SVG Components

### Service Node

```xml
<g id="[service-id]" class="service-node">
  <!-- Container -->
  <rect x="X" y="Y" width="180" height="100" fill="[background]" stroke="[accent]" stroke-width="2" rx="4"/>
  <!-- Header bar -->
  <rect x="X" y="Y" width="180" height="28" fill="[accent]" rx="4"/>
  <!-- Title (white on accent) -->
  <text x="CENTER" y="Y+20" font-family="[heading-font]" font-size="13" font-weight="600" fill="[background]" text-anchor="middle">
    Service Name
  </text>
  <!-- Technical ID -->
  <text x="CENTER" y="Y+45" font-family="[mono-font]" font-size="11" fill="[foreground]" text-anchor="middle">
    service-id
  </text>
  <!-- Features -->
  <text x="X+10" y="Y+70" font-family="[body-font]" font-size="11" fill="[foreground]">
    * Feature A  * Feature B
  </text>
</g>
```

### Database Node

```xml
<g id="[db-id]" class="database-node">
  <rect x="X" y="Y" width="140" height="80" fill="[background]" stroke="[accent-dark]" stroke-width="2" rx="4"/>
  <!-- Cylinder top line -->
  <path d="M X Y+15 L X+140 Y+15" stroke="[accent-dark]" stroke-width="2"/>
  <text x="CENTER" y="Y+30" font-family="[heading-font]" font-size="12" font-weight="600" fill="[foreground]" text-anchor="middle">
    Database Name
  </text>
  <text x="CENTER" y="Y+50" font-family="[mono-font]" font-size="10" fill="[secondary]" text-anchor="middle">
    PostgreSQL
  </text>
</g>
```

### External System Node

```xml
<g id="[ext-id]" class="external-node">
  <rect x="X" y="Y" width="140" height="80" fill="[background]" stroke="[secondary]" stroke-width="1" rx="3"/>
  <text x="CENTER" y="Y+25" font-family="[heading-font]" font-size="12" font-weight="600" fill="[foreground]" text-anchor="middle">
    External Service
  </text>
  <text x="CENTER" y="Y+45" font-family="[mono-font]" font-size="10" fill="[secondary]" text-anchor="middle">
    provider-name
  </text>
  <text x="CENTER" y="Y+65" font-family="[body-font]" font-size="10" fill="[secondary]" text-anchor="middle">
    (External)
  </text>
</g>
```

### System Boundary Region

```xml
<g id="[boundary-id]">
  <rect x="X" y="Y" width="W" height="H" fill="[accent-light]" stroke="[accent]" stroke-width="2" stroke-dasharray="4,4" rx="6"/>
  <text x="X+20" y="Y+25" font-family="[heading-font]" font-size="12" font-weight="500" fill="[accent]">
    System Name
  </text>
</g>
```

### Status Badges

```xml
<!-- Success -->
<g class="status-badge">
  <rect x="X" y="Y" width="120" height="35" fill="#d1fae5" stroke="[success]" stroke-width="1" rx="3"/>
  <circle cx="X+12" cy="Y+17" r="5" fill="[success]"/>
  <text x="X+25" y="Y+22" font-family="[body-font]" font-size="11" font-weight="500" fill="[foreground]">Complete</text>
</g>

<!-- Warning -->
<g class="status-badge">
  <rect x="X" y="Y" width="120" height="35" fill="#fef3c7" stroke="[warning]" stroke-width="1" rx="3"/>
  <circle cx="X+12" cy="Y+17" r="5" fill="[warning]"/>
  <text x="X+25" y="Y+22" font-family="[body-font]" font-size="11" font-weight="500" fill="[foreground]">In Progress</text>
</g>

<!-- Error -->
<g class="status-badge">
  <rect x="X" y="Y" width="120" height="35" fill="#fee2e2" stroke="[error]" stroke-width="1" rx="3"/>
  <circle cx="X+12" cy="Y+17" r="5" fill="[error]"/>
  <text x="X+25" y="Y+22" font-family="[body-font]" font-size="11" font-weight="500" fill="[foreground]">Failed</text>
</g>
```

---

## Accessibility Requirements

Every SVG diagram MUST meet these standards:

### 1. Text Alternatives

```xml
<svg viewBox="0 0 1200 800" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="[Brief description]">
  <title>[Diagram Title]</title>
  <desc>[Detailed description of what the diagram shows, for screen readers]</desc>
  <!-- diagram content -->
</svg>
```

Additionally, include a **text description** in the parent document:

```markdown
**Diagram Description:** [Full prose description of the diagram's content,
relationships, and key takeaways — sufficient for someone who cannot see it.]
```

### 2. Color Contrast

- Text on dark backgrounds: **7:1** contrast ratio minimum (WCAG AAA)
- Text on light backgrounds: **4.5:1** contrast ratio minimum (WCAG AA)
- **Never rely on color alone** to convey meaning — always pair with labels, patterns, or icons

### 3. Minimum Sizes

- Minimum text: 10px (metadata only)
- Standard body text: 12-14px
- Headings: 16-18px
- Minimum line thickness: 1px (secondary), 2px (primary)

### 4. Semantic Structure

- Use `<g>` elements with descriptive `id` attributes to group related components
- Use `class` attributes for component types (e.g., `class="service-node"`)
- Use `<defs>` for reusable markers, not inline duplication

---

## Embedding in Documentation

### Markdown (file reference)

```markdown
## Architecture Overview

The diagram below shows how platform services interact:

![Architecture Diagram](./diagrams/architecture-overview.svg)

*Figure 1: Platform Service Architecture*

**Diagram Description:** The platform architecture shows three core services...
```

### HTML (accessible)

```html
<figure aria-labelledby="fig-arch">
  <img src="./diagrams/architecture-overview.svg"
       alt="[Concise alt text describing the diagram]"
       title="[Diagram title]" />
  <figcaption id="fig-arch">
    <strong>Figure 1:</strong> [Caption with key context.]
  </figcaption>
</figure>
```

### Inline SVG (interactive)

```html
<div class="diagram-container">
  <svg viewBox="0 0 1200 800" role="img" aria-label="[Description]">
    <!-- SVG content -->
  </svg>
</div>
```

### Why SVG over raster

- **Searchable** — text stays text, indexable
- **Scalable** — no pixelation at any zoom
- **Accessible** — supports `<title>`, `<desc>`, ARIA
- **Maintainable** — update labels without redrawing
- **Efficient** — smaller than equivalent PNG/JPG
- **Version-controllable** — meaningful git diffs

---

## Finalization Checklist

### Content Accuracy
- [ ] All component names match current system state
- [ ] Technical identifiers (endpoints, service names) are current
- [ ] Data flows accurately represent system interactions
- [ ] No references to deprecated systems

### Visual Quality
- [ ] All text legible at 100% zoom and when scaled down
- [ ] Colors come from manifest (no hardcoded off-brand values)
- [ ] Spacing and alignment are uniform
- [ ] No overlapping text or cramped layouts
- [ ] Adequate white space

### Accessibility
- [ ] SVG has `role="img"`, `aria-label`, `<title>`, and `<desc>`
- [ ] Text description in parent document
- [ ] Color contrast meets WCAG AA minimum
- [ ] Color is not sole means of conveying information
- [ ] Mono font used for technical identifiers
- [ ] Font sizes >= 10px

### Structure
- [ ] Valid SVG syntax (test in browser)
- [ ] `<defs>` used for reusable markers
- [ ] IDs are semantic and descriptive
- [ ] `viewBox` set for responsive scaling
- [ ] White background rect included

### File Management
- [ ] Descriptive filename (e.g., `service-architecture-overview.svg`)
- [ ] Placed in `docs/diagrams/` or project's diagram directory
- [ ] Figure number and caption in parent document
- [ ] Legend included if using special symbols or line styles

---

## Common Mistakes

### Hardcoded colors
**Symptom:** Colors drift between diagrams; off-brand hex values everywhere.
**Fix:** Always resolve from manifest. If no manifest exists, use the fallback table and document it.

### Raster diagrams
**Symptom:** PNG screenshot of a Lucidchart/Visio that can't be updated or searched.
**Fix:** Use SVG. Always. If you must screenshot, it's temporary — rebuild in SVG for the final version.

### No accessibility
**Symptom:** SVG has no `<title>`, no `<desc>`, no alt text in parent doc.
**Fix:** Every diagram needs all three: SVG `<title>` + `<desc>`, plus a prose description in the parent document.

### Color as sole information carrier
**Symptom:** "The green nodes are healthy, the red nodes are down" with no labels.
**Fix:** Always pair color with text labels, icons, or patterns. Someone viewing in grayscale or using a screen reader must still understand the diagram.

### Inconsistent node styles
**Symptom:** Service A uses one visual style, Service B uses a different one, database nodes look like service nodes.
**Fix:** Use the reusable components from this skill. Same component type = same visual treatment.

### Missing legend
**Symptom:** Reader has to guess what solid vs. dashed lines mean.
**Fix:** Include a legend whenever the diagram uses multiple line styles, colors for different meanings, or non-obvious symbols.
