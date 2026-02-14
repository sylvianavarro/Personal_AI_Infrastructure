---
name: figma-dev
description: Use when working with Figma Make, Figma MCP, or syncing design tokens between code and Figma. Ensures bidirectional compatibility.
---

# Figma Development Integration

Verified guide for Figma ↔ Code workflows. Last updated: 2026-01-22.

## CRITICAL: Two Different Integration Paths

These are SEPARATE things. Know which one you need:

| Path | Purpose | What It Does | Figma Plan Required |
|------|---------|--------------|---------------------|
| **npm Package → Figma Make** | AI generates UIs | Figma Make uses your React components to build prototypes | Organization ($45-55/user/mo) for private |
| **JSON → Figma Variables** | Designers use tokens | Import tokens as Variables for manual design work | Any (Free = 1 mode only) |

### Path A: npm Package for Figma Make (Recommended)

**For:** AI-generated prototypes using your actual components

```
React Components + CSS Tokens
        ↓
    npm Package (@yourorg/design-system)
        ↓
    Figma Private Registry (Org plan required)
        ↓
    Figma Make imports package
        ↓
    AI generates UI using your components
```

**Requirements:**
- Figma Organization plan (private) or any plan (public package)
- React component library
- `guidelines.md` to teach Make component usage

**Setup (Private):**
1. Create Figma Make file → Settings → Figma npm registry
2. Set scope (e.g., `@invela`)
3. Admin generates auth key
4. Add to `~/.npmrc`:
   ```
   @invela:registry=https://npm.figma.com/
   //npm.figma.com/:_authToken=YOUR_TOKEN
   ```
5. `npm publish`

### Path B: JSON Import for Figma Variables

**For:** Designers using tokens manually in Figma Design

```
primitives.css
        ↓
    tokens.json (DTCG format)
        ↓
    Figma Variables panel → Import
        ↓
    Designers apply manually
```

**Limitations:**
- Native import only supports: color, number, alias
- Does NOT support: shadows, transitions, typography composites
- Simplified to raw CSS values in Figma Make (loses token syntax)
- Free plan = 1 mode only (no light/dark switching)

### When to Use Which

| Scenario | Use Path |
|----------|----------|
| "I want AI to generate UIs with our components" | A (npm) |
| "Designers need tokens in Figma for manual work" | B (Variables) |
| "I want production-ready code output" | A (npm) |
| "I just need colors/spacing in Figma" | B (Variables) |

---

## Figma AI Tools Comparison

| Feature | What It Is | Custom DS Support |
|---------|------------|-------------------|
| **First Draft** | AI wireframe generator | ❌ NO - Uses Figma's built-in libraries only |
| **Figma Make** | Prompt-to-app prototyping | ✅ YES - npm package or library styles |
| **Figma MCP** | Code generation context | ✅ YES - Extracts variables, components, styles |

**Source:** [Figma Help - First Draft](https://help.figma.com/hc/en-us/articles/23955143044247-Use-First-Draft-with-Figma-AI)

## Figma MCP Server - Verified Tools

These are the actual tools available via the Figma MCP server:

### Core Tools

| Tool | Returns | Use Case |
|------|---------|----------|
| `get_design_context` | React + Tailwind code representation | Primary tool - converts selection to code |
| `get_variable_defs` | Variables and styles (colors, spacing, typography) | Extract design tokens from selection |
| `get_screenshot` | Screenshot of selection | Visual reference for implementation |
| `get_metadata` | Sparse XML (layer IDs, names, types, positions, sizes) | Get structure of large designs |
| `get_code_connect_map` | Mapping of Figma node IDs → code component paths | Link Figma components to codebase |
| `create_design_system_rules` | Rule file for agent context | Generate DS rules for code generation |

### How MCP Tools Work

```
┌────────────────────────────────────────────────────────────────┐
│                    FIGMA MCP WORKFLOW                          │
├────────────────────────────────────────────────────────────────┤
│  1. get_design_context  → Structured code representation       │
│  2. get_variable_defs   → Token values used in selection       │
│  3. get_screenshot      → Visual reference                     │
│  4. Implement           → Write code using extracted context   │
└────────────────────────────────────────────────────────────────┘
```

### What MCP Returns

According to [Figma Developer Docs](https://developers.figma.com/docs/figma-mcp-server/tools-and-prompts/):

- **Layer names** → Component identifiers
- **Auto Layout** → Flexbox rules
- **Figma Variables** → CSS custom properties
- **Code Connect mappings** → Import statements

### Access Methods

| Method | Server Type | How It Works |
|--------|-------------|--------------|
| **Selection-based** | Desktop only | Select in Figma app, prompt AI |
| **URL-based** | Remote or Desktop | Paste Figma link in prompt |

### Limitations

- Desktop server: Dev or Full seats on paid plans only
- Remote server: All plans (Starter = 6 tool calls/month)
- Rate limits per Figma REST API tier

**Source:** [Figma MCP Server Guide](https://help.figma.com/hc/en-us/articles/32132100833559-Guide-to-the-Figma-MCP-server)

## Token Naming Convention

### The Translation Pattern

CSS uses flat namespace with dashes. Figma uses hierarchical with slashes.

| CSS Variable | Figma Variable |
|--------------|----------------|
| `--blue-9` | `color/blue/9` |
| `--gray-12` | `color/gray/12` |
| `--text-primary` | `color/text/primary` |
| `--bg-primary` | `color/background/primary` |
| `--space-16` | `spacing/16` |
| `--radius-sm` | `radius/sm` |
| `--shadow-md` | `effect/shadow/md` |

### Figma Collections Structure

```
📁 Primitives (Collection)
├── Mode: Light
├── Mode: Dark
└── Variables:
    ├── color/blue/1 ... color/blue/12
    ├── color/gray/1 ... color/gray/12
    ├── spacing/4, spacing/8, ... spacing/96
    └── radius/none, radius/sm, ... radius/full

📁 Semantic (Collection)
├── Mode: Light
├── Mode: Dark
└── Variables:
    ├── color/text/primary → references color/gray/12
    ├── color/background/primary → references color/gray/1
    └── color/interactive/primary → references color/blue/9
```

### Export/Import Format

Figma now supports W3C Design Tokens Format 1.0 for native import/export.

**Source:** [Schema 2025 Design Systems](https://www.figma.com/blog/schema-2025-design-systems-recap/)

## Radix Primitives Compatibility

### Why Our Tokens Work with Radix

Radix Primitives are **unstyled** - they impose no CSS variable naming convention.

From [Radix Primitives docs](https://www.radix-ui.com/primitives):
- Radix handles: ARIA, keyboard nav, focus management
- You handle: All styling via CSS/Tailwind

### How to Apply Invela Tokens to Radix

**Option 1: CSS Variables (Direct)**
```tsx
<Dialog.Content className="
  bg-[var(--bg-primary)]
  text-[var(--text-primary)]
  border-[var(--border-default)]
  rounded-[var(--radius-xl)]
  shadow-[var(--shadow-lg)]
  p-[var(--space-24)]
">
```

**Option 2: Tailwind Semantic Classes (from our config)**
```tsx
<Dialog.Content className="
  bg-primary
  text-primary
  border-default
  rounded-xl
  shadow-lg
  p-6
">
```

**Option 3: Tailwind Arbitrary with Scale**
```tsx
<Dialog.Content className="
  bg-blue-3
  text-gray-12
  border-gray-6
  rounded-xl
  shadow-lg
  p-6
">
```

### Radix Data-State Styling

Radix exposes state via `data-state` attributes:

```tsx
// Style based on state
<Checkbox.Root className="
  data-[state=checked]:bg-blue-9
  data-[state=unchecked]:bg-gray-3
  data-[state=checked]:border-blue-9
">
```

## Figma Make Integration

### Two Ways to Bring Your Design System

| Method | What Happens | Quality |
|--------|--------------|---------|
| **npm Package** | Make uses your actual React components | Production-ready code |
| **Library Export** | Make extracts CSS from Figma library | Simplified, "div soup" |

### npm Package Method (Recommended)

Per [Figma Developer Docs](https://developers.figma.com/docs/code/bring-your-design-system-package/):

**Package Requirements:**
- React 18+ compatible
- Vite-compatible build
- Published to npm (public or Figma private registry)

**Package Structure:**
```
@invela/design-system/
├── package.json
├── src/
│   ├── primitives.css
│   ├── components/
│   │   ├── Button.tsx
│   │   ├── Badge.tsx
│   │   └── ...
│   └── index.ts
├── guidelines/
│   └── guidelines.md    # Teaches Make how to use components
└── vite.config.ts
```

**guidelines.md Example:**
```markdown
## Button Usage
- Use `<Button>` for primary actions
- Use `<Button variant="secondary">` for secondary actions
- Never use `<Button>` for navigation - use `<Link>`

## Badge Usage
- Use `<Badge status="success">` for positive states
- Always include icon + text, never color alone
```

### Library Export Method (Simpler but Limited)

Per [Figma Help](https://help.figma.com/hc/en-us/articles/33024539096471):

1. In Figma Design: Assets → Libraries → Export for Make
2. In Figma Make: Select Library → Choose exported library
3. Make generates `globals.css` with:
   - Color palettes
   - Typography
   - Variables (as raw values, loses token syntax)
   - Border/radius

**Limitations:**
- Variables become raw CSS values
- Doesn't use actual components
- Output is HTML divs, not production components

## VERIFIED: Code → Figma Import (Tested 2026-01-22)

### Native Figma JSON Import - What Actually Works

Tested with Figma's native Variables → Import feature:

| Token Type | Format | Result |
|------------|--------|--------|
| Color (full DTCG object) | `{"colorSpace":"srgb","components":[r,g,b],"alpha":1}` | ✅ Works |
| Color (simple hex) | `"#4166f5"` | ❌ Ignored |
| Color (rgb string) | `"rgb(65,102,245)"` | ❌ Ignored |
| Color (hex with alpha) | `"#4166f5ff"` | ❌ Ignored |
| Number | `16` | ✅ Works |
| Dimension | `{"value":16,"unit":"px"}` | ✅ Converts to number |
| Aliases | `"{primitives.blue}"` | ✅ Works (references preserved) |
| Shadow | DTCG shadow object | ❌ Not a Variable type |
| Duration | `{"value":100,"unit":"ms"}` | ❌ Ignored |
| $description | `"Description text"` | ⚠️ Reportedly ignored |

### Required Color Format (DTCG 1.0)

**This is the ONLY color format that works:**

```json
{
  "blue-9": {
    "$type": "color",
    "$value": {
      "colorSpace": "srgb",
      "components": [0.255, 0.4, 0.96],
      "alpha": 1
    }
  }
}
```

**Hex to RGB conversion:** Divide each hex component by 255
- `#4166f5` → R: 65/255=0.255, G: 102/255=0.4, B: 245/255=0.96

### Figma Has TWO Separate Systems

| System | What It Stores | Import Method |
|--------|---------------|---------------|
| **Variables** | color, number, string, boolean | Native JSON import ✅ |
| **Effect Styles** | Drop shadows, blur, glow | Plugin only (see below) |
| **Text Styles** | Typography composites | Plugin only |

**Shadows are Effect Styles, NOT Variables.** They cannot be imported via native JSON.

### Multi-Tool Import Strategy

To fully import a design system from code to Figma:

| Token Category | Tool Required | Notes |
|----------------|---------------|-------|
| Colors | Native import | Must use full DTCG object format |
| Spacing | Native import | As numbers |
| Radius | Native import | As numbers |
| Aliases/Semantic | Native import | References work |
| **Shadows** | [Tokens Studio](https://tokens.studio) or [json-to-figma-styles](https://www.figma.com/community/plugin/1557053555293954834) | Creates Effect Styles |
| **Typography** | Tokens Studio | Creates Text Styles |
| Transitions | ❌ Not possible | CSS-only, no Figma equivalent |

### Step-by-Step: Full Code → Figma Import

**Step 1: Generate tokens.json for Variables (colors, spacing, radius)**
```json
{
  "color": {
    "$type": "color",
    "blue-9": {
      "$value": { "colorSpace": "srgb", "components": [0.255, 0.4, 0.96], "alpha": 1 }
    }
  },
  "spacing": {
    "$type": "number",
    "16": { "$value": 16 }
  }
}
```

**Step 2: Import via Figma Variables panel**
- Open Variables panel → Click "Import" → Select JSON file

**Step 3: Install plugin for shadows/typography**
- [Tokens Studio](https://www.figma.com/community/plugin/843461159747178978) - Free tier available
- Or [json-to-figma-styles](https://www.figma.com/community/plugin/1557053555293954834)

**Step 4: Import shadows as Effect Styles via plugin**
- Tokens Studio: Create boxShadow tokens → Export to Figma as Effect Styles
- json-to-figma-styles: Import JSON with shadow definitions

### Tokens Studio Shadow Format

```json
{
  "shadow": {
    "sm": {
      "$type": "boxShadow",
      "$value": {
        "x": "0",
        "y": "1",
        "blur": "2",
        "spread": "0",
        "color": "rgba(0,0,0,0.06)",
        "type": "dropShadow"
      }
    }
  }
}
```

### Plugin Comparison

| Plugin | Free Tier | Shadows | Typography | Variables |
|--------|-----------|---------|------------|-----------|
| **Tokens Studio** | Yes (limited) | ✅ Effect Styles | ✅ Text Styles | ✅ |
| **json-to-figma-styles** | Yes | ✅ | ✅ | ❌ |
| **Elevation Scale** | Yes | ✅ (shadows only) | ❌ | ❌ |

**Source:** Tested locally 2026-01-22

## Verified Workflow: Figma → Code

### Using Figma MCP

```
1. Select component in Figma Desktop
2. Prompt: "Implement this using our design tokens"
3. MCP returns:
   - get_design_context: Code structure
   - get_variable_defs: Token values used
4. Generate code referencing var(--token-name)
```

### Variable Extraction Example

When `get_variable_defs` returns:
```json
{
  "color/text/primary": "#181818",
  "color/background/primary": "#FFFFFF",
  "spacing/16": "16px"
}
```

Map to CSS:
```css
.component {
  color: var(--text-primary);
  background: var(--bg-primary);
  padding: var(--space-16);
}
```

## Compatibility Matrix

| Our Token | Tailwind Class | Radix Compatible | Figma Variable |
|-----------|----------------|------------------|----------------|
| `--blue-9` | `bg-blue-9` | ✅ | `color/blue/9` |
| `--text-primary` | `text-primary` | ✅ | `color/text/primary` |
| `--space-16` | `p-4` | ✅ | `spacing/16` |
| `--radius-xl` | `rounded-xl` | ✅ | `radius/xl` |
| `--shadow-lg` | `shadow-lg` | ✅ | `effect/shadow/lg` |

All tokens work because:
1. CSS variables are framework-agnostic
2. Radix imposes no styling constraints
3. Figma variables map 1:1 with CSS variables
4. Tailwind config references our CSS variables

## Sources (Verified)

### Figma Make & npm Packages
- [Bring Your Design System Package](https://developers.figma.com/docs/code/bring-your-design-system-package/)
- [Use Design System Package in Make](https://help.figma.com/hc/en-us/articles/35946832653975-Use-your-design-system-package-in-Figma-Make)
- [Bring Style Context to Make](https://help.figma.com/hc/en-us/articles/33024539096471-Bring-style-context-from-a-Figma-Design-library-into-Figma-Make)

### Figma MCP
- [Figma MCP Server Guide](https://help.figma.com/hc/en-us/articles/32132100833559-Guide-to-the-Figma-MCP-server)
- [Figma MCP Tools & Prompts](https://developers.figma.com/docs/figma-mcp-server/tools-and-prompts/)

### Figma Variables
- [Figma Variables Guide](https://help.figma.com/hc/en-us/articles/15339657135383-Guide-to-variables-in-Figma)
- [Modes for Variables](https://help.figma.com/hc/en-us/articles/15343816063383-Modes-for-variables)
- [Variables vs Design Tokens](https://www.supernova.io/blog/understanding-the-differences-between-figma-variables-and-design-tokens)

### General
- [First Draft with Figma AI](https://help.figma.com/hc/en-us/articles/23955143044247-Use-First-Draft-with-Figma-AI)
- [Schema 2025: Design Systems](https://www.figma.com/blog/schema-2025-design-systems-recap/)
- [Radix Primitives](https://www.radix-ui.com/primitives)
- [Figma Pricing](https://www.figma.com/pricing/)
