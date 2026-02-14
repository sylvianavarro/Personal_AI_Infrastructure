---
name: brainstorming
description: "You MUST use this before any creative work - creating features, building components, adding functionality, or modifying behavior. Explores user intent, requirements and design before implementation."
---

# Brainstorming Ideas Into Designs

## Overview

Help turn ideas into fully formed designs and specs through natural collaborative dialogue.

Start by understanding the current project context, then ask questions one at a time to refine the idea. Once you understand what you're building, present the design in small sections (200-300 words), checking after each section whether it looks right so far.

## The Process

**Understanding the idea:**
- Check out the current project state first (files, docs, recent commits)
- Ask questions one at a time to refine the idea
- Prefer multiple choice questions when possible, but open-ended is fine too
- Only one question per message - if a topic needs more exploration, break it into multiple questions
- Focus on understanding: purpose, constraints, success criteria

**Exploring approaches:**
- Propose 2-3 different approaches with trade-offs
- Present options conversationally with your recommendation and reasoning
- Lead with your recommended option and explain why

**Presenting the design:**
- Once you believe you understand what you're building, present the design
- Break it into sections of 200-300 words
- Ask after each section whether it looks right so far
- Cover: architecture, components, data flow, error handling, testing
- Be ready to go back and clarify if something doesn't make sense

## After the Design

**Documentation:**
- Write the validated design to `docs/plans/YYYY-MM-DD-<topic>-design.md`
- Use elements-of-style:writing-clearly-and-concisely skill if available
- Commit the design document to git

**Implementation (if continuing):**
- Ask: "Ready to set up for implementation?"
- Use superpowers:using-git-worktrees to create isolated workspace
- Use superpowers:writing-plans to create detailed implementation plan

## Chain Mode (No Human in the Loop)

When invoked as part of an automated skill chain (e.g., brainstorming → writing-plans → executing-plans) with no interactive human to ask questions:

**Process:**
1. **Read the codebase** — scan source files, tests, docs, types for the feature area
2. **Identify complexity** — list components by param count, branching logic, dependencies
3. **Propose 2-3 approaches** with trade-offs and a recommendation (same as interactive)
4. **Select the recommended approach** and output the design directly
5. **Skip incremental validation** — present the full design in one pass

**Chain mode output format:**

```markdown
## Brainstorm: [Topic]

### Codebase Scan
| Component | Complexity | Key Behaviors |
|-----------|-----------|---------------|
| [name] | Low/Medium/High | [what it does] |

### Approaches
1. **[Recommended]** — [description, trade-offs]
2. **[Alternative]** — [description, trade-offs]
3. **[Alternative]** — [description, trade-offs]

### Selected: [Approach name]
[Brief rationale]
```

**Chain mode is NOT an excuse to skip codebase analysis or approach comparison.**

## Key Principles

- **One question at a time** - Don't overwhelm with multiple questions (interactive mode)
- **Multiple choice preferred** - Easier to answer than open-ended when possible
- **YAGNI ruthlessly** - Remove unnecessary features from all designs
- **Explore alternatives** - Always propose 2-3 approaches before settling
- **Incremental validation** - Present design in sections, validate each (interactive mode)
- **Be flexible** - Go back and clarify when something doesn't make sense
