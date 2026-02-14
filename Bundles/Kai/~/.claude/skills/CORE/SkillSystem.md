# Skill System

**Structure conventions for skills in ~/.claude/skills/.**

## Naming Convention

Skill directories use **kebab-case** (e.g., `invela-brand`, `api-testing`). Multi-word skills with established TitleCase names (e.g., `CORE`, `CreateSkill`, `AssetManagement`) may keep them.

| Component | Convention | Example |
|-----------|-----------|---------|
| Skill directory | kebab-case or TitleCase | `react-performance`, `Design` |
| SKILL.md | Always `SKILL.md` | — |
| Workflow files | TitleCase | `Workflows/Create.md` |
| Sub-files | TitleCase or descriptive | `ManifestSchema.md` |

## Required Structure

### YAML Frontmatter

```yaml
---
name: skill-name
description: [What it does]. USE WHEN [triggers]. [Additional context].
---
```

Rules:
- `description` is a single line, max 1024 chars
- Include `USE WHEN` or `Use when` to define trigger conditions

### Markdown Body

At minimum, a SKILL.md needs:
1. A heading with the skill name
2. A "When to Use" section or equivalent trigger guidance
3. Actionable content — instructions, templates, rules, or reference tables

Skills with multiple workflows should include a routing table:

```markdown
## Workflow Routing

| Workflow | Trigger | File |
|----------|---------|------|
| **Create** | "create new X" | `Workflows/Create.md` |
```

## Directory Layout

```
skill-name/
├── SKILL.md              # Main skill file (required)
├── supporting-file.md    # Context/reference files
└── Workflows/            # Multi-step workflow files
    └── Create.md
```

## Quality Bar

A skill should be **actionable, not aspirational.** If an LLM reads the skill, it should know exactly what to do — not just what topics are covered. Every skill should contain:

- Concrete instructions, templates, or rules
- Specific examples where helpful
- No empty sections or placeholder content
