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
