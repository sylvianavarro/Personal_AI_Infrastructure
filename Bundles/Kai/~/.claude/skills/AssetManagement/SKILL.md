---
name: AssetManagement
description: Brand asset management with constraint enforcement. USE WHEN creating images, logos, icons, colors, typography, visual assets, or auditing brand consistency for any project.
---

# AssetManagement

Manages design assets (images, icons, colors, logos, typography) per-project with global defaults. Loads brand constraints and reference images so generated assets stay visually consistent.

**Not the same as `design-system`:** That skill is Pulse-specific (ShadCN/Tailwind/Servant). This skill is project-agnostic — any project gets its own manifest, and the skill enforces whatever brand that manifest defines.

## Manifest Loading (Mandatory Pre-Flight)

Before ANY asset operation:

1. Check project: `<project-root>/.claude/assets/manifest.json`
2. Check global: `~/.claude/assets/manifest.json`
3. If both exist: deep-merge (project overrides global per-key; arrays replace, not concat)
4. If neither exists: suggest Initialize workflow
5. Read all `references` paths (multimodal — Claude views the images)
6. Read `guidelines/brand-rules.md` if present

See `ManifestSchema.md` for full schema and merge rules.

## Workflow Routing

| Workflow | Trigger | File |
|----------|---------|------|
| **Initialize** | "init assets", "set up brand", "scaffold assets" | `Workflows/Initialize.md` |
| **Create** | "create icon", "generate logo", "new color", "make image" | `Workflows/Create.md` |
| **Audit** | "audit brand", "check assets", "brand compliance" | `Workflows/Audit.md` |

## Key Rules

1. **Constraints are hard rules** — reject violations, don't suggest alternatives silently
2. **Read references before generating** — always view mood board / reference images first
3. **Suggest existing before creating new** — search project assets for duplicates
4. **Output to project assets folder** — `<project>/.claude/assets/<type>/`
5. **Global is fallback only** — never write to `~/.claude/assets/` during Create

## Integration

| Skill | Relationship |
|-------|-------------|
| `design-system` | AssetManagement provides raw brand data; design-system applies it to Pulse components |
| `brainstorming` | May trigger asset creation; this skill enforces constraints on output |
| `ui-review` | Audit workflow complements ui-review's visual audit checklist |

## Examples

**Example 1: Initialize project assets**
```
User: "Set up brand assets for this project"
→ Invokes Initialize workflow
→ Scaffolds .claude/assets/ with manifest template
→ Asks for brand name and primary color
```

**Example 2: Create an icon**
```
User: "Create a settings icon for the app"
→ Invokes Create workflow
→ Loads manifest → reads references → checks existing icons
→ Enforces icon style (outline/solid), strokeWidth, sizes from manifest
→ Saves to .claude/assets/icons/
```

**Example 3: Audit brand compliance**
```
User: "Check if our assets follow the brand guidelines"
→ Invokes Audit workflow
→ Loads manifest → scans all asset directories
→ Reports violations: CRITICAL / WARNING / INFO with fixes
```
