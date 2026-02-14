---
name: Design
description: "Master design orchestrator for frontend work. USE WHEN working on CSS, components, UI, UX, styling, layout, responsive design, accessibility, a11y. Auto-triggers on frontend files. Finds or creates design specs. Invokes design:ux, design:a11y, design:responsive, design:trends sub-skills."
---

# Design System Orchestrator

Master skill for design review, implementation, and enforcement. Ensures consistent, accessible, performant UI/UX across projects.

## Trigger Conditions

This skill should auto-invoke when:
- Working on files: `*.css`, `*.scss`, `*.less`, `*.tsx`, `*.jsx`, `components/**`, `app/**/*.tsx`, `styles/**/*`, `tailwind.config.*`, `theme.*`, `tokens.*`
- User mentions: design, UI, UX, styling, layout, responsive, accessibility, a11y
- Creating new components or pages
- Modifying existing frontend code

## Workflow Routing

| Workflow | Trigger | File |
|----------|---------|------|
| **DesignAudit** | "audit design", "check design" | `Workflows/DesignAudit.md` |
| **CreateDesignSpec** | "create design spec", "design system" | `Workflows/CreateDesignSpec.md` |
| **ImplementDesign** | "implement design", "apply design" | `Workflows/ImplementDesign.md` |

## Sub-Skills

| Sub-Skill | Trigger | File |
|-----------|---------|------|
| **UX** | UX principles, laws of UX | `SubSkills/UX.md` |
| **A11y** | Accessibility, WCAG | `SubSkills/A11y.md` |
| **Responsive** | Mobile, responsive, breakpoints | `SubSkills/Responsive.md` |
| **Trends** | Modern CSS, animations | `SubSkills/Trends.md` |
| **ComponentStandards** | Dropdown, button, input, modal standards | `SubSkills/ComponentStandards.md` |

## The Process

### 1. Design Spec Discovery
```
1. Check for existing design spec:
   - docs/plans/*design*
   - DESIGN.md
   - design-system.md
   - .design/tokens.css

2. If none exists:
   - Invoke superpowers:brainstorming skill
   - Create spec via CreateDesignSpec workflow

3. Load and parse design tokens for enforcement
```

### 2. Audit Workflow
```
1. Detect frontend work
2. Find design spec for project
3. Invoke relevant sub-skills in parallel:
   - design:ux (Laws of UX, NN heuristics)
   - design:a11y (WCAG 2.2, A11y Project)
   - design:responsive (Mobile-first, container queries)
   - design:trends (Modern CSS, animation)
   - design:componentstandards (Dropdown, button, input standards)
4. Aggregate audit results
5. Present findings with priorities
6. Suggest specific fixes with code examples
7. Verify fixes before completion
```

### 3. Severity Levels

| Level | Type | Action |
|-------|------|--------|
| **Blocker** | A11y violation, breaks functionality | Must fix before commit |
| **Critical** | Major UX violation, design system inconsistency | Should fix before commit |
| **Warning** | Minor deviation, best practice not followed | Fix when possible |
| **Info** | Suggestion for improvement | Consider for future |

## Examples

**Example 1: Frontend file edited**
```
User edits: src/components/Button.tsx
→ Design skill auto-triggers
→ Loads project design spec
→ Runs all sub-skills in parallel
→ Reports: "2 blockers (a11y), 1 warning (UX)"
→ Provides specific fixes with code
```

**Example 2: New component created**
```
User: "Create a video card component"
→ Design skill triggers
→ Checks for design spec → Found
→ References design tokens
→ Generates component following spec
→ Runs audit before presenting
```

**Example 3: No design spec exists**
```
User: "Help me style this form"
→ Design skill triggers
→ No design spec found
→ Asks: "No design system found. Create one? (y/n)"
→ If yes: Invokes brainstorming → CreateDesignSpec
→ Then applies to form
```

## Scenario Recipes

Ordered skill invocation sequences for common design tasks.

### New Component Design
1. `design-systems-reference` — How do Material/Carbon/Polaris handle this?
2. `financial-ux-patterns` — Domain-specific patterns?
3. `accessibility-wcag-22` — What WCAG criteria apply?
4. `responsive-dark-mode` — Breakpoint/dark mode behavior?
5. `vercel-web-interface` — Keyboard, focus, loading, URL state patterns
6. `invela-brand` — Apply brand colors/typography
7. `radix-primitives` — Implement with Radix
8. `invela-design-system` — Document the component

### Form Implementation
1. `accessibility-wcag-22` — Form accessibility requirements
2. `vercel-web-interface` — Submission, validation, error handling
3. `invela-brand` — Apply brand styling
4. `radix-primitives` — Use Radix form primitives
5. `invela-design-system` — Document patterns

### Interactive Component (buttons, dropdowns, modals)
1. `accessibility-wcag-22` — Focus, keyboard, ARIA requirements
2. `vercel-web-interface` — Focus management, hit targets, animations
3. `responsive-dark-mode` — Responsive behavior
4. `radix-primitives` — Use Radix primitive
5. `invela-brand` — Apply styling

### Loading/Error States
1. `vercel-web-interface` — Timing, optimistic updates, error messages
2. `financial-ux-patterns` — Domain-specific patterns
3. `invela-brand` — Visual styling

### Animation Work
1. `vercel-web-interface` — prefers-reduced-motion, GPU props, easing
2. `accessibility-wcag-22` — Motion accessibility
3. `invela-brand` — Brand-appropriate motion

## Vercel Interaction Patterns

Bridges "what it looks like" → "how it works":

| Other Skills | vercel-web-interface |
|--------------|----------------------|
| Visual design | Interaction patterns |
| WCAG compliance | Actual focus management |
| Colors/typography | Loading states, animations |
| Component specs | Performance optimization |

Key patterns:
- 24px hit targets (visual can be smaller)
- 150–300ms delay before showing spinners
- Deep-link all URL state
- Never disable paste
- APCA contrast over WCAG 2
- GPU-only animations (transform, opacity)

## Parallel vs Sequential Execution

### Can Run in Parallel
- Research skills (market-competitors, design-systems-ref, financial-ux-patterns)
- Validation skills (accessibility-wcag-22, responsive-dark-mode)

### Must Run Sequential
- Implementation (vercel-web-interface, invela-brand, radix-primitives) depends on validation
- Documentation (invela-design-system, ds-audit-handoff) depends on implementation

## New Feature Checklist

- [ ] Research: What do competitors do?
- [ ] Research: What's industry standard?
- [ ] Research: What's domain-specific?
- [ ] Validate: WCAG compliance check
- [ ] Validate: Responsive considerations
- [ ] Implement: Vercel interaction patterns
- [ ] Apply: Brand colors/typography
- [ ] Apply: Radix primitives
- [ ] Document: Update DS state
- [ ] Document: Track deltas

## Key Principles

- **Design spec first**: Always find or create design spec before implementing
- **Ruthless enforcement**: Flag ALL deviations from design system
- **Accessibility is non-negotiable**: A11y blockers must be fixed
- **Evidence-based**: Cite specific laws, guidelines, or tokens when flagging issues
- **Actionable feedback**: Every issue includes specific fix with code example
