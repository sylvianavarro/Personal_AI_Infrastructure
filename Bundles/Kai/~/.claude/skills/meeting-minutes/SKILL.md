---
name: meeting-minutes
description: >
  Convert meeting transcripts into structured minutes with action items. Use when processing
  Zoom AI summaries, Fireflies notes, Fathom transcripts, or raw meeting transcripts.
  Produces executive summary, decisions, action items with owners and deadlines, and PM next steps.
  Trigger phrases: "meeting notes", "meeting minutes", "summarize meeting", "process transcript",
  "action items from meeting", "meeting recap".
  Do NOT use for generating meeting agendas (use sprint skill) or taking live notes.
---

# Meeting Minutes

Convert meeting transcripts into structured, actionable minutes.

## When to Use

- Processing Zoom AI / Fireflies / Fathom meeting summaries
- Converting raw transcripts to structured minutes
- Extracting action items from meeting recordings
- Creating meeting recaps for stakeholders who weren't present

---

## Process

### Step 1: Intake

Accept one or more transcript sources:
- Zoom AI summary
- Fireflies.ai notes
- Fathom highlights
- Raw transcript text
- Multiple sources for the same meeting

**CRITICAL: Read ALL provided sources.** Don't rely on just one summary — each tool captures different details. Cross-reference for completeness.

### Step 2: Analysis

Read every document carefully. Track:
- **Who said what** — attribute statements to specific people
- **Tone signals** — interruptions, hesitations, disagreements, enthusiasm
- **Implicit decisions** — agreements made through silence or nodding along
- **Missing voices** — who was quiet, who dominated

### Step 3: Generate Minutes

Use the output template below. Every section is required.

---

## Output Template

```markdown
# Meeting Minutes: [Meeting Name]

**Date:** [YYYY-MM-DD]
**Time:** [Start - End, timezone]
**Type:** [Standup / Sprint Planning / Client Review / 1:1 / etc.]
**Attendees:** [List with roles]
**Absent:** [Expected but missing]
**Recorder:** AI-generated from [source tools used]

---

## Executive Summary

[2-3 sentences. What was this meeting about? What was the outcome?
Lead with the most important decision or blocker.]

---

## Key Discussion Points

### [Topic 1]
- [Who] raised [what]
- Discussion: [key points, with attribution]
- Resolution: [what was decided or deferred]

### [Topic 2]
- [Same structure]

---

## Decisions Made

| # | Decision | Made By | Context |
|---|----------|---------|---------|
| 1 | [Decision] | [Name] | [Why this was decided] |

---

## Points of Disagreement / Tension

[Note any areas where participants disagreed, pushed back, or showed
hesitation. Include tone signals — interruptions, "well...", redirects.
If none, state "No disagreements noted."]

---

## Action Items

| # | Action | Owner | Due Date | Source |
|---|--------|-------|----------|--------|
| 1 | [Specific action verb + deliverable] | [Name] | [Date] | [What triggered this] |

**Format rule:** Each action item is concise:
- **[Name]** to "[action]" by [date]

**Due date rules:**
- If stated in meeting: use that date
- If "by next meeting": calculate the date
- If vague ("soon", "ASAP"): flag as "TBD — needs date"

---

## Risks / Blockers Surfaced

- [Risk/blocker]: [Who raised it] — [Current status]

---

## Moments to Note

[Things a senior BA would catch: shifts in tone, someone volunteering
reluctantly, a topic that was avoided, someone checking out, a key
person arriving late or leaving early, side conversations.]

---

## PM Next Steps

As the PM, your follow-ups from this meeting:

1. [ ] [Immediate action — within 24 hours]
2. [ ] [Follow-up action — this week]
3. [ ] [Tracking action — ongoing]

---

## Raw Notes / Quotes Worth Preserving

[Direct quotes that add context, are commitments, or might be needed
for reference later. Include speaker attribution.]
```

---

## Multi-Source Reconciliation

When multiple transcript sources are provided:

1. **Start with the most detailed source** (usually raw transcript)
2. **Cross-reference with AI summaries** for action items they caught
3. **Resolve conflicts** — if sources disagree on what was said:
   - Flag the discrepancy
   - Use the raw transcript as ground truth
   - Note: "[Source A] recorded X, [Source B] recorded Y — raw transcript confirms [answer]"
4. **Merge unique items** — each tool catches different things

---

## Troubleshooting

### Missing Attendee Attribution
- Check transcript for name labels (Zoom usually tags speakers)
- If unclear, use "[Unidentified speaker]" and note the ambiguity
- Ask the user to clarify if critical for action item ownership

### Vague Action Items
- If the meeting produced "we should..." without clear ownership:
  - Flag as: "**UNASSIGNED:** [action] — needs owner and deadline"
  - List in PM Next Steps as "Assign owner for [action]"

### Multiple Meetings in One Transcript
- Split into separate minutes documents
- Note: "This transcript contains [N] distinct meetings"

### Conflicting Information Across Sources
- Don't silently pick one — surface the conflict
- Let the PM decide which version is accurate

---

## Integration with Other Skills

| Skill | Integration |
|-------|-------------|
| **sprint** | Action items feed into sprint backlog |
| **stories** | Decisions become story context |
| **raid** | Risks surfaced become RAID entries |
| **client-comms** | Follow-up emails use client-comms templates |
