# Analyze Workflow

## Purpose

Take a directory of sequential animation frames (or a single reference image) and produce a comprehensive, actionable analysis document for recreating the animation in Remotion, adapted to the Invela design system.

## Execution Steps

### Step 0: Load Context

Before analysis, load the Invela brand context:

**Invela Brand Colors:**
- Deep Blue: `#4166F5` (primary brand, CTAs)
- Middle Blue: `#9EC0F5` (secondary, accents)
- Light Blue: `#ECF2FD` (backgrounds, hover states)
- Deep Blue Tint: `#D9E0FD` (badge hover)
- AI Violet: `#4D14D8` (AI features, gradients)
- AI Lavender: `#C7B0FF` (AI accents)
- Black: `#181818` (primary text, dark bg)
- White: `#FFFFFF` (backgrounds)
- Dark Gray: `#222529` | Medium Gray: `#434343` | Gray: `#B7B7B7`
- Light Gray: `#D1D1D1` | Lighter Gray: `#E1E1E1` | Very Light: `#EBEBEB`

**Invela AI Gradient:** `linear-gradient(135deg, #4D14D8, #4166F5)` — primary AI gradient

**Invela Shadow Color:** `rgba(0, 13, 66, opacity)` (light mode) — blue-tinted shadows from `#000D42`

**Invela Typography:**
- Plus Jakarta Sans (Bold/SemiBold headings, Light body)
- Lexend (Light/Extra Light marketing)
- Sulphur Point (Bold ALL CAPS labels)
- JetBrains Mono (monospace)
- Size scale: 12, 14, 16, 20, 24, 32, 48px

**Invela Spacing:** 4px grid — 2, 4, 8, 12, 16, 20, 24, 32, 40, 48, 64, 80, 96

**Invela Logo:** Ring shape with signature notch. SVG paths in `remotion/src/compositions/LoadingSpinner.tsx`:
- `INVELA_LOGO_PATH` — the ring
- `NOTCH_PATH` — the notch rectangle
- Native dimensions: 137x139px, center (68.3, 69.5), radius 49.5, stroke 19.3

**Invela Remotion Patterns:** Existing LoadingSpinner composition at 200x200, 30fps.
Key techniques used: conic-gradient backgrounds, SVG mask-image for ring shapes, AbsoluteFill, useCurrentFrame().

### Step 0.5: Input Detection

Check the provided path:
1. **Video file** (`.mp4`, `.webm`, `.mov`, `.gif`, `.avi`, `.mkv`): Route to `ExtractFrames.md` workflow first, then return here with the extracted frames directory.
2. **Directory**: Continue to Step 1 (frame discovery).
3. **Single image file**: Continue to Step 1 (will enter single-frame mode).

### Step 1: Discover and Read Frames

1. Use `Glob` to find all image files in the provided directory path: `**/*.{png,jpg,jpeg,webp,gif}`
2. Sort files by name (alphabetical = sequential order)
3. Count total frames and note the naming pattern
4. Read EVERY frame using the `Read` tool (Claude is multimodal and can analyze images)

**If single frame:** Proceed in **single-frame inference mode** — analyze composition and infer likely animation from visual cues.
**WARNING: Single-frame analysis will ONLY capture the composition at one moment. It WILL miss multi-phase animations (3D tumbles, transitions, text reveals, scene changes). Always recommend video/multi-frame input when available.**

**If multiple frames:** Proceed in **multi-frame diff mode** — full frame-by-frame delta analysis.

### Step 2: Per-Frame Analysis

For EACH frame, document with confidence markers:

```
### Frame [N]: [filename]

**Elements visible:**
- [Element name]: [shape/type], proportional size [% of canvas], color [hex] [OBSERVED]
  - Confidence: [HIGH/MEDIUM/LOW] — [reason if not HIGH]
- (repeat for every distinct visual element)

**Background:** [solid color / gradient / image — describe fully] [OBSERVED]
**Effects:** [shadows, blurs, glows, grain, masks] [OBSERVED]
**Text:** [content, estimated font, size, weight, color] [OBSERVED]
**Brand marks:** [logos, icons — identify brand/product] [OBSERVED]
```

**IMPORTANT — Use proportional sizing:**
- Describe element sizes as % of canvas width/height, NOT absolute pixels
- Example: "Ring diameter = ~72% of canvas width" rather than "~340px"
- This ensures the analysis works regardless of composition output size
- Only convert to pixels in the Remotion plan section when choosing a specific canvas size

**IMPORTANT — For concentric/ring layouts, specify GAP UNIFORMITY:**
- Measure the gap between each pair of adjacent rings (edge-to-edge)
- Note whether gaps are uniform (all equal) or vary (specify each)
- Express gaps as % of canvas: "Ring 1→2 gap: ~6% of canvas width"
- This is CRITICAL for getting the spatial rhythm right

**IMPORTANT — Stroke width as ratio:**
- For rings/circles, express stroke width as ratio of the ring's diameter
- Example: "Main ring stroke = ~7.4% of ring diameter" (not just "28px")
- This ensures proportional scaling at any output size

**IMPORTANT — Gradient arc coverage:**
- For partial gradients, specify the VISIBLE ARC in degrees
- Example: "Ring 3: visible arc = ~300° (colored), ~60° transparent"
- The ratio of visible-to-transparent defines the ring's visual weight

**IMPORTANT — Color precision:**
- Hex values are estimated from visual inspection of a compressed image
- Mark color confidence: HIGH (solid flat fill, clearly identifiable), MEDIUM (gradient, could be off by ±10 in RGB), LOW (blurred, semi-transparent, or small area)
- Suggest verification with a color picker tool for critical brand colors

### Step 2.5: Single-Frame Animation Inference (single-frame mode only)

When working from a single frame, use these visual heuristics to infer animation:

| Visual Cue | Inferred Animation | Confidence |
|------------|-------------------|------------|
| Conic/angular gradient on a circular element | Rotation (linear, continuous) | HIGH |
| Radial gradient (center→edge) | Scale pulse or breathing | MEDIUM |
| Directional blur/motion streak | Translation in blur direction | HIGH |
| Offset drop shadow | Depth motion (Z-axis) or floating bounce | MEDIUM |
| Gradient with transparent sections | Partial reveal, wipe, or rotation showing/hiding | HIGH |
| Multiple concentric elements | Independent rotation at different speeds | HIGH |
| Starburst/ray pattern | Rotation or pulsing | MEDIUM |
| Glow/bloom effect | Opacity pulse or intensity breathing | MEDIUM |
| Skewed/perspective transform | 3D rotation or flip | MEDIUM |
| Concentric rings/circles at rest | May involve 3D tumble not visible in resting state | LOW — **video required** |
| 3D sphere-like center element | Full 3D animation likely (WebGL/Three.js) | HIGH |
| Particle-like scattered elements | Drift, float, or explosion | LOW |

Mark ALL inferred animations with `[INFERRED]` and confidence level.
State: "Animation inferred from single frame — verify with video source if available."

### Step 3: Inter-Frame Diff Analysis (multi-frame only)

For EACH consecutive pair of frames (N → N+1):

```
### Delta: Frame [N] → Frame [N+1]
**Changed elements:**
- [Element]: [property] changed from [value] to [value] [OBSERVED]
  - Delta magnitude: [small/medium/large]
  - Inferred easing: [linear/ease-in/ease-out/ease-in-out/spring]

**New elements:** [any elements that appeared]
**Removed elements:** [any elements that disappeared]
**Unchanged:** [elements that remained static]
```

**Tween inference rules:**
- Constant deltas between frames → `linear`
- Small→large deltas → `ease-in` (accelerating)
- Large→small deltas → `ease-out` (decelerating)
- Small→large→small deltas → `ease-in-out`
- Overshoot past target then settle → `spring`
- Sudden appearance → opacity 0→1 or scale 0→1
- If only 1-2 frames of data, note "insufficient data, assuming ease-in-out"

### Step 3.5: Element Lifecycle Tracking (multi-frame only)

**Frame-to-frame deltas show LOCAL changes. Lifecycle tracking shows the GLOBAL trajectory of individual elements.**

Pick 2-3 representative elements and track each one across EVERY frame it appears in — from entry (first visible at edge) through focus (center position) to exit (disappears off opposite edge).

```
### Lifecycle: "[Element Name]"

| Frame | Y (% top) | Scale | Blur (px) | Opacity | Slot Position | Phase |
|-------|-----------|-------|-----------|---------|---------------|-------|
| 30    | 88%       | 0.37  | 9px       | 0.22    | -3 (entering) | HOLD  |
| 31    | 88%       | 0.37  | 9px       | 0.22    | -3            | HOLD  |
| ...   | ...       | ...   | ...       | ...     | ...           | SNAP  |
| 56    | 44%       | 1.0   | 0px       | 1.0     | 0 (focused)   | HOLD  |
| ...   | ...       | ...   | ...       | ...     | ...           | SNAP  |
| 82    | 0%        | 0.37  | 9px       | 0.22    | +3 (exiting)  | HOLD  |
```

**Extract from lifecycle data:**
1. **Motion curve shape** — Plot Y-over-time. Is it sinusoidal (true cylinder)? Linear? Something else?
2. **Symmetry** — Does entering from bottom mirror exiting at top? Or is there asymmetry?
3. **Property correlation** — Do scale, blur, opacity follow the same curve as Y, or are they independent?
4. **Transition consistency** — Is the snap easing identical at every slot boundary, or does it vary?
5. **Dwell time distribution** — Are hold durations truly equal across all positions, or do they vary by slot?

**Why this matters:**
- Frame deltas tell you "what changed between two adjacent frames"
- Lifecycle tracking tells you "what the full journey of an element looks like"
- The lifecycle is what determines the correct mathematical model (cylinder, flat list, ellipse, etc.)
- Without lifecycle data, you're stitching together local observations and hoping they form a coherent global curve

### Step 3.6: Multi-Agent Orchestration (>80 frames)

When the frame set exceeds ~80 images, split into batches for parallel analysis:

1. **Calculate batch boundaries** with 5-frame overlap between adjacent batches
2. **Dispatch subagents** — each agent gets its batch of frames plus instructions for Steps 2-3
3. **Overlap reconciliation** — compare measurements in the overlap zone to detect calibration drift between agents
4. **Lifecycle assignment** — assign specific elements for lifecycle tracking (Step 3.5) to the agent whose batch covers the most of that element's visible arc

```
Batch Plan:
  Agent 1: frames 001-065 (65 frames)
  Agent 2: frames 061-119 (59 frames, 5-frame overlap at 61-65)
  Overlap check: both agents report frames 61-65, compare measurements
  Lifecycle: Agent 1 tracks "Element A" (enters around frame 20)
             Agent 2 tracks "Element B" (enters around frame 70)
```

### Step 4: Compile Output Document

Produce a markdown document with these 6 sections:

---

## Section 1: Visual Inventory

Catalog every distinct visual element across all frames.

| # | Element | Type | Colors (hex) | Proportional Size | Stroke Ratio | Position | Layer (z) | Animated? | Color Confidence |
|---|---------|------|--------------|-------------------|--------------|----------|-----------|-----------|------------------|

For each element also note:
- **Exact colors** with hex values — mark confidence (HIGH/MEDIUM/LOW)
- **Gradients** with direction and color stops as DEGREES (0° = top/12 o'clock, 90° = right/3 o'clock, 180° = bottom/6 o'clock, 270° = left/9 o'clock)
- **Gradient arc coverage**: how many degrees are visible vs transparent (e.g., "280° visible, 80° transparent")
- **Stroke width ratio**: for rings/borders, express as % of the element's own diameter
- **Borders** with width, style, color, radius
- **Shadows** with offset, blur, spread, color
- **Opacity** if not fully opaque
- **Blur/filter effects** if any
- **3D/depth effects**: describe intensity (subtle/medium/strong), highlight direction, shadow direction. For tube/glass effects, note the cross-section appearance (highlight on which edge, shadow on which edge, specular position)

**For concentric layouts, also provide a spacing table:**

| Gap | From → To | Edge-to-Edge Distance (% of canvas) |
|-----|-----------|-------------------------------------|
| Gap 1 | Ring 1 outer → Ring 2 outer | X% |

Note whether gaps are UNIFORM or VARYING.

**For composition-level effects:**
- Drop shadow under entire composition? Describe offset, blur, spread, color
- Background glow/halo? Describe radius, color, opacity

---

## Section 2: Animation Timeline

Organize all motion into a timeline. Mark each entry as `[OBSERVED]` or `[INFERRED]`.

```
[0ms - 200ms]  SCENE 1: "Name"
  - Element A: opacity 0 → 1 (ease-out) [OBSERVED]
  - Element B: scale 0.8 → 1.0 (spring, tension 200) [INFERRED, confidence: MEDIUM]
```

Include:
- **Estimated total duration** based on frame count and assumed fps
- **Loops vs one-shot** — does the animation repeat?
- **Stagger patterns** — do elements animate in sequence with offsets?
- **Easing functions** — specific curves with Remotion-compatible names
- **Speed ratios** — if multiple elements animate, note relative speeds
- **Direction** — clockwise (CW), counter-clockwise (CCW), or other

---

## Section 3: Remotion Recreation Plan

Concrete plan for implementing in Remotion.

### 3.1 Composition Setup
```typescript
{
  id: "[descriptive-name]",
  width: [px],
  height: [px],
  fps: 30,
  durationInFrames: [calculated],
}
```

Also provide a dark mode variant composition:
```typescript
{
  id: "[descriptive-name]-Dark",
  width: [px],
  height: [px],
  fps: 30,
  durationInFrames: [calculated],
}
```

### 3.2 Component Architecture
- List React components needed
- Describe props for each (with TypeScript interface)
- Note shared utilities (easing functions, color helpers)

### 3.3 Animation Implementation
For each animated element, provide a CONCRETE code pattern:

```typescript
// Element: [name]
// Remotion approach: [useCurrentFrame + interpolate / spring / Sequence]
const frame = useCurrentFrame();
const rotation = interpolate(frame, [0, periodFrames], [0, 360], {
  extrapolateRight: 'extend', // for continuous rotation
});
```

### 3.4 CSS Recipes

**Ring masking (creating a ring shape from a gradient div):**
```css
/* Method 1: SVG mask (used by LoadingSpinner) */
WebkitMaskImage: url("data:image/svg+xml,...ring-svg..."),
WebkitMaskSize: "100% 100%",

/* Method 2: Radial gradient mask (simpler, less precise) */
WebkitMaskImage: radial-gradient(
  circle at center,
  transparent [innerRadius]px,
  black [innerRadius + 1]px,
  black [outerRadius - 1]px,
  transparent [outerRadius]px
),
```

**3D tube/glass effect on a ring (LAYERED APPROACH — proven effective):**

The tube effect requires MULTIPLE layers, not just one overlay. This creates a convincing convex tube:

```
Layer 1: Base color gradient (conic-gradient, ROTATES with ring)
Layer 2: Specular highlight band (thin bright strip along inner-upper edge, FIXED)
Layer 3: Shadow band (dark strip along outer-lower edge, FIXED)
Layer 4: Overall directional lighting (radial gradient, FIXED)
```

Layers 2-4 do NOT rotate — the light source stays fixed while color rotates underneath.

```css
/* Layer 2: Specular highlight — thin ring mask along inner 30% of stroke */
background: linear-gradient(160deg, rgba(255,255,255,0.55) 0%, rgba(255,255,255,0.27) 30%, transparent 55%);
mask: radial-gradient(circle, transparent [innerR]px, black [innerR+1]px, black [innerR + stroke*0.35]px, transparent [innerR + stroke*0.35 + 1]px);
filter: blur(2px);

/* Layer 3: Shadow — thin ring mask along outer 30% of stroke */
background: linear-gradient(160deg, transparent 40%, rgba(0,13,66,0.17) 65%, rgba(0,13,66,0.35) 100%);
mask: radial-gradient(circle, transparent [outerR - stroke*0.35]px, black [outerR - stroke*0.35 + 1]px, black [outerR-1]px, transparent [outerR]px);
filter: blur(2px);

/* Layer 4: Overall directional lighting */
background: radial-gradient(ellipse 150% 70% at 40% 28%, rgba(255,255,255,0.30) 0%, transparent 45%, rgba(0,13,66,0.16) 100%);
```

**Intensity levels for tube effect:**
- **Subtle**: highlight alpha 0.25, shadow alpha 0.20, blur 1px — for thin accent rings
- **Medium**: highlight alpha 0.40, shadow alpha 0.28, blur 1.5px — for medium rings
- **Strong**: highlight alpha 0.70, shadow alpha 0.40, blur 2px — for hero/main rings

Always specify which intensity level each ring should use.

**IMPORTANT — 3D Tube Quality Indicators:**
A convincing tube effect must pass these checks:
- [ ] **Crisp catchlight**: at least one ultra-thin (2-3px), high-alpha (0.8+), unblurred specular line for a sharp light reflection
- [ ] **Soft glow**: a broader, blurred highlight band adjacent to the catchlight for diffuse lighting
- [ ] **Inner-edge darkening**: subtle shadow at the very inner edge of the ring (the "underside" of the tube)
- [ ] **Color-tinted highlights**: specular highlights should pick up a hint of the underlying gradient color, not be pure white
- [ ] **Shadow-side depth**: the outer edge shadow should darken enough that the ring appears to curve away from the light
- [ ] **Per-ring shadow**: each ring should cast a very subtle shadow on the ring behind it (optional, for premium feel)
If the source animation has tube/glass effects and these indicators aren't met, the fidelity will suffer.

### 3.5 Technical Challenges
- SVG vs DOM rendering decisions
- Gradient implementation approach
- Performance considerations
- Any effects that need special handling

### 3.6 Asset Requirements
| Asset | Type | Source | Notes |
|-------|------|--------|-------|
| [logo/icon] | SVG | Create/trace | [details] |

---

## Section 4: Customization Callouts

**EXPLICIT list of every element that should be swapped or modified.**

Format each as a clear directive:

```
SWAP: [Original element description]
  FROM: [what it currently is — be specific: color hex, logo name, text, etc.]
  TO: [what to replace with — specific Invela token/value]
  REASON: [why this change is needed]
```

Categories to cover:
- **Logos/Brand Marks**: Replace source brand with Invela logo
- **Colors**: Map every color to Invela palette — use token names + hex
- **Typography**: Map fonts to Invela font stack
- **Text Content**: Replace brand-specific copy
- **Icons**: Replace with Lucide equivalents
- **Sizing/Spacing**: Adjust to 4px grid
- **Effects**: Adjust shadows/glows to Invela effect system (#000D42)

---

## Section 5: Invela Design System Adaptation

**Detailed mapping from original visual language to Invela DS.**

### 5.1 Color Mapping (Light Mode)
| Original Color | Hex | Invela Token | Token Hex | Usage | Rationale |
|----------------|-----|-------------|-----------|-------|-----------|
| [color name] | [#xxx] | [token name] | [#xxx] | [use] | [why this mapping] |

**Be OPINIONATED** — give THE recommended mapping, not multiple options. If a gradient needs to be recreated, provide the exact Invela gradient:

```css
/* RECOMMENDED Invela gradient for [original gradient description] */
background: conic-gradient(from 0deg, #ECF2FD 0deg, #9EC0F5 72deg, #4166F5 144deg, #C7B0FF 216deg, #4D14D8 288deg, #ECF2FD 360deg);
```

### 5.2 Color Mapping (Dark Mode)
Provide a SEPARATE mapping for dark mode using Invela dark palette:
- Background: `#181818`
- Text/logos: White on dark
- Deep Blue: Same `#4166F5` (stays consistent)
- Adjust grays and subtle colors for dark context

### 5.3 Typography Mapping
| Original Font | Weight | Size | Invela Font | Weight | Size |
|---------------|--------|------|-------------|--------|------|

### 5.4 Logo/Mark Replacement
- Describe how to replace the original brand mark with the Invela logo
- Provide sizing ratio: original mark proportional size → Invela logo proportional size
- Note any special treatments (glow, shadow, rotation) to preserve
- Reference existing SVG paths: `INVELA_LOGO_PATH` and `NOTCH_PATH`

### 5.5 Spacing Adjustments
| Original (est.) | Nearest 4px Grid | Element |
|-----------------|-------------------|---------|

### 5.6 Effect Adjustments
| Original Effect | Invela CSS |
|-----------------|-----------|
| [effect] | [exact CSS] |

### 5.7 Mood/Tone Preservation
- **Original essence:** [describe the feel in 2-3 sentences]
- **What carries over:** [emotional qualities preserved]
- **What shifts:** [how the Invela palette changes the feel]

### 5.8 Reconstruction Fidelity Rating

Rate how closely the Invela adaptation can match the original's visual impact:

**Fidelity: [X]%**
- **Structure:** [HIGH/MEDIUM/LOW] — Can the layout/composition be matched exactly?
- **Motion:** [HIGH/MEDIUM/LOW] — Can the animation timing/easing be matched?
- **Color feel:** [HIGH/MEDIUM/LOW] — Does the Invela palette capture the same energy?
- **Effects:** [HIGH/MEDIUM/LOW] — Can 3D/glow/depth effects be replicated?
- **Overall impression:** [1-2 sentence summary of what the viewer will feel differently]

---

## Section 6: Implementation Handoff

Structured spec for a Remotion implementation agent.

```json
{
  "composition": {
    "id": "[name]",
    "width": 0,
    "height": 0,
    "fps": 30,
    "durationInFrames": 0,
    "variants": ["light", "dark"]
  },
  "scenes": [
    {
      "name": "[scene name]",
      "startFrame": 0,
      "endFrame": 0,
      "elements": [
        {
          "name": "[element]",
          "type": "[shape|text|image|svg]",
          "proportionalSize": "72% of canvas width",
          "animations": [
            {
              "property": "[opacity|translateX|scale|rotate|etc]",
              "from": 0,
              "to": 1,
              "easing": "linear",
              "startFrame": 0,
              "endFrame": 30,
              "loop": false,
              "periodFrames": null,
              "direction": "CW"
            }
          ],
          "style": {
            "light": { "color": "#hex", "backgroundColor": "#hex" },
            "dark": { "color": "#hex", "backgroundColor": "#hex" }
          }
        }
      ]
    }
  ],
  "assets": [
    {
      "name": "[asset]",
      "type": "[svg|font|image]",
      "path": "[relative path or 'CREATE' or 'EXISTING: path']"
    }
  ],
  "fileStructure": [
    "remotion/src/compositions/[Name].tsx",
    "remotion/src/compositions/components/[ComponentName].tsx"
  ]
}
```

Also include:
- **File structure** recommendation for the Remotion project
- **Dependencies** needed beyond core Remotion
- **Build/render command** for testing
- **Handoff file output** — optionally save the handoff JSON to `remotion/src/compositions/[name].handoff.json`

---

## Section 7: Validation Loop

After implementation, run a render-compare-fix cycle:

### 7.1 Still Frame Validation
1. Render a Remotion still at a HOLD frame (where items are settled)
2. Find the equivalent source frame (same scroll position / layout)
3. Show BOTH images side by side to the user
4. Score 10 categories (1-5 each): text alignment, Y positions, scale progression, blur, opacity, tilt, arrow, spacing compression, visible items, overall
5. Identify top 3 divergences with specific fixes (code changes)

### 7.2 Transition Validation
1. Render 3-5 consecutive frames spanning a SNAP transition
2. Find the equivalent source frames
3. Compare: easing curve, direction, smoothness, element ordering
4. Verify scroll direction (bottom-to-top vs top-to-bottom)

### 7.3 Lifecycle Validation
1. Render an element's full journey (entry → focus → exit)
2. Compare the Y/scale/blur/opacity trajectory against source lifecycle data
3. Verify the mathematical model (cylinder, linear, etc.) matches the source

### 7.4 Iterate
- Apply fixes → re-render → re-compare until score ≥ 45/50
- Each iteration is a version (v1, v2, v3...) with comparison artifacts saved
- Track score progression: v1: X/50 → v2: Y/50 → v3: Z/50

---

## Quality Checklist (Self-Review Before Outputting)

Before delivering the analysis, verify:

**Visual Inventory:**
- [ ] Every visible element in every frame is cataloged
- [ ] All colors are hex values with confidence markers (HIGH/MEDIUM/LOW)
- [ ] Sizes are proportional (% of canvas), not guessed pixel values
- [ ] Stroke widths are expressed as % of element diameter
- [ ] Gradient stops use degree notation (0°-360°)
- [ ] Gradient arc coverage specified (visible degrees vs transparent degrees)
- [ ] For concentric layouts: gap uniformity table provided
- [ ] 3D/depth effects described with intensity level (subtle/medium/strong)
- [ ] Composition-level effects (drop shadow, glow) cataloged separately
- [ ] Background warmth/tone noted (pure white vs warm white vs cool gray)
- [ ] Ambient glow/halo behind composition described (if present)
- [ ] Thin elements checked for minimum visibility at all rotation angles

**Loop Math:**
- [ ] Recommended rotation periods divide cleanly into total duration (or mismatch is imperceptible)
- [ ] If periods don't share a clean LCM, note the loop seam behavior

**Animation:**
- [ ] Timeline has specific durations, easing, and [OBSERVED]/[INFERRED] markers
- [ ] Speed ratios between elements specified
- [ ] Rotation directions specified (CW/CCW)
- [ ] Scroll/motion direction specified (bottom-to-top, left-to-right, etc.)

**Lifecycle Tracking (multi-frame):**
- [ ] At least 2 representative elements tracked across full visible arc
- [ ] Y/scale/blur/opacity recorded at every frame for tracked elements
- [ ] Motion curve shape identified (sinusoidal, linear, exponential, etc.)
- [ ] Symmetry between entry and exit paths verified or noted
- [ ] Property correlation checked (do all properties follow same curve?)
- [ ] Transition consistency verified across all slot boundaries

**Remotion Plan:**
- [ ] Code patterns are concrete TypeScript (not pseudocode)
- [ ] CSS recipes for ring masking and layered 3D tube effects included
- [ ] Tube effect intensity level specified per element
- [ ] Both light AND dark compositions specified

**Adaptation:**
- [ ] Every customization callout has FROM (with hex) and TO (with Invela token + hex)
- [ ] Invela color mapping covers every color in BOTH light and dark mode
- [ ] Logo replacement references existing SVG paths
- [ ] Handoff JSON includes both light/dark variants
- [ ] Mood/tone section is specific (not generic)
- [ ] Fidelity rating included with per-category breakdown

If any checklist item fails, go back and fix it before outputting.
