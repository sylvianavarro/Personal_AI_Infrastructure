# ExtractFrames Workflow

## Purpose

Accept a video file (mp4, webm, mov, gif) and intelligently extract frames for analysis by the Analyze workflow. Handles the full pipeline: detect video properties, extract frames, group into animation phases, then hand off to Analyze.

## Prerequisites

- `ffmpeg` must be installed (verified via `which ffmpeg`)
- `ffprobe` must be installed (comes with ffmpeg)

## Execution Steps

### Step 1: Validate Input

1. Check the provided path is a valid video file
2. Accepted extensions: `.mp4`, `.webm`, `.mov`, `.gif`, `.avi`, `.mkv`
3. If the path is a directory (not a video file), skip this workflow and route directly to `Analyze.md`
4. If the path is a single image file, skip this workflow and route directly to `Analyze.md`

### Step 2: Probe Video Metadata

Run ffprobe to extract video properties:

```bash
ffprobe -v quiet -print_format json -show_format -show_streams "[VIDEO_PATH]"
```

Extract and record:
- **Duration** (seconds)
- **Frame rate** (fps)
- **Resolution** (width x height)
- **Total frame count** (duration * fps)
- **Codec** (h264, vp9, etc.)

### Step 3: Determine Extraction Strategy

Based on video properties, choose frame extraction density:

| Video Duration | Strategy | Frames Extracted |
|----------------|----------|------------------|
| < 2 seconds | Every frame | All frames (up to 60) |
| 2-5 seconds | High density | 1 frame per 100ms (10 fps sampling) |
| 5-15 seconds | Medium density | 1 frame per 200ms (5 fps sampling) |
| 15-30 seconds | Low density | 1 frame per 500ms (2 fps sampling) |
| 30-60 seconds | Sparse | 1 frame per 1000ms (1 fps sampling) |
| > 60 seconds | Scene-change only | Use ffmpeg scene detection |

**Maximum frame budget:** 120 frames (to stay within Claude's analysis capacity).

If total extracted frames would exceed 120, reduce density until under budget.

### Step 4: Create Output Directory

Create a frames directory adjacent to the video:

```bash
# If video is at /path/to/animation.mp4
# Create /path/to/animation_frames/
mkdir -p "[VIDEO_DIR]/[VIDEO_NAME]_frames"
```

### Step 5: Extract Frames

Use ffmpeg to extract frames based on the chosen strategy:

**Standard extraction (fixed fps):**
```bash
ffmpeg -i "[VIDEO_PATH]" -vf "fps=[SAMPLE_FPS]" -frame_pts 1 "[OUTPUT_DIR]/frame_%04d.png"
```

**Scene-change extraction (for long videos):**
```bash
ffmpeg -i "[VIDEO_PATH]" -vf "select='gt(scene,0.3)',showinfo" -vsync vfr "[OUTPUT_DIR]/scene_%04d.png" 2>&1
```

**Every-frame extraction (for very short clips):**
```bash
ffmpeg -i "[VIDEO_PATH]" "[OUTPUT_DIR]/frame_%04d.png"
```

### Step 6: Phase Detection (Group Frames into Animation Sections)

After extraction, read all frames sequentially and group them into logical animation phases.

**Phase detection heuristics:**
1. **Visual similarity clustering** — Frames where the same elements are visible and moving in the same pattern form a phase
2. **Element appearance/disappearance** — A new element entering or existing element leaving marks a phase boundary
3. **Motion direction change** — If elements reverse direction, that's a new phase
4. **Color palette shift** — Significant color change indicates a new phase
5. **Static periods** — Multiple consecutive identical frames mark a pause/hold

**Output format:**
```
## Animation Phases

### Phase 1: "[descriptive name]" (frames 1-15, ~0.0s - 1.5s)
- Description: [what's happening]
- Key elements: [list]
- Motion type: [rotation/translation/scale/fade/etc.]

### Phase 2: "[descriptive name]" (frames 16-30, ~1.5s - 3.0s)
...
```

**For looping animations** (common case): if the last phase visually matches the first, note:
```
Loop detected: Phase [N] returns to Phase 1 start state. Total loop duration: [X]s
```

### Step 7: Hand Off to Analyze

Once frames are extracted and phases are identified:

1. Pass the output directory path to the `Analyze.md` workflow
2. Include the phase groupings as context (so Analyze can structure its timeline around phases)
3. Include the original video metadata (fps, duration, resolution)

**Handoff format:**
```
EXTRACTED FROM VIDEO:
- Source: [video path]
- Duration: [X]s at [Y] fps ([Z] total frames)
- Resolution: [W]x[H]
- Extracted: [N] frames at [sample_fps] fps sampling
- Output: [frames directory path]

DETECTED PHASES:
[phase list from Step 6]

Proceeding to Analyze workflow...
```

Then execute the Analyze workflow with the frames directory as input.

## Error Handling

- **ffmpeg not found:** Tell the user to install ffmpeg (`brew install ffmpeg` on macOS)
- **Corrupt/unreadable video:** Report the ffprobe error and ask for a different file
- **Extremely long video (> 5 min):** Warn the user that analysis will be limited to scene-change frames. Suggest trimming the video to the relevant section first.
- **Very high resolution (> 4K):** Extract frames at reduced resolution for faster analysis: add `-vf "scale=1920:-1"` to ffmpeg command

## Quality Notes

- PNG format for extracted frames (lossless, better for color analysis)
- Frame numbering starts at 0001 for consistent sorting
- Preserve original aspect ratio in all extractions
- For GIF input: be aware of limited color palette (256 colors max) — note this in the handoff
