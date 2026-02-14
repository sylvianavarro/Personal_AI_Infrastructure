---
name: Documentation Skills
pack-id: sylvianavarro-documentation-skills-core-v1.0.0
version: 1.0.0
author: sylvianavarro
description: Two workflow skills for documentation engineering — audience-first documentation architecture with four-tier hierarchy, and SVG diagram standards for accessible, brand-consistent, version-controllable technical diagrams.
type: skill
purpose-type: [productivity, development]
platform: agnostic
dependencies: [danielmiessler-core-install-core-v1.0.0]
keywords: [documentation, architecture, diagrams, svg, accessibility, wcag, templates, tier-system, technical-writing, docs]
---

<!-- NOTE: Pack icon generation is a TODO — see PR notes -->

# Documentation Skills

> Two workflow skills for documentation engineering — from information architecture to accessible SVG diagrams

## Installation Prompt

You are receiving a PAI Pack - a modular upgrade for AI agent systems.

**What is PAI?** See: [PAI Project Overview](../README.md#what-is-pai)

**What is a Pack?** See: [Pack System](../README.md#the-journey-pai-v1x--v20)

This pack adds documentation engineering skills to your AI agent:

- **Documentation Architecture**: Audience-first information design using a four-tier hierarchy (L0 marketing, L1 client-facing, L2 internal process, L3 technical reference). Includes decision trees, templates per tier, tone guidelines, gap analysis, quality gates, and cross-referencing patterns.
- **Diagram Standards**: SVG diagram creation standards for architecture diagrams, flow charts, data flows, sequence diagrams, and dashboard wireframes. Ensures brand-consistent colors from manifest, WCAG accessibility, reusable SVG components, and version-controllable output.

Each skill is a standalone markdown workflow. No infrastructure dependencies — just skill files that encode documentation best practices.

Please follow the installation instructions below to integrate this pack into your infrastructure.

---

## What's Included

| Component | File | Purpose |
|-----------|------|---------|
| Documentation Architecture | `skills/docs-architecture/SKILL.md` | Four-tier doc hierarchy, templates, gap analysis |
| Diagram Standards | `skills/diagram-standards/SKILL.md` | SVG diagram creation with accessibility and brand consistency |

**Summary:**
- **Files created:** 2
- **Hooks registered:** 0 (skill-based, no hooks needed)
- **Dependencies:** core-install (for skill routing)

---

## The Concept

### The Problem

Documentation fails for two reasons: writing for the wrong audience and producing unmaintainable visual assets.

1. **Wrong audience** — Marketing language in operational guides, technical jargon in prospect-facing content. Without a system for choosing depth and tone, every document is a coin flip.
2. **No structure** — Teams write ad-hoc docs with no hierarchy, no templates, no review cadence. Gaps go unnoticed until someone asks "where's the onboarding guide?" in a client meeting.
3. **Raster diagrams** — Screenshots of Lucidchart/Visio that can't be updated, searched, version-controlled, or made accessible. They rot the moment the architecture changes.
4. **Inconsistent visuals** — Every diagram uses different colors, fonts, and node styles. No brand consistency across documentation tiers.
5. **Inaccessible diagrams** — No alt text, no `<title>`, no `<desc>`, color as sole information carrier. Screen readers see nothing.

### Who Needs This

- Teams creating documentation beyond a single README
- Anyone producing technical diagrams for documentation (L1 through L3)
- Organizations that need consistent, accessible documentation standards

---

## The Solution

Two complementary skills that cover the full documentation lifecycle — deciding what to write and how to visualize it.

**Core Architecture:**

```
User Intent → Skill Router → Documentation Skill → Structured Output
                                    ↓
                    Templates + Checklists + Standards
```

**Skill Coverage:**

| Category | Skill | Focus |
|----------|-------|-------|
| Information Design | docs-architecture | What to write, for whom, at what depth |
| Visual Standards | diagram-standards | How to create accessible, brand-consistent diagrams |

**How They Work Together:**

```
docs-architecture decides:         diagram-standards produces:
  "This is an L3 architecture doc"   → Architecture diagram (1200x800 SVG)
  "This is an L1 client guide"       → Flow diagram (1000x700 SVG)
  "This needs a gap analysis"        → Audience-journey matrix
```

The docs-architecture skill explicitly calls out "Use SVG or Mermaid" and "Always include a text description alongside diagrams" — the diagram-standards skill implements exactly that standard.

**The Key Insight:** Documentation quality isn't about writing better — it's about writing for the right audience at the right depth. And diagrams aren't decorations — they're first-class documentation artifacts that must be accessible, maintainable, and brand-consistent.

## What Makes This Different

This sounds similar to "documentation templates" which also provide structure for writing docs. What makes this approach different?

Templates tell you what sections to include. These skills tell you which template to use and why. The docs-architecture skill provides a decision tree that routes intent to the correct tier, tone, and format before a single word is written. The diagram-standards skill goes beyond "use SVG" — it provides reusable components, color token systems resolved from brand manifests, and WCAG accessibility requirements baked into every diagram.

- Decision trees route intent before writing begins
- Four tiers prevent writing for the wrong audience
- Diagram colors resolve from brand manifest automatically
- Every SVG includes accessibility metadata by default

---

## Installation

### Prerequisites

- **Claude Code** (or compatible AI agent with skill support)
- **core-install** (for skill directory structure and routing)

### Pre-Installation: System Analysis

#### Step 0.1: Detect Current Configuration

```bash
# 1. Check if PAI_DIR is set
echo "PAI_DIR: ${PAI_DIR:-'NOT SET - will use ~/.config/pai'}"

# 2. Check for existing skill directories
SKILLS_DIR="${PAI_DIR:-$HOME/.config/pai}/skills"
echo ""
echo "Checking for files this pack will create..."
if [ -f "$SKILLS_DIR/docs-architecture/SKILL.md" ]; then
  echo "⚠️  docs-architecture/SKILL.md already exists"
else
  echo "✓ docs-architecture/SKILL.md does not exist"
fi
if [ -f "$SKILLS_DIR/diagram-standards/SKILL.md" ]; then
  echo "⚠️  diagram-standards/SKILL.md already exists"
else
  echo "✓ diagram-standards/SKILL.md does not exist"
fi
```

#### Step 0.2: Conflict Resolution Matrix

| Scenario | Existing State | Action |
|----------|---------------|--------|
| **Clean Install** | No skill files exist | Proceed normally with Step 1 |
| **Files Exist** | Skill files already present | Backup old files, compare versions, then replace |
| **Missing Dependencies** | core-install not installed | Install core-install first |

#### Step 0.3: Backup Existing Configuration (If Needed)

```bash
BACKUP_DIR="$HOME/.pai-backup/$(date +%Y%m%d-%H%M%S)"
SKILLS_DIR="${PAI_DIR:-$HOME/.config/pai}/skills"

if [ -f "$SKILLS_DIR/docs-architecture/SKILL.md" ] || [ -f "$SKILLS_DIR/diagram-standards/SKILL.md" ]; then
  mkdir -p "$BACKUP_DIR"
  [ -f "$SKILLS_DIR/docs-architecture/SKILL.md" ] && cp "$SKILLS_DIR/docs-architecture/SKILL.md" "$BACKUP_DIR/docs-architecture-SKILL.md" && echo "✓ Backed up docs-architecture"
  [ -f "$SKILLS_DIR/diagram-standards/SKILL.md" ] && cp "$SKILLS_DIR/diagram-standards/SKILL.md" "$BACKUP_DIR/diagram-standards-SKILL.md" && echo "✓ Backed up diagram-standards"
  echo "Backup location: $BACKUP_DIR"
else
  echo "No existing files to backup"
fi
```

---

### Step 1: Create Skill Directories

```bash
SKILLS_DIR="${PAI_DIR:-$HOME/.config/pai}/skills"
mkdir -p "$SKILLS_DIR/docs-architecture"
mkdir -p "$SKILLS_DIR/diagram-standards"
```

### Step 2.1: Create docs-architecture/SKILL.md

Create file: `$SKILLS_DIR/docs-architecture/SKILL.md`

```markdown
---
name: docs-architecture
description: Use when structuring documentation for a project, product, or organization — choosing what to write, for whom, at what depth, identifying documentation gaps, or creating a documentation strategy from scratch
---

# Documentation Architecture

## Overview

Documentation architecture is audience-first information design. Every document exists for a specific reader at a specific moment. The system uses a four-tier hierarchy (L0-L3) that separates marketing, client-facing, internal, and technical documentation — preventing the #1 docs failure: writing for the wrong audience.

**Announce at start:** "I'm using the docs-architecture skill to structure the documentation."

## When to Use

- Starting a new project that needs documentation beyond a README
- Restructuring existing documentation that's disorganized or inconsistent
- Identifying what documentation is missing (gap analysis)
- Choosing the right format/depth for a specific document
- Creating documentation templates for a team
- Auditing documentation coverage across a product

**Don't use when:**
- Writing a single README (just write it)
- Documenting a single API endpoint (use standard API docs)
- Internal notes or scratch docs (no framework needed)

## The Four-Tier System

```
L0: Marketing & Awareness     → "Why should I care?"
L1: Client/User-Facing        → "How does this work for me?"
L2: Internal Process           → "How do we deliver this?"
L3: Technical Reference        → "How is this built?"
```

### L0: Marketing & Public Content

**Audience:** Prospects, general public, industry partners
**Purpose:** Build awareness, establish trust, communicate value
**Tone:** Warm, benefit-focused, inspirational but honest
**Length:** 1,000-2,500 words
**Refresh:** Quarterly review, annual deep refresh

**Characteristics:**
- High-level, benefit-focused language
- Showcases outcomes and case studies
- Accessible to non-technical readers
- SEO-optimized, shareable
- Clear call-to-action

**Examples:** Marketing website copy, case studies, thought leadership, whitepapers, newsletter features

**Naming:** `l0_[topic]_[variant].md`

---

### L1: Client/User-Facing Reference

Split into **L1-Public** (accessible to anyone) and **L1-Client** (authenticated/active users only).

#### L1-Public: General Reference

**Audience:** Prospects and users seeking self-service answers
**Purpose:** Educate, reduce support volume, support decision-making
**Tone:** Professional, educational, welcoming
**Length:** 500-1,500 words
**Refresh:** Semi-annual; update as offerings evolve

**Characteristics:**
- Problem-solution format
- Answers specific questions
- FAQ and getting-started guides
- Searchable and discoverable

**Examples:** Service overviews, engagement process guides, FAQ, onboarding checklists

**Naming:** `l1_public_[domain]_[topic].md`

#### L1-Client: Operational Guides

**Audience:** Active clients/users during engagements
**Purpose:** Enable self-service, document procedures, set expectations
**Tone:** Direct, procedural, supportive
**Refresh:** Per engagement; update as processes change

**Characteristics:**
- Step-by-step procedures with expected inputs/outputs
- Checklists, timelines, clear next steps
- Escalation paths and contacts
- Troubleshooting sections

**Examples:** Onboarding runbooks, weekly sync guides, deliverable acceptance criteria, escalation procedures

**Naming:** `l1_client_[domain]_[process].md`

---

### L2: Internal Process & Methodology

**Audience:** Internal team (managers, engineers, delivery leads)
**Purpose:** Enable consistent, high-quality delivery
**Tone:** Precise, process-oriented, comprehensive
**Length:** 2,000-5,000 words
**Refresh:** Biannual; update after methodology changes

**Characteristics:**
- Service delivery methodologies
- Decision trees for common scenarios
- Quality assurance checklists
- Role definitions and responsibilities
- Links to templates and tools

**Examples:** Service playbooks, proposal templates, retrospective templates, team capability matrices

**Naming:** `l2_[domain]_[process].md`

---

### L3: Technical Reference & Architecture

Split into **L3-External** (for integrators/developers) and **L3-Internal** (for engineering team).

#### L3-External: API & Integration Docs

**Audience:** External developers, integration partners
**Purpose:** Enable building on your platform/APIs
**Tone:** Technical, precise, developer-friendly
**Refresh:** Per release

**Characteristics:**
- API endpoints, auth, error handling
- Webhook specs and event schemas
- SDK documentation
- Rate limits, pagination, data formats
- Code examples in common languages

**Examples:** REST API reference, webhook catalog, OAuth flow docs, integration guides

**Naming:** `l3_external_api_[resource].md` or `l3_external_[integration]_guide.md`

#### L3-Internal: Architecture & Operations

**Audience:** Engineers, architects, technical leadership
**Purpose:** Document system design, decisions, and operations
**Tone:** Technical, comprehensive, accurate
**Refresh:** Monthly for active systems; per release

**Characteristics:**
- Architecture diagrams and descriptions
- Database schemas and data models
- Deployment and CI/CD procedures
- Monitoring, alerting, disaster recovery
- Security architecture and compliance

**Examples:** Platform architecture, DB schemas, IaC docs, incident runbooks, security controls

**Naming:** `l3_internal_[system]_[aspect].md`

---

## Decision Tree: Choosing Your Tier

```
START: What am I writing?

-- Q1: Is this customer/user-facing?
   |
   +-- YES -> Q2: Public (website, app store, docs site)?
   |   |
   |   +-- YES -> Q3: Explaining a service/product?
   |   |   +-- YES -> L0 (Marketing)
   |   |   +-- NO  -> L1-Public (Knowledge Base)
   |   |
   |   +-- NO -> Q3: For active clients/users only?
   |       +-- YES -> Q4: Operational guide or process?
   |       |   +-- YES -> L1-Client (Operational Guide)
   |       |   +-- NO  -> L2 (Internal Doc)
   |       +-- NO  -> L1-Public (Knowledge Base)
   |
   +-- NO -> Q2: For external developers/integrators?
       |
       +-- YES -> L3-External (API/Integration Reference)
       |
       +-- NO -> Q3: Architectural/technical?
           +-- YES -> L3-Internal (Architecture Doc)
           +-- NO  -> L2 (Internal Process Doc)
```

### Quick-Select Table

| I need to write...                      | Tier        | Owner                  |
|-----------------------------------------|-------------|------------------------|
| How [product/service] works             | L0          | Marketing + Domain Lead|
| FAQ about a feature                     | L1-Public   | Domain Lead + Docs     |
| "First steps" guide for new user        | L1-Client   | PM + Domain Lead       |
| Internal methodology overview           | L2          | Domain Lead            |
| API/integration reference               | L3-External | Engineering + Docs     |
| System architecture or design decision  | L3-Internal | Engineering            |
| Case study showing success              | L0          | Marketing + Domain Lead|
| Internal SOP                            | L2          | Process Owner          |
| Troubleshooting guide for users         | L1-Client   | Support + Domain Lead  |

---

## Tone Variations by Tier

| Tier | Primary Tone | Secondary Tone | Avoid |
|------|-------------|----------------|-------|
| **L0** | Inspirational, Warm | Expert, Welcoming | Overly technical; salesy hype |
| **L1-Public** | Educational, Professional | Reassuring, Accessible | Jargon; assumed knowledge |
| **L1-Client** | Direct, Supportive | Efficient, Clear | Patronizing; unnecessary complexity |
| **L2** | Procedural, Comprehensive | Pragmatic, Flexible | Overly prescriptive; unrealistic |
| **L3-External** | Technical, Developer-Focused | Precise, Supportive | Ambiguity; missing examples |
| **L3-Internal** | Accurate, Thorough | Practical, Defensive | Vague; missing edge cases |

---

## Content Reuse Hierarchy

Information flows between tiers. Don't write the same thing twice.

```
L2 (Internal Methodology) = Source of Truth for Process
  -> feeds L0 (marketing extracts the "why")
  -> feeds L1-Public (extracts the "what")
  -> feeds L1-Client (extracts the "how")

L3 (Technical Reference) = Source of Truth for Specs
  -> feeds L1-Client (simplified for users)
  -> feeds L2 (referenced for accuracy)
  -> feeds L3-External (public subset of L3-Internal)
```

**Rule:** When updating methodology, update L2 first, then propagate to L0/L1.

---

## Templates

### L0: Marketing Article

```markdown
---
title: [Benefit-Led Title]
description: [SEO meta description, 150-160 chars]
author: [Team/Person]
date: [YYYY-MM-DD]
category: [Case Study | Thought Leadership | Guide | Resource]
tags: [relevant, searchable, terms]
---

# [Main Title]

## The Challenge
[Relatable context - what problem is the reader facing?]

## The Solution
[How you approach it - methodology, not just tools]

## The Impact
[Measurable outcomes and business-level benefits]

## Key Insights
- [Learning 1]
- [Learning 2]
- [Learning 3]

## Next Steps
[CTA: schedule consultation, read related, etc.]
```

### L1-Public: Knowledge Base Article

```markdown
---
title: [Question or Task Title]
last_updated: [YYYY-MM-DD]
---

# [Main Title]

## Overview
[What this covers and why it matters. 2-4 sentences.]

## Who This Is For
[Primary audiences and use cases]

## Key Concepts
### [Concept 1]
[2-3 sentence explanation]

### [Concept 2]
[2-3 sentence explanation]

## Frequently Asked Questions
### Q: [Common question]
A: [Clear, concise answer. 1-3 sentences.]

## Related Articles
- [Link to related content]
```

### L1-Client: Operational Guide

```markdown
---
title: [Action Title]
effective_date: [YYYY-MM-DD]
owner: [Role/Person]
---

# [Process Title]

## Before You Begin
**Prerequisites:**
- [Requirement 1]
- [Requirement 2]

**Time required:** [estimate]

## Steps

### Step 1: [First Major Step]
[Intro sentence]
1. [Clear, actionable substep]
2. [Next substep with expected inputs/outputs]

### Step 2: [Second Major Step]
[Intro sentence]
1. [Substep]
2. [Substep]

## What Happens Next
[System behavior and what user should expect]

## Troubleshooting
### Issue: [Common Problem]
**Solution:** [Step-by-step resolution]

## Need Help?
[Contact info, escalation path]
```

### L2: Internal Service/Process Document

```markdown
---
title: [Document Title]
version: [X.Y]
status: [Draft | Review | Approved | Archived]
owner: [Team/Person]
last_updated: [YYYY-MM-DD]
---

# [Document Title]

## Document Control
| Property | Value |
|----------|-------|
| **Owner** | [Name/Team] |
| **Status** | [Draft/Review/Approved] |
| **Next Review** | [Date] |

## Executive Summary
[2-4 sentence overview. What, why, key outcome.]

## Background & Context
### Problem Statement
[Why we need this]

### Stakeholders
- **Owner:** [Name]
- **Engineering Lead:** [Name]

## Scope
### In Scope
- [Capability 1]

### Out of Scope
- [What we're NOT doing]

### Success Metrics
- [Metric 1]: [Target]

## Main Content
[Process flows, methodology, decision frameworks]

## Dependencies
- [External services]
- [Internal services]

## Open Questions
- [ ] [Question with owner/timeline]

## Related Documentation
- [Cross-tier links]

## Change Log
| Version | Date | Author | Summary |
|---------|------|--------|---------|
| 1.0 | [Date] | [Name] | Initial version |
```

### L3-External: API Reference

```markdown
---
title: [API Name] Reference
version: [X.Y.Z]
last_updated: [YYYY-MM-DD]
---

# [API Name]

## Authentication
[Auth method: API Key, OAuth 2.0, etc. Include code example.]

## Base URL
| Environment | URL |
|-------------|-----|
| Sandbox | `https://sandbox.api.example.com/v1` |
| Production | `https://api.example.com/v1` |

## Rate Limits
[Tiers and limits. Include response headers.]

## Endpoints

### [GET/POST] /[resource]
**Description:** [What this endpoint does]

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| param1 | string | Yes | [Description] |

**Example Request:**
[curl example]

**Example Response:**
[JSON with realistic data]

**Status Codes:**
| Code | Meaning |
|------|---------|
| 200 | Success |
| 400 | Bad request |

## Webhooks
[Events, payload structure, verification, retry logic]

## Error Handling
[Consistent error format with examples]

## Changelog
| Version | Date | Changes |
|---------|------|---------|
```

### L3-Internal: Architecture Document

```markdown
---
title: [System/Component] Architecture
version: [X.Y]
owner: [Team/Person]
last_updated: [YYYY-MM-DD]
---

# [System/Component] Architecture

## Service Overview
| Property | Value |
|----------|-------|
| **Language/Framework** | [e.g., Python/FastAPI] |
| **Database** | [e.g., PostgreSQL] |
| **Deployment** | [e.g., Kubernetes/AWS] |
| **Primary SLA** | [e.g., 99.95% uptime] |

## Architecture Overview
[2-3 paragraphs + diagram]

## Component Breakdown
### [Component 1]
**Technology:** [Stack]
**Responsibility:** [What it does]
**Interfaces:** [How others interact with it]

## Data Model
[ERD or schema description]

## Deployment
[Build, push, release process]

## Monitoring & Alerting
[Key metrics, dashboards, alert channels]

## Runbooks
### [Scenario]
**Detection:** [How you know]
**Steps:** [What to do]
**Resolution SLA:** [Time target]

## Security
[Auth, compliance, encryption, audit logging]

## Known Limitations & Future Work
[Current constraints, planned improvements]

## Change Log
| Version | Date | Author | Summary |
|---------|------|--------|---------|
```

---

## Gap Analysis Process

Use this to identify what documentation is missing.

### Step 1: Map Audiences to Journey Stages

Create a matrix: rows = audience types, columns = journey stages.

```
               | Discovery | Onboarding | Active Use | Support | Growth |
Prospects      |           |            |            |         |        |
Active Users   |           |            |            |         |        |
Internal Team  |           |            |            |         |        |
Developers     |           |            |            |         |        |
```

### Step 2: Fill Coverage Status

For each cell, mark: **Covered** | **Partial** | **Gap**

### Step 3: Collect Real Questions

Sources of truth for what's missing:
- Support tickets (what do people ask repeatedly?)
- Sales calls (what blocks prospects from deciding?)
- Engineering Slack (what do new devs ask on day 1?)
- Client feedback (what confuses active users?)

### Step 4: Prioritize by Impact

| Priority | Criteria |
|----------|----------|
| Critical | Asked 5+ times/month AND no documentation exists |
| High | Asked 3+ times/month OR blocks revenue/onboarding |
| Medium | Asked occasionally, workaround exists |
| Low | Nice to have, not blocking anything |

### Step 5: Build a Phased Roadmap

**Phase 1 (Immediate):** Synthesize from existing materials — service overviews, FAQ, onboarding guides
**Phase 2 (Short-term):** Requires engineering input — API docs, architecture docs
**Phase 3 (Medium-term):** Requires business decisions — pricing, SLAs, case studies

---

## Quality Gates

### Before Publishing Any Document

- [ ] Audience and tier are identified
- [ ] Correct template was used
- [ ] Tone matches tier (see tone table)
- [ ] YAML frontmatter is complete
- [ ] Cross-tier links are included (Related Documentation section)
- [ ] SME reviewed for accuracy
- [ ] Links tested and working
- [ ] Accessible (alt text on images, no color-only information)

### Tier-Specific Checklists

**L0:**
- [ ] Benefit-focused, not feature-focused
- [ ] SEO metadata present
- [ ] Clear CTA
- [ ] No unexplained jargon

**L1-Public:**
- [ ] Answers a specific question
- [ ] Reduces support volume
- [ ] Searchable/discoverable

**L1-Client:**
- [ ] Step-by-step with expected outputs
- [ ] Troubleshooting section
- [ ] Escalation path

**L2:**
- [ ] Version and owner documented
- [ ] Success metrics defined
- [ ] Review date scheduled

**L3-External:**
- [ ] Every endpoint has method, path, params, response, example
- [ ] Error codes documented
- [ ] Rate limits specified
- [ ] Tested with real requests

**L3-Internal:**
- [ ] Architecture diagram included
- [ ] Runbooks for common incidents
- [ ] Deployment process documented
- [ ] Monitoring and alerting specified

---

## Review Cadence

| Tier | Review Cycle | Trigger for Unscheduled Update |
|------|-------------|-------------------------------|
| L0 | Quarterly | New product/service launch |
| L1-Public | Semi-annual | Service offering changes |
| L1-Client | Per engagement | Process changes |
| L2 | Biannual | Methodology changes |
| L3-External | Per release | API breaking changes |
| L3-Internal | Monthly (active systems) | Architecture changes |

---

## Cross-Referencing Pattern

Every document should link to adjacent tiers:

```
L0 article -> "Learn more: [L1-Public FAQ]"
L1-Public  -> "Get started: [L1-Client Onboarding Guide]"
L1-Client  -> "Technical details: [L3-External API Reference]"
L2 playbook -> "For clients: [L1-Client Guide]" + "For engineers: [L3 Architecture]"
L3 reference -> "Overview: [L1-Public Service Description]"
```

Maintain a central index per tier: `l0_index.md`, `l1_index.md`, `l2_index.md`, `l3_index.md`

---

## Deprecation Process

When a document becomes outdated:

1. Add deprecation notice at the top:
   ```markdown
   > **Deprecated:** This document is no longer maintained.
   > See [New Document Title](link) for current information.
   > Last updated: [date].
   ```
2. Archive to `/archive/YYYY/old_document.md`
3. Update all inbound links to point to the replacement

---

## Common Mistakes

### Writing for the wrong audience
**Symptom:** Marketing language in operational guides, or technical jargon in prospect-facing content.
**Fix:** Use the decision tree. Check the tone table. If unsure, ask: "Who reads this and what do they need to do with it?"

### Generic voice instead of audience-specific
**Symptom:** "Use our platform to manage your community better."
**Fix:** Be specific to the reader's context. What do they call things? What's their workflow? What are their constraints?

### Undefined jargon in L2/L3
**Symptom:** Assuming the reader knows your internal terminology.
**Fix:** Define terms on first use. Even technical audiences benefit from clarity about YOUR system's specifics.

### Missing context in runbooks
**Symptom:** "Step 5: Run the migration script" with no explanation of what it does, what to expect, or what could go wrong.
**Fix:** Every procedural step needs: what it does, what to check before running, what success looks like, what failure looks like.

### Long examples without context
**Symptom:** A 50-line JSON response with no explanation of what it shows.
**Fix:** Introduce examples with what they demonstrate and why it matters.

### Raster diagrams
**Symptom:** Screenshots of Visio/Lucidchart that can't be updated, searched, or made accessible.
**Fix:** Use SVG or Mermaid. Version-controllable, accessible, searchable, scalable. Always include a text description alongside diagrams.

### No cross-tier links
**Symptom:** Documents exist in isolation. Users can't navigate from overview to details.
**Fix:** Every document gets a "Related Documentation" section linking to adjacent tiers.
```

### Step 2.2: Create diagram-standards/SKILL.md

Create file: `$SKILLS_DIR/diagram-standards/SKILL.md`

```markdown
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
```

### Step 3: Verify Installation

```bash
SKILLS_DIR="${PAI_DIR:-$HOME/.config/pai}/skills"

# Check both skill files exist
echo "Checking skill files..."
[ -f "$SKILLS_DIR/docs-architecture/SKILL.md" ] && echo "✓ docs-architecture/SKILL.md" || echo "✗ docs-architecture/SKILL.md MISSING"
[ -f "$SKILLS_DIR/diagram-standards/SKILL.md" ] && echo "✓ diagram-standards/SKILL.md" || echo "✗ diagram-standards/SKILL.md MISSING"

# Verify frontmatter
echo ""
echo "Verifying frontmatter..."
head -4 "$SKILLS_DIR/docs-architecture/SKILL.md"
echo "---"
head -4 "$SKILLS_DIR/diagram-standards/SKILL.md"
```

Expected output: Both files exist with correct `name` and `description` in YAML frontmatter.

---

## Invocation Scenarios

These skills are invoked by the skill router based on user intent:

| User Intent | Skill Triggered | Output |
|------------|----------------|--------|
| "Structure the docs for this project" | docs-architecture | Tier selection, template, gap analysis |
| "What documentation are we missing?" | docs-architecture | Gap analysis matrix with priorities |
| "Create a template for our API docs" | docs-architecture | L3-External template |
| "Create an architecture diagram" | diagram-standards | SVG with accessibility and brand colors |
| "Make a flow chart for onboarding" | diagram-standards | Process flow SVG |
| "Review this diagram for accessibility" | diagram-standards | Accessibility audit against checklist |
| "Create a sequence diagram for the auth flow" | diagram-standards | Sequence diagram SVG |

### Cross-Skill Integration

The two skills complement each other:

| docs-architecture decides... | diagram-standards produces... |
|------------------------------|------------------------------|
| "This is L3 architecture docs" | Architecture diagram at 1200x800 |
| "This is L1 client guide" | Flow diagram at 1000x700 |
| "Include an architecture overview" | SVG with full accessibility metadata |

---

## Example Usage

### Example 1: Documentation Strategy for a New Project

**User:** "We need documentation for our new API platform"

**docs-architecture activates:**
1. Identifies audiences: external developers (L3-External), internal team (L2), prospects (L0)
2. Runs gap analysis — no docs exist, all cells are "Gap"
3. Recommends Phase 1: L3-External API reference + L1-Public getting started guide
4. Provides templates for both tiers with correct tone and structure

### Example 2: Creating an Architecture Diagram

**User:** "Create an architecture diagram for our microservices"

**diagram-standards activates:**
1. Checks for brand manifest — loads colors from `manifest.json` or uses fallbacks
2. Creates 1200x800 SVG with system boundary, service nodes, database nodes
3. Includes `<title>`, `<desc>`, ARIA attributes
4. Adds legend for line styles
5. Provides prose description for parent document

### Example 3: Combined Workflow

**User:** "Document our payment service"

1. **docs-architecture** determines: L3-Internal architecture doc + L3-External API reference
2. **diagram-standards** creates: service architecture SVG + data flow SVG
3. Both skills' outputs are cross-referenced per the cross-referencing pattern

---

## Configuration

No configuration required beyond the skill files themselves.

**Optional:** If using diagram-standards with brand colors, ensure a `manifest.json` exists in your project (managed by the AssetManagement skill). Without it, diagram-standards uses sensible fallback colors.

---

## Customization

### Recommended Customization

**What to Customize:** The tier templates in docs-architecture

**Why:** Every organization has different documentation needs. The templates provide a starting point, but your L2 internal docs may need additional sections specific to your team's workflow.

**Process:**
1. Use the skill for a few documentation tasks to understand the templates
2. Identify sections your team consistently adds or removes
3. Fork the templates within the skill to match your organization's patterns

**Expected Outcome:** Templates that match your team's documentation workflow without requiring manual adjustment each time.

### Optional Customization

| Customization | Skill | Impact |
|--------------|-------|--------|
| Add custom tier sub-types | docs-architecture | More granular audience targeting |
| Add project-specific diagram types | diagram-standards | Diagrams for domain-specific use cases |
| Customize color fallbacks | diagram-standards | Match your brand without a full manifest |

---

## Credits

- **Original concept**: Daniel Miessler — developed as part of Kai personal AI infrastructure
- **Skills authored by**: sylvianavarro — documentation architecture patterns and SVG diagram standards

## Related Work

*None specified — maintainer to provide if applicable.*

## Works Well With

- **asset-management** — Provides the brand manifest (`manifest.json`) that diagram-standards reads for colors and typography
- **engineering-skills** — Complements with commit, testing, and performance skills

## Recommended

- **asset-management** — For brand-consistent diagram colors via manifest

## Relationships

### Parent Of
*None specified.*

### Child Of
*None specified.*

### Sibling Of
- `sylvianavarro-engineering-skills-core-v1.0.0` — Both are skill packs for PAI

### Part Of Collection
- PAI Skills Collection (engineering + PM + documentation)

## Changelog

### 1.0.0 - 2026-02-10
- Initial release
- docs-architecture: Four-tier documentation hierarchy with templates, gap analysis, quality gates
- diagram-standards: SVG diagram standards with brand tokens, accessibility, reusable components
