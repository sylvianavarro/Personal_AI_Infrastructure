---
name: status
description: Generate project status reports. Use when preparing for standups, stakeholder updates, documenting current project state, or communicating progress to different audiences.
---

# Status Report

Generate status reports tailored to your audience. Same information, different format.

## When to Use

- Daily standup preparation
- Weekly stakeholder updates
- End-of-day progress summary
- Handoff to another developer
- Sprint progress check
- Executive briefings
- Release announcements
- Client communications

---

## Communication Matrix

| Audience | Format | Lead With | Tone |
|----------|--------|-----------|------|
| Engineering | Slack / standup | What changed | Casual, technical |
| Stakeholders | Email / doc | Business outcomes | Professional, strategic |
| Customers | Release notes | Value delivered | Friendly, benefit-focused |
| Executives | Brief / deck | Impact + next steps | Concise, metric-driven |
| Documentation | Notion / wiki | Complete reference | Comprehensive, structured |

**Audience detection** — infer from context cues:
- "post in Slack" / "tell the team" → Engineering format
- "email the client" / "update stakeholders" → Stakeholder format
- "changelog" / "release notes" → Customer format
- "brief the exec" / "board update" → Executive format

---

## Gather Data

```bash
# Recent commits
git log --oneline --since="1 week ago" --author="$(git config user.name)"

# Current state
git status --short && git stash list

# Open branches
git branch -a --no-merged main

# Test/build status (if applicable)
npm test 2>&1 | tail -5
```

---

## Internal Formats

### Daily Standup

```markdown
## [Date] Standup

**Yesterday:** [What was accomplished]
**Today:** [What's planned]
**Blockers:** [None / Description]
```

### Weekly Summary

```markdown
## Week of [Date Range]

### Highlights
- [Major accomplishment 1]
- [Major accomplishment 2]

### Progress
| Goal | Target | Actual | Notes |
|------|--------|--------|-------|
| [Goal] | [X] | [Y] | [context] |

### Challenges
- [Challenge faced and how addressed]

### Next Week Focus
1. [Priority 1]
2. [Priority 2]
```

### Full Status Report

```markdown
# Status Report: [Date]

## Summary
[1-2 sentence overview]

## Completed Since Last Update
- [x] [Task/feature completed]

## In Progress
| Task | Status | ETA | Blockers |
|------|--------|-----|----------|
| [Task] | [X]% | [date] | [none/description] |

## Blockers
- [ ] [Blocker] — Waiting on: [who/what]

## Next Steps
1. [Next priority task]

## Risks / Concerns
- [Any emerging risks]
```

---

## External Formats

### Executive Briefing (Update)

Maximum 3 paragraphs. No jargon, active voice, metric-driven. Use when **informing**.

```markdown
**What happened:** [Outcomes with metrics — shipped X, reduced Y by Z%]

**Why it matters:** [Business impact — revenue, efficiency, risk reduction]

**What's next:** [Next milestone, timeline, decisions needed]
```

### Executive Proposal (Request)

Use when **asking for something** — approval, budget, headcount, direction change.

```markdown
1. **Executive Summary** — 3 bullets max: what, why, impact
2. **Business Impact** — Metrics, outcomes, projected value
3. **Strategic Context** — How this connects to company goals/OKRs
4. **Risks & Mitigation** — What could go wrong, how we'd handle it
5. **Resource Requirements** — What we need, why it's justified
6. **Decision Needed** — What you're asking for, by when
7. **Next Steps** — What happens after approval
```

**Pre-answer these questions** (execs will always ask them):
- Why now? (urgency/timing)
- What's the ROI? (cost vs value)
- What happens if we don't? (cost of inaction)
- What are the risks? (downside + mitigation)
- Who else is affected? (cross-functional impact)

### Stakeholder Email

Professional, context-rich. Business outcomes first, technical details optional.

```markdown
Subject: [Project] Update — [Date]

Hi [Name],

**Progress:** [2-3 sentences on what was delivered and business impact]

**Milestones:**
| Milestone | Status | Notes |
|-----------|--------|-------|
| [Milestone] | On Track / At Risk | [context] |

**Decisions needed:** [Any blockers requiring stakeholder input]

**Next steps:** [What happens next, when to expect the next update]
```

### Release Notes

Customer-facing, benefit-focused. No implementation details.

```markdown
## What's New — [Version/Date]

### [Feature Name]
[1-2 sentences: what it does for the user, not how it works]

### Improvements
- [Benefit-framed improvement]

### Fixes
- Fixed [user-visible problem]
```

### Slack Announcement

Casual, scannable. Headline first, details below the fold.

```markdown
[headline — what shipped or changed]

**What:** [1 sentence]
**Why:** [1 sentence on user/business value]
**Details:** [link to PR/doc/release notes]
```

---

## Same-Event Transformation

One event, four outputs. Example: shipped OAuth2 integration.

**Engineering (Slack):**
> Shipped OAuth2 — Google provider, session-based tokens, logout endpoint. PR #47.

**Stakeholder (Email):**
> We've added Google login support, reducing signup friction. Users can now authenticate with existing Google accounts instead of creating new credentials.

**Customer (Release Notes):**
> **Sign in with Google** — Log in with one click using your Google account. No new password needed.

**Executive (Brief):**
> Shipped Google SSO. Expected to reduce signup abandonment by 15-20% based on industry benchmarks. Next: Apple sign-in (2 weeks).

---

## Status Levels

| Level | Meaning | Action |
|-------|---------|--------|
| **On Track** | Proceeding as planned | Continue |
| **At Risk** | Potential delays | Monitor, escalate if needed |
| **Blocked** | Cannot proceed | Immediate escalation |
| **Complete** | Done, verified | Close out |

---

## Best Practices

- Lead with outcomes, not activities
- Quantify progress — numbers over adjectives
- Flag risks early, with mitigation plan
- Match detail level to audience — execs get bullets, engineers get diffs
- Reference tickets/PRs for traceability
- Never hide problems — surface early, propose solutions

---

## Integration

| Skill | Integration |
|-------|-------------|
| **catchup** | Status follows catchup at session start |
| **estimate** | Status references estimates |
| **executing-plans** | Status shows plan progress |
| **stories** | User story format for backlog items |
| **sprint** | Sprint progress feeds weekly summary |
