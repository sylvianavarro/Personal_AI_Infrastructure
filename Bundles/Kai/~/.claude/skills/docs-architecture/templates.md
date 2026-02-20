# Documentation Templates

Tier-specific templates for the docs-architecture skill. See `SKILL.md` for the four-tier system overview and usage guidance.

## L0: Marketing Article

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

## L1-Public: Knowledge Base Article

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

## L1-Client: Operational Guide

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

## L2: Internal Service/Process Document

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

## L3-External: API Reference

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

## L3-Internal: Architecture Document

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
