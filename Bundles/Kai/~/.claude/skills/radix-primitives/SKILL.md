---
name: radix-primitives
description: Use when building UI components with Radix UI, styling Radix with Tailwind, or implementing accessible interactive patterns. Covers all 25+ primitives, data-state styling, and composition.
---

# Radix Primitives Expert

Complete reference for Radix UI primitives with Tailwind CSS integration.

## Overview

Radix Primitives are **unstyled, accessible UI components** for building design systems. Invela uses Primitives (not Themes) with Tailwind for full styling control.

**Key Principle:** Radix handles behavior + accessibility, you handle styling.

## Quick Reference

### Component List (25+)

| Component | Use Case | Key Props |
|-----------|----------|-----------|
| Accordion | Collapsible sections | `type`, `collapsible` |
| Alert Dialog | Destructive confirmations | `open`, `onOpenChange` |
| Avatar | User images with fallback | `src`, `fallback` |
| Checkbox | Binary selection | `checked`, `onCheckedChange` |
| Collapsible | Show/hide content | `open`, `onOpenChange` |
| Context Menu | Right-click menus | `trigger`, `content` |
| Dialog | Modal dialogs | `open`, `onOpenChange` |
| Dropdown Menu | Action menus | `trigger`, `content` |
| Hover Card | Preview on hover | `openDelay`, `closeDelay` |
| Label | Form labels | `htmlFor` |
| Menubar | App menu bars | `value`, `onValueChange` |
| Navigation Menu | Site navigation | `value`, `onValueChange` |
| Popover | Floating content | `side`, `align` |
| Progress | Progress indicators | `value`, `max` |
| Radio Group | Single selection | `value`, `onValueChange` |
| Scroll Area | Custom scrollbars | `type` |
| Select | Dropdown select | `value`, `onValueChange` |
| Separator | Visual dividers | `orientation` |
| Slider | Range input | `value`, `onValueChange` |
| Switch | Toggle on/off | `checked`, `onCheckedChange` |
| Tabs | Tabbed interfaces | `value`, `onValueChange` |
| Toast | Notifications | `open`, `onOpenChange` |
| Toggle | Pressed state | `pressed`, `onPressedChange` |
| Toggle Group | Multiple toggles | `type`, `value` |
| Toolbar | Action toolbars | - |
| Tooltip | Hover hints | `delayDuration` |

## Styling with Tailwind

### Data-State Attributes

Radix exposes state via `data-state` attributes. Use Tailwind's data attribute selectors:

```tsx
// Accordion item - style based on open/closed state
<AccordionTrigger className="
  data-[state=open]:bg-blue-50
  data-[state=closed]:bg-white
  data-[state=open]:text-blue-600
">

// Checkbox - style based on checked state
<CheckboxIndicator className="
  data-[state=checked]:bg-blue-600
  data-[state=unchecked]:bg-gray-200
">

// Dialog overlay - style based on open state
<DialogOverlay className="
  data-[state=open]:animate-fadeIn
  data-[state=closed]:animate-fadeOut
">
```

### Common Data States

| Component | States |
|-----------|--------|
| Accordion | `open`, `closed` |
| Checkbox | `checked`, `unchecked`, `indeterminate` |
| Collapsible | `open`, `closed` |
| Dialog | `open`, `closed` |
| Dropdown | `open`, `closed` |
| Radio | `checked`, `unchecked` |
| Select | `open`, `closed` |
| Switch | `checked`, `unchecked` |
| Tabs | `active`, `inactive` |
| Toggle | `on`, `off` |

### Disabled States

```tsx
<Button className="
  disabled:opacity-50
  disabled:cursor-not-allowed
  disabled:pointer-events-none
">
```

### Focus States (Accessibility)

```tsx
<Button className="
  focus:outline-none
  focus-visible:ring-2
  focus-visible:ring-blue-500
  focus-visible:ring-offset-2
">
```

## Composition Pattern

Radix uses compound components. Always compose, don't nest arbitrarily:

```tsx
// ✅ Correct - using Radix compound pattern
<Dialog.Root>
  <Dialog.Trigger asChild>
    <Button>Open</Button>
  </Dialog.Trigger>
  <Dialog.Portal>
    <Dialog.Overlay className="fixed inset-0 bg-black/50" />
    <Dialog.Content className="fixed top-1/2 left-1/2 ...">
      <Dialog.Title>Title</Dialog.Title>
      <Dialog.Description>Description</Dialog.Description>
      <Dialog.Close asChild>
        <Button>Close</Button>
      </Dialog.Close>
    </Dialog.Content>
  </Dialog.Portal>
</Dialog.Root>
```

### The `asChild` Prop

Use `asChild` to merge Radix behavior onto your own components:

```tsx
// Radix adds dialog trigger behavior to your Button
<Dialog.Trigger asChild>
  <Button variant="primary">Open Dialog</Button>
</Dialog.Trigger>
```

## Accessibility (Built-in)

Radix handles:
- ✅ ARIA attributes
- ✅ Keyboard navigation
- ✅ Focus management
- ✅ Screen reader announcements

You must still ensure:
- Sufficient color contrast
- Visible focus indicators
- Touch target sizes (24x24px minimum)

## Spacing Scale (Alignment)

Radix Themes uses a 4pt base unit, which aligns with Invela:

| Token | Value | Tailwind |
|-------|-------|----------|
| --space-1 | 4px | `p-1` |
| --space-2 | 8px | `p-2` |
| --space-3 | 12px | `p-3` |
| --space-4 | 16px | `p-4` |
| --space-5 | 24px | `p-6` |
| --space-6 | 32px | `p-8` |
| --space-7 | 40px | `p-10` |
| --space-8 | 48px | `p-12` |
| --space-9 | 64px | `p-16` |

## Animation Patterns

Use Tailwind's animation utilities with Radix states:

```tsx
// Dropdown animation
<DropdownMenu.Content className="
  data-[state=open]:animate-in
  data-[state=closed]:animate-out
  data-[state=open]:fade-in-0
  data-[state=closed]:fade-out-0
  data-[state=open]:zoom-in-95
  data-[state=closed]:zoom-out-95
  data-[side=bottom]:slide-in-from-top-2
  data-[side=top]:slide-in-from-bottom-2
">
```

## Extended Reference

See `components.md` for detailed component patterns.

## Sources

- https://www.radix-ui.com/primitives
- https://www.radix-ui.com/primitives/docs/overview/introduction
- https://www.radix-ui.com/primitives/docs/guides/styling
