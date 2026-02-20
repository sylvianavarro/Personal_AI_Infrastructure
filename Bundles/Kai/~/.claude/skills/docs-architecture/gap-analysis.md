# Gap Analysis Process

Use this to identify what documentation is missing. See `SKILL.md` for the four-tier system that informs which tier each gap belongs to.

## Step 1: Map Audiences to Journey Stages

Create a matrix: rows = audience types, columns = journey stages.

```
               | Discovery | Onboarding | Active Use | Support | Growth |
Prospects      |           |            |            |         |        |
Active Users   |           |            |            |         |        |
Internal Team  |           |            |            |         |        |
Developers     |           |            |            |         |        |
```

## Step 2: Fill Coverage Status

For each cell, mark: **Covered** | **Partial** | **Gap**

## Step 3: Collect Real Questions

Sources of truth for what's missing:
- Support tickets (what do people ask repeatedly?)
- Sales calls (what blocks prospects from deciding?)
- Engineering Slack (what do new devs ask on day 1?)
- Client feedback (what confuses active users?)

## Step 4: Prioritize by Impact

| Priority | Criteria |
|----------|----------|
| Critical | Asked 5+ times/month AND no documentation exists |
| High | Asked 3+ times/month OR blocks revenue/onboarding |
| Medium | Asked occasionally, workaround exists |
| Low | Nice to have, not blocking anything |

## Step 5: Build a Phased Roadmap

**Phase 1 (Immediate):** Synthesize from existing materials — service overviews, FAQ, onboarding guides
**Phase 2 (Short-term):** Requires engineering input — API docs, architecture docs
**Phase 3 (Medium-term):** Requires business decisions — pricing, SLAs, case studies
