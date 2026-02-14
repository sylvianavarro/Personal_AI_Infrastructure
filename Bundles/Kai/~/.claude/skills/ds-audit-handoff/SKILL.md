---
name: ds-audit-handoff
description: Use when tracking Radix-to-Invela deltas, creating handoff documentation for developers/AI agents, or auditing design system alignment.
---

# Design System Audit & Handoff

Tracks differences between Radix defaults and Invela overrides. Creates handoff documentation.

## Purpose

1. **Track Deltas**: Document where Invela differs from Radix defaults
2. **Explain Why**: Capture rationale for each override
3. **Enable Handoff**: Allow developers/AI to build from scratch
4. **Audit Alignment**: Verify intentional vs accidental differences

## Delta Tracking Format

```markdown
| Token | Radix Default | Invela Value | Delta | Rationale |
|-------|---------------|--------------|-------|-----------|
| --space-4 | 16px | 16px | ✓ Aligned | 4pt grid |
| --color-blue-9 | #3E63DD | #4166F5 | Δ Different | Brand color |
```

## Current Audit

### Spacing (✓ Aligned)
Invela uses 4px base grid, matching Radix spacing conventions.

| Token | Radix | Invela | Status |
|-------|-------|--------|--------|
| --space-1 | 4px | 4px | ✓ |
| --space-2 | 8px | 8px | ✓ |
| --space-3 | 12px | 12px | ✓ |
| --space-4 | 16px | 16px | ✓ |
| --space-5 | 24px | 24px | ✓ |

### Colors (Δ Different)
Invela uses brand colors instead of Radix color scales.

| Token | Radix | Invela | Rationale |
|-------|-------|--------|-----------|
| Primary | --blue-9 (#3E63DD) | #4166F5 | Brand book specified |
| Background | --gray-1 (#FCFCFD) | #FFFFFF | Clean white preference |
| Text | --gray-12 (#11181C) | #181818 | Brand book specified |

### Typography (Δ Different)
Invela uses custom font stack instead of system fonts.

| Aspect | Radix Default | Invela | Rationale |
|--------|---------------|--------|-----------|
| Sans | system-ui | Plus Jakarta Sans | Brand font |
| Body | system-ui | Lexend | Marketing consistency |
| Mono | monospace | JetBrains Mono | Code readability |

## Handoff Documentation

### For Developers Starting Fresh

**Step 1: Install Radix Primitives**
```bash
npm install @radix-ui/themes
npm install @radix-ui/react-dialog @radix-ui/react-dropdown-menu ...
```

**Step 2: Apply Invela Overrides**
Override Radix CSS variables with Invela brand values from:
- `invela-brand/colors.md` — full color palette, semantic tokens, CSS variables
- `invela-brand/typography.md` — font stack, size scale, CSS variables
- `invela-brand/spacing.md` — spacing scale CSS variables
- `invela-brand/radius.md` — border radius scale
- `invela-brand/shadows.md` — shadow scale (light + dark)
- `invela-brand/transitions.md` — duration + easing tokens

**Step 3: Apply Component Styling**
See `invela-design-system` skill for component specifications.

### For AI Agents

When building Invela components:
1. Start with Radix primitive
2. Apply Invela color tokens
3. Apply Invela typography
4. Verify accessibility (use `accessibility-wcag-22` skill)
5. Document any new deltas

## Audit Checklist

Run this audit when:
- [ ] New component is added
- [ ] Color token changes
- [ ] Typography changes
- [ ] Spacing adjustments
- [ ] Before major releases

## Integration with Other Skills

This skill synthesizes:
- `radix-primitives` - Radix defaults
- `invela-brand` - Brand overrides
- `invela-design-system` - Current DS state

## Usage

Query this skill for:
- "What's different between Radix and Invela?"
- "How do I build [component] from scratch?"
- "Create handoff doc for [feature]"
