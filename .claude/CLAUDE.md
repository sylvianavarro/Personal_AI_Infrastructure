# AI Infrastructure

## Project Context

Personal AI Infrastructure (PAI) repo. Contains bundles, packs, tools, and shared skill content for the Claude Code skill ecosystem.

- **Upstream:** `danielmiessler/Personal_AI_Infrastructure`
- **Origin:** `EvanCNavarro/Personal_AI_Infrastructure` (Evan's fork)
- **myfork:** `sylvianavarro/Personal_AI_Infrastructure` (Syl's fork — PR source)
- **Key dirs:** `Bundles/Kai/` (bundle template), `Packs/` (pack files), `Tools/` (scripts)
- **Symlinks:** 18 shared skills symlinked from `~/.claude/skills/` to `Bundles/Kai/~/.claude/skills/`

## Relevant Skills

| Skill | Use When |
|-------|----------|
| `writing-skills` | Creating or editing any skill content |
| `docs-hygiene` | After modifying skills, before bundle export |
| `hooks-authoring` | Creating or modifying Claude Code hooks |
| `CreateSkill` | Creating a new skill from scratch |
| `project-instructions` | Setting up project CLAUDE.md or generating AGENTS.md |

## Project Conventions

- Pack files follow `Tools/PAIPackTemplate.md` format exactly
- Sanitization required before bundle export: no hardcoded paths, org-specific emails, Slack IDs
- Skills excluded from bundle: pulse-context, design-system, productive-api-patterns
- All shared skills must pass `lint-agent-friendly.sh` and `skill-hygiene.sh`
- `skill-index.json` regenerated manually — no auto-gen script

## Key File Locations

| Path | Purpose |
|------|---------|
| `Bundles/Kai/~/.claude/skills/` | Shared skill content (symlinked to live) |
| `Tools/sync-bundle-to-live.sh` | Symlink management (supports `--dry-run`) |
| `Tools/PAIPackTemplate.md` | Canonical pack format |
| `Packs/` | Published pack files |
| `~/.claude/tools/lint-agent-friendly.sh` | Structural lint (file length, env-in-git) |
| `~/.claude/tools/skill-hygiene.sh` | Relational checks (xrefs, sanitization, name match) |
| `~/.claude/tools/generate-agents-md.sh` | AGENTS.md compilation from project CLAUDE.md |

## Development Workflow

```bash
# Edit a skill (symlinked — either path works)
# Validate
~/.claude/tools/skill-hygiene.sh <skill-name>
~/.claude/tools/lint-agent-friendly.sh ~/.claude/skills/<skill-name>/

# Re-run sync only when adding a NEW skill to the bundle
Tools/sync-bundle-to-live.sh --dry-run
Tools/sync-bundle-to-live.sh
```

## Gotchas

- Cannot push to Evan's fork directly — PR from own fork (myfork remote)
- `skill-index.json` is manually maintained — update totalSkills and deferredCount when adding skills
- Re-run `sync-bundle-to-live.sh` only when adding a NEW skill to the bundle (existing symlinks persist)
- Sanitization allowlist: pulse-context, design-system, prospect-digest, create-asana-engagement-project, productive-api-patterns
