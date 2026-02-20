# Reusable SVG Components

Copy-paste SVG templates for common diagram elements.
Parent skill: `SKILL.md` in this directory.

---

## Service Node

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
    • Feature A  • Feature B
  </text>
</g>
```

---

## Database Node

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

---

## External System Node

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

---

## System Boundary Region

```xml
<g id="[boundary-id]">
  <rect x="X" y="Y" width="W" height="H" fill="[accent-light]" stroke="[accent]" stroke-width="2" stroke-dasharray="4,4" rx="6"/>
  <text x="X+20" y="Y+25" font-family="[heading-font]" font-size="12" font-weight="500" fill="[accent]">
    System Name
  </text>
</g>
```

---

## Status Badges

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

## Connector Definitions

Define once in `<defs>`, reuse everywhere.

### Arrow Marker

```xml
<defs>
  <marker id="arrow" markerWidth="10" markerHeight="10" refX="9" refY="3" orient="auto" markerUnits="strokeWidth">
    <path d="M0,0 L0,6 L9,3 z" fill="[accent]"/>
  </marker>
</defs>
```

### Solid Line (synchronous, direct)

```xml
<line x1="..." y1="..." x2="..." y2="..." stroke="[accent]" stroke-width="2" marker-end="url(#arrow)"/>
```

### Dashed Line (async, optional, event-driven)

```xml
<line x1="..." y1="..." x2="..." y2="..." stroke="[accent-dark]" stroke-width="2" stroke-dasharray="2,2" marker-end="url(#arrow)"/>
```

Line width: **2px** primary flows, **1px** secondary/supporting.
