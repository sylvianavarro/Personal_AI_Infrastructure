---
name: CreateSkill
description: Create and validate skills. USE WHEN create skill, new skill, skill structure, canonicalize. SkillSearch('createskill') for docs.
---

# CreateSkill

Skill creation and validation framework.

## Authoritative Source

**Before creating ANY skill, READ:** `~/.claude/skills/CORE/SkillSystem.md`

That file defines the required structure: YAML frontmatter, workflow routing tables, examples section, directory layout, and naming conventions.

## Process

1. Read `SkillSystem.md` for the required structure
2. Create skill directory with SKILL.md
3. Add workflow files if the skill has multi-step processes
4. Validate against the checklist in SkillSystem.md

## Examples

**Example 1: Create a new skill**
```
User: "Create a skill for managing my recipes"
→ Reads SkillSystem.md for structure
→ Creates RecipeManager/ directory
→ Writes SKILL.md with frontmatter, routing table, examples
```

**Example 2: Fix an existing skill**
```
User: "Fix the daemon skill structure"
→ Reads SkillSystem.md checklist
→ Adds missing sections (Workflow Routing, Examples)
→ Fixes naming to match conventions
```
