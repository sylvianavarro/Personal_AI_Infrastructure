# Radix Component Patterns

Detailed patterns for common Radix components with Tailwind styling.

## Button (Custom - Not a Radix Primitive)

Buttons aren't a Radix primitive - build your own:

```tsx
// components/ui/button.tsx
import { cva, type VariantProps } from "class-variance-authority";

const buttonVariants = cva(
  "inline-flex items-center justify-center rounded-lg font-medium transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50",
  {
    variants: {
      variant: {
        primary: "bg-[#4166F5] text-white hover:bg-[#9EC0F5] focus-visible:ring-[#4166F5]",
        secondary: "bg-[#ECF2FD] text-[#4166F5] hover:bg-[#9EC0F5] hover:text-white",
        outline: "border border-[#D1D1D1] bg-white hover:bg-[#EBEBEB]",
        ghost: "hover:bg-[#ECF2FD]",
        destructive: "bg-red-600 text-white hover:bg-red-700",
      },
      size: {
        sm: "h-8 px-3 text-sm",
        md: "h-10 px-4 text-sm",
        lg: "h-12 px-6 text-base",
        icon: "h-10 w-10",
      },
    },
    defaultVariants: {
      variant: "primary",
      size: "md",
    },
  }
);
```

## Dialog

```tsx
import * as Dialog from "@radix-ui/react-dialog";

<Dialog.Root>
  <Dialog.Trigger asChild>
    <Button>Open</Button>
  </Dialog.Trigger>
  <Dialog.Portal>
    <Dialog.Overlay className="
      fixed inset-0 z-50
      bg-black/50
      data-[state=open]:animate-in
      data-[state=closed]:animate-out
      data-[state=open]:fade-in-0
      data-[state=closed]:fade-out-0
    " />
    <Dialog.Content className="
      fixed left-1/2 top-1/2 z-50
      w-full max-w-lg -translate-x-1/2 -translate-y-1/2
      rounded-lg bg-white p-6 shadow-lg
      data-[state=open]:animate-in
      data-[state=closed]:animate-out
      data-[state=open]:fade-in-0
      data-[state=closed]:fade-out-0
      data-[state=open]:zoom-in-95
      data-[state=closed]:zoom-out-95
    ">
      <Dialog.Title className="text-lg font-semibold text-[#181818]">
        Dialog Title
      </Dialog.Title>
      <Dialog.Description className="mt-2 text-sm text-[#434343]">
        Dialog description here.
      </Dialog.Description>
      {/* Content */}
      <Dialog.Close asChild>
        <button className="absolute right-4 top-4" aria-label="Close">
          <X className="h-4 w-4" />
        </button>
      </Dialog.Close>
    </Dialog.Content>
  </Dialog.Portal>
</Dialog.Root>
```

## Dropdown Menu

```tsx
import * as DropdownMenu from "@radix-ui/react-dropdown-menu";

<DropdownMenu.Root>
  <DropdownMenu.Trigger asChild>
    <Button variant="outline">Options</Button>
  </DropdownMenu.Trigger>
  <DropdownMenu.Portal>
    <DropdownMenu.Content
      className="
        min-w-[220px] rounded-lg bg-white p-1 shadow-lg
        data-[state=open]:animate-in
        data-[state=closed]:animate-out
        data-[state=open]:fade-in-0
        data-[state=closed]:fade-out-0
        data-[side=bottom]:slide-in-from-top-2
      "
      sideOffset={5}
    >
      <DropdownMenu.Item className="
        flex cursor-pointer select-none items-center rounded-md px-3 py-2 text-sm
        outline-none
        focus:bg-[#ECF2FD] focus:text-[#4166F5]
        data-[disabled]:pointer-events-none data-[disabled]:opacity-50
      ">
        Edit
      </DropdownMenu.Item>
      <DropdownMenu.Separator className="my-1 h-px bg-[#E1E1E1]" />
      <DropdownMenu.Item className="...">Delete</DropdownMenu.Item>
    </DropdownMenu.Content>
  </DropdownMenu.Portal>
</DropdownMenu.Root>
```

## Select

```tsx
import * as Select from "@radix-ui/react-select";

<Select.Root>
  <Select.Trigger className="
    inline-flex h-10 items-center justify-between rounded-lg
    border border-[#D1D1D1] bg-white px-3 text-sm
    focus:outline-none focus:ring-2 focus:ring-[#4166F5]
    data-[placeholder]:text-[#B7B7B7]
  ">
    <Select.Value placeholder="Select option" />
    <Select.Icon>
      <ChevronDown className="h-4 w-4" />
    </Select.Icon>
  </Select.Trigger>
  <Select.Portal>
    <Select.Content className="
      overflow-hidden rounded-lg bg-white shadow-lg
      data-[state=open]:animate-in
      data-[state=open]:fade-in-0
    ">
      <Select.Viewport className="p-1">
        <Select.Item
          value="option1"
          className="
            relative flex h-10 cursor-pointer select-none items-center
            rounded-md px-8 text-sm outline-none
            focus:bg-[#ECF2FD] focus:text-[#4166F5]
            data-[state=checked]:bg-[#ECF2FD]
          "
        >
          <Select.ItemIndicator className="absolute left-2">
            <Check className="h-4 w-4" />
          </Select.ItemIndicator>
          <Select.ItemText>Option 1</Select.ItemText>
        </Select.Item>
      </Select.Viewport>
    </Select.Content>
  </Select.Portal>
</Select.Root>
```

## Tabs

```tsx
import * as Tabs from "@radix-ui/react-tabs";

<Tabs.Root defaultValue="tab1">
  <Tabs.List className="flex border-b border-[#E1E1E1]">
    <Tabs.Trigger
      value="tab1"
      className="
        px-4 py-2 text-sm font-medium
        border-b-2 border-transparent
        data-[state=active]:border-[#4166F5]
        data-[state=active]:text-[#4166F5]
        data-[state=inactive]:text-[#434343]
        hover:text-[#4166F5]
      "
    >
      Tab 1
    </Tabs.Trigger>
    <Tabs.Trigger value="tab2" className="...">Tab 2</Tabs.Trigger>
  </Tabs.List>
  <Tabs.Content value="tab1" className="p-4">
    Content 1
  </Tabs.Content>
  <Tabs.Content value="tab2" className="p-4">
    Content 2
  </Tabs.Content>
</Tabs.Root>
```

## Checkbox

```tsx
import * as Checkbox from "@radix-ui/react-checkbox";

<div className="flex items-center">
  <Checkbox.Root
    className="
      flex h-5 w-5 items-center justify-center rounded
      border border-[#D1D1D1] bg-white
      focus:outline-none focus:ring-2 focus:ring-[#4166F5]
      data-[state=checked]:bg-[#4166F5] data-[state=checked]:border-[#4166F5]
    "
  >
    <Checkbox.Indicator>
      <Check className="h-4 w-4 text-white" />
    </Checkbox.Indicator>
  </Checkbox.Root>
  <label className="ml-2 text-sm">Accept terms</label>
</div>
```

## Switch

```tsx
import * as Switch from "@radix-ui/react-switch";

<Switch.Root
  className="
    relative h-6 w-11 rounded-full
    bg-[#D1D1D1]
    data-[state=checked]:bg-[#4166F5]
    focus:outline-none focus:ring-2 focus:ring-[#4166F5] focus:ring-offset-2
  "
>
  <Switch.Thumb
    className="
      block h-5 w-5 rounded-full bg-white shadow
      transition-transform
      translate-x-0.5
      data-[state=checked]:translate-x-[22px]
    "
  />
</Switch.Root>
```

## Tooltip

```tsx
import * as Tooltip from "@radix-ui/react-tooltip";

<Tooltip.Provider>
  <Tooltip.Root>
    <Tooltip.Trigger asChild>
      <Button variant="icon">
        <Info className="h-4 w-4" />
      </Button>
    </Tooltip.Trigger>
    <Tooltip.Portal>
      <Tooltip.Content
        className="
          rounded-md bg-[#181818] px-3 py-1.5 text-sm text-white
          shadow-md
          data-[state=delayed-open]:animate-in
          data-[state=closed]:animate-out
          data-[state=delayed-open]:fade-in-0
          data-[state=closed]:fade-out-0
        "
        sideOffset={5}
      >
        Helpful information
        <Tooltip.Arrow className="fill-[#181818]" />
      </Tooltip.Content>
    </Tooltip.Portal>
  </Tooltip.Root>
</Tooltip.Provider>
```

## Toast

```tsx
import * as Toast from "@radix-ui/react-toast";

<Toast.Provider>
  <Toast.Root
    className="
      rounded-lg bg-white p-4 shadow-lg
      data-[state=open]:animate-in
      data-[state=closed]:animate-out
      data-[state=open]:slide-in-from-bottom-full
      data-[state=closed]:slide-out-to-right-full
    "
  >
    <Toast.Title className="font-medium text-[#181818]">
      Success
    </Toast.Title>
    <Toast.Description className="text-sm text-[#434343]">
      Your changes have been saved.
    </Toast.Description>
    <Toast.Close aria-label="Close">
      <X className="h-4 w-4" />
    </Toast.Close>
  </Toast.Root>
  <Toast.Viewport className="fixed bottom-4 right-4 w-96" />
</Toast.Provider>
```
