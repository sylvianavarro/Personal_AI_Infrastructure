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

| Tier | Audience | Tone | Length | Refresh | Naming |
|------|----------|------|--------|---------|--------|
| **L0** | Prospects, public | Warm, benefit-focused | 1,000-2,500w | Quarterly | `l0_[topic]_[variant].md` |
| **L1-Public** | Users seeking self-service | Professional, educational | 500-1,500w | Semi-annual | `l1_public_[domain]_[topic].md` |
| **L1-Client** | Active clients/users | Direct, procedural | Varies | Per engagement | `l1_client_[domain]_[process].md` |
| **L2** | Internal team | Precise, process-oriented | 2,000-5,000w | Biannual | `l2_[domain]_[process].md` |
| **L3-External** | External developers | Technical, developer-friendly | Varies | Per release | `l3_external_api_[resource].md` |
| **L3-Internal** | Engineers, architects | Technical, comprehensive | Varies | Monthly/per release | `l3_internal_[system]_[aspect].md` |

### L0: Marketing & Public Content
Build awareness, establish trust, communicate value. High-level benefit-focused language, SEO-optimized, clear CTA. Showcases outcomes and case studies. Accessible to non-technical readers.
*Examples:* Website copy, case studies, thought leadership, whitepapers.

### L1: Client/User-Facing Reference
Split into **L1-Public** (anyone) and **L1-Client** (authenticated/active users).
- **L1-Public:** Problem-solution format, answers specific questions, FAQ and getting-started guides, searchable. *Examples:* Service overviews, FAQ, onboarding checklists.
- **L1-Client:** Step-by-step procedures with expected inputs/outputs, checklists, escalation paths, troubleshooting. *Examples:* Onboarding runbooks, weekly sync guides, escalation procedures.

### L2: Internal Process & Methodology
Enable consistent delivery. Service delivery methodologies, decision trees, QA checklists, role definitions, links to templates/tools.
*Examples:* Service playbooks, proposal templates, retrospective templates.

### L3: Technical Reference & Architecture
Split into **L3-External** (integrators/developers) and **L3-Internal** (engineering team).
- **L3-External:** API endpoints, auth, error handling, webhook specs, SDK docs, rate limits, code examples. *Examples:* REST API reference, webhook catalog, OAuth flow docs.
- **L3-Internal:** Architecture diagrams, DB schemas, deployment/CI/CD, monitoring/alerting, security/compliance. *Examples:* Platform architecture, IaC docs, incident runbooks.

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

See [templates.md](templates.md) in this directory for all tier-specific document templates (L0-L3).

---

## Gap Analysis

See [gap-analysis.md](gap-analysis.md) in this directory for the 5-step documentation gap analysis process.

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

- **Wrong audience** -- Marketing language in operational guides, or jargon in prospect content. Fix: use the decision tree. Ask "Who reads this and what do they need to do?"
- **Generic voice** -- "Use our platform to manage better." Fix: be specific to the reader's context, terminology, and workflow.
- **Undefined jargon** -- Assuming readers know internal terminology. Fix: define terms on first use, even for technical audiences.
- **Missing runbook context** -- "Run the migration script" with no explanation. Fix: every step needs what it does, what success looks like, what failure looks like.
- **Long examples without context** -- 50-line JSON with no explanation. Fix: introduce examples with what they demonstrate and why.
- **Raster diagrams** -- Screenshots that can't be updated or searched. Fix: use SVG or Mermaid with text descriptions.
- **No cross-tier links** -- Documents in isolation. Fix: every document gets a "Related Documentation" section linking adjacent tiers.
