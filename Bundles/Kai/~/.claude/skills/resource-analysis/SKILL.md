---
name: resource-analysis
description: >
  Analyze team time and resource allocation data to produce strategic recommendations.
  Use when reviewing non-billable time reports, analyzing resource utilization, creating
  reallocation plans, or preparing PMO strategic analysis from Productive/Harvest exports.
  Trigger phrases: "analyze time data", "resource analysis", "non-billable time", "time allocation",
  "resource utilization", "team capacity analysis", "strategic resource review".
  Do NOT use for project health status (use status skill), individual performance reviews,
  or billing/invoicing.
---

# Resource Analysis

Analyze team time/resource data and produce strategic recommendations for PMO leadership.

## When to Use

- Reviewing weekly/monthly non-billable time reports
- Analyzing resource allocation across teams
- Preparing strategic reallocation recommendations
- PMO leadership resource reviews
- Capacity planning and utilization analysis

---

## Process

### Step 1: Data Processing

**Accept:** Excel/CSV exports from Productive, Harvest, or similar tools.

**Data structure expected:**
- Person Name
- Date (blank for summary rows)
- Project
- Worked Time
- Billable Time
- Service Category
- Notes/Description

**CRITICAL RULES:**
- Use **summary rows** for total hours (rows with name, blank date, total hours)
- Use **detail rows** (with dates) for categorization
- **Always reconcile** detail categorization against summary totals
- **Verify totals first** — display employee totals and company total for confirmation before proceeding

### Step 2: Categorize by Project Name First

Categorize based on **actual PROJECT NAME**, then service category as secondary verification.

**NEVER assume activities based on roles.** A VP might log time to an AI project. A developer might log operations time. Use the data.

| Category | Project Name Contains |
|----------|----------------------|
| AI/Innovation | "AI Task Force", "AI Research", "AI POD" |
| Research/L&D | "Research", "Learning", "L&D", "Tutorial" |
| Sales | "Servant Sales" (ONLY this exact project) |
| Operations | "Internal Operations", "Talent", "Dugout", "PMO", "Resource Management" |
| Leadership - Client Oversight | Service = "Leadership Support (Directors & VPs ONLY)" AND client project |
| Leadership - Internal | Service = "Leader Activities" AND "Internal Operations" |
| Meetings/Admin | Service = "Team Meetings", "General Admin", "Consulting Team Ops" AND internal |
| Client Work | Client names, SOW references — **EXCLUDE from non-billable analysis** |
| Other | Everything else |

### Step 3: Individual Analysis (Alphabetical Order)

For each employee:

```markdown
## [Employee Name]

**Total Hours:** [From summary row]

### Time Breakdown
| Category | Hours | % |
|----------|-------|---|
| [Category] | [X] | [X]% |
| **Total** | **[X]** | **100%** |

### Project Breakdown (for verification)
- [Project Name]: [Hours]

### Strategic Alignment Scores (1-5)
| Goal | Score | Rationale |
|------|-------|-----------|
| Innovation & AI | [1-5] | [Why] |
| Operational Excellence | [1-5] | [Why] |
| Client Growth | [1-5] | [Why] |
| Talent Development | [1-5] | [Why] |
| Market Leadership | [1-5] | [Why] |

### Top Accomplishments
1. [Extracted from description fields]
2. [Limit to 3-5 key items]

### Next Week Action Plan
- **Start:** [One specific new initiative]
- **Stop/Reduce:** [One activity to minimize]
- **Leverage:** [One way to help others or advance strategic goals]
```

### Step 4: Company-Level Strategic Analysis

```markdown
## Strategic Analysis

### Resource Allocation Summary
| Category | Total Hours | % | Target % | Delta |
|----------|-------------|---|----------|-------|
| AI/Innovation | [X] | [X]% | [X]% | [+/-X]% |

### Reallocation Recommendations
Be specific: "Reduce [category] by [X] hours, increase [category] by [Y] hours"

### Efficiency Recommendations
Format: "[Name]: implement [tool/process] to save [X] hours/week"

### ROI Ranking
**Tier 1 (0-30 days):** High-impact, low-cost
- [Specific action with expected return]

**Tier 2 (1-3 months):** Medium investment, proven ROI
- [Specific action with expected return]

**Tier 3 (3-6 months):** Strategic, transformational
- [Specific action with expected return]

### Skill Development Priorities
| Person | Training | Timeline | Expected Impact |
|--------|----------|----------|-----------------|
| [Name] | [Program] | [Date] | [What improves] |
```

### Step 5: Quality Assurance

Before finalizing, verify:
- [ ] All employee totals match summary rows in source data
- [ ] Company total hours are accurate
- [ ] Category percentages add to 100% for each employee
- [ ] All recommendations include specific names, actions, timelines
- [ ] ROI calculations include dollar estimates where possible
- [ ] Client work hours noted but excluded from strategic analysis
- [ ] Missing expected employees flagged in executive summary
- [ ] Data inconsistencies between roles and actual projects are flagged

---

## Output Format

1. **Executive Summary** — total hours, key findings, missing personnel
2. **Individual Analysis** — alphabetical, full template per person
3. **Company Strategic Analysis** — allocation, recommendations, ROI
4. **Success Metrics** — KPIs for tracking progress

## Tone

- Professional but actionable
- Specific rather than generic
- Data-driven with clear metrics
- Forward-looking with practical next steps
- Bold key findings for scanning

---

## Special Situations

### Client Work in Non-Billable Data
- Always exclude obvious client project work from "non-billable" analysis
- Note excluded hours prominently
- Continue with internal work analysis

### Missing Personnel
- Note missing expected employees in Executive Summary
- Don't assume name variations
- Include impact assessment but don't halt strategic planning

### Data Inconsistencies
- If results seem wrong, investigate immediately
- Show confidence levels
- Include sample entries to demonstrate accuracy
