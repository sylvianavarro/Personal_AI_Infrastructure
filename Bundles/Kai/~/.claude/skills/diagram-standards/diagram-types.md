# Diagram Types Reference

Type-specific structure examples and conventions for SVG diagrams.
Parent skill: `SKILL.md` in this directory.

---

## Architecture Diagram

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
|  Legend: ── sync  - - async                       |
+--------------------------------------------------+
```

**Key conventions:**
- System boundary: dashed border, region fill, labeled
- Service nodes: white fill, accent border, colored header bar
- Database nodes: accent-dark border, horizontal line under title
- External systems: secondary border (thinner: 1px vs 2px)
- Solid lines = synchronous; dashed lines = async/event-driven

---

## Flow / Process Diagram

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

## Data Flow / Integration Diagram

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

## Sequence Diagram

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

## Dashboard / Wireframe Diagram

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

## Roadmap Diagram

**Purpose:** Phased delivery plans, timelines, milestones for strategic communication.
**Best for:** Board updates, client delivery timelines, release planning.
**Typical size:** 1200 x 600

**Structures:**

| Format | When to Use |
|--------|------------|
| Timeline (horizontal) | Fixed dates, quarterly cadence |
| Swimlane | Multiple workstreams in parallel |
| Now / Next / Later | Uncertain dates, priority-based |
| Milestone | Key deliverables, exec audiences |

**Structure (Timeline):**
```
Phase 1 (Q1)         Phase 2 (Q2)         Phase 3 (Q3)
|=================|  |=================|  |=================|
| [Milestone A]   |  | [Milestone C]   |  | [Milestone E]   |
| [Milestone B]   |  | [Milestone D]   |  |                 |
|=================|  |=================|  |=================|
```

**Key conventions:**
- Phase blocks: accent-light fill, accent border
- Current phase: accent fill (full), white text
- Future phases: region fill, secondary border
- Milestones: circles on timeline — filled = complete, outline = upcoming
- Dependency arrows between milestones: dashed, accent-dark
- Keep text high-level — outcomes, not tasks

---

## 2x2 Matrix Diagram

**Purpose:** Strategic positioning, prioritization frameworks, tradeoff visualization.
**Best for:** Exec strategy sessions, prioritization decisions, competitive positioning.
**Typical size:** 900 x 900

**Common matrices:**

| Matrix | X-Axis | Y-Axis |
|--------|--------|--------|
| Eisenhower | Urgency | Importance |
| Risk | Likelihood | Impact |
| Effort/Impact | Effort | Impact |
| BCG | Market share | Growth rate |

**Structure:**
```
              High [Y-Axis Label]
                |
   [Quadrant 2] | [Quadrant 1]
   "Label"      | "Label"
                |
  --------------|----------------
                |
   [Quadrant 3] | [Quadrant 4]
   "Label"      | "Label"
                |
              Low
   Low          |          High
           [X-Axis Label]
```

**Key conventions:**
- Quadrant fills: distinct but low-contrast (accent-light, success-light, warning-light, error-light at 10% opacity)
- Axis labels: primary text, 14px, bold, centered on axis
- Quadrant labels: secondary text, 12px, top-left of each quadrant
- Items positioned as circles or rounded rects within quadrants
- Item size can encode a third dimension (e.g., revenue, team size)
- Top-right quadrant (high/high) typically highlighted with accent border
- Keep to 3-7 items per quadrant — more becomes unreadable
