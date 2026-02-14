---
name: CORE
description: Personal AI Infrastructure core. AUTO-LOADS at session start. USE WHEN any session begins OR user asks about identity, response format, contacts, stack preferences.
---

# CORE - Personal AI Infrastructure

**Auto-loads at session start.** This skill defines identity, stack preferences, and core operating principles.

## Identity

Identity and communication rules are defined in `~/.claude/CLAUDE.md` (the authoritative source). This skill defers to CLAUDE.md for:
- User name, communication style, commit conventions
- Code principles, error handling, clarification behavior

## Stack Preferences

See `CoreStack.md` for full details. Defaults:

- **Language:** TypeScript preferred over Python
- **Package Manager:** bun (NEVER npm/yarn/pnpm)
- **Runtime:** Bun
- **Markup:** Markdown (NEVER HTML for basic content)

---

## Quick Reference

- Stack preferences: `CoreStack.md`
- Skill system conventions: `SkillSystem.md`
- Architecture overview: `PaiArchitecture.md`
