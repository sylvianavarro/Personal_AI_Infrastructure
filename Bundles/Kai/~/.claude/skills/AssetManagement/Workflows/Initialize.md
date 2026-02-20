# Initialize Workflow

Scaffolds the asset directory structure and generates a starter manifest.

## Steps

### 1. Detect Context

Determine scope:
- **Global init** → target is `~/.claude/assets/`
- **Project init** → target is `<project-root>/.claude/assets/`

If user doesn't specify, default to **project init** (more common).

### 2. Check Existing State

- If target directory already exists:
  - List current contents
  - Ask: **merge** (add missing dirs/keys), **overwrite** (replace), or **abort**
- If initializing project and global exists:
  - Offer to copy global manifest as starting point

### 3. Gather Brand Info

Ask the user for:
1. **Brand name** (required)
2. **Primary color** (hex — required)
3. **Secondary color** (hex — optional, will default to muted gray)

Do not ask for more. Start minimal — user can edit manifest later.

### 4. Scaffold Directory Structure

Create:
```
<target>/
├── manifest.json
├── colors/
├── typography/
├── icons/
├── images/
│   ├── logos/
│   ├── patterns/
│   └── references/
└── guidelines/
    └── brand-rules.md
```

### 5. Generate manifest.json

Use the template from `ManifestSchema.md`. Fill in:
- `brand` → user's brand name
- `palette.primary.hex` → user's primary color
- `palette.secondary.hex` → user's secondary color (or `#6B7280` default)
- All other values → template defaults

### 6. Generate brand-rules.md

Create a placeholder with sections:
```markdown
# Brand Rules — {BrandName}

## Voice & Tone
[Describe brand voice — professional, playful, technical, etc.]

## Color Usage
- Primary: Use for CTAs and key interactive elements
- Never combine error + warning colors adjacently

## Logo Usage
- Minimum clear space: 1x logo height on all sides
- Never stretch, rotate, or recolor the logo

## Typography
- Headings: [heading font], weights 600-700
- Body: [body font], weight 400-500
- Never use more than 2 font families on one screen

## Do / Don't
- DO maintain consistent spacing using the spacing unit
- DON'T use colors outside the defined palette
- DON'T use icon styles inconsistent with the manifest
```

### 7. Confirm

Report what was created:
- Full directory listing
- Key manifest values (brand, primary color, contrast ratio)
- Next step: "Edit `manifest.json` to customize, or use **Create** workflow to start making assets"
