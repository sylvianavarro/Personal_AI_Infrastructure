---
name: AnimationCopycat
description: Analyze video frames to reverse-engineer animations and produce Remotion recreation plans adapted to the Invela design system. USE WHEN recreating animations, analyzing video frames, copying animation styles, or planning Remotion compositions from reference material.
---

# AnimationCopycat

Reverse-engineer animations from video frames and produce actionable Remotion recreation plans adapted to the Invela design system.

## How It Works

1. **Input**: Path to a video file (mp4/webm/mov), a directory of sequential frames (PNG/JPG), or a single reference image
2. **Extraction**: If video file, uses ffmpeg to extract key frames at configurable density
3. **Analysis**: Reads every frame, diffs consecutive frames, infers tweening and easing
4. **Output**: Structured 6-section analysis document with Invela DS adaptation

## Workflow Routing

| Workflow | Trigger | File |
|----------|---------|------|
| **Analyze** | "analyze these frames", "recreate this animation", "copycat this video" | `Workflows/Analyze.md` |
| **ExtractFrames** | "extract frames from this video", "break down this video" | `Workflows/ExtractFrames.md` |

## Examples

**Example 1: Analyze a set of exported frames**
```
User: "/animation-copycat /Users/me/Downloads/animation_references/1_onepassword"
-> Reads all frames in directory
-> Produces visual inventory, animation timeline, Remotion plan
-> Maps all visual elements to Invela design system
```

**Example 2: Analyze a single reference image**
```
User: "Use animation-copycat to analyze this screenshot for recreation"
-> Reads the single image
-> Produces composition analysis with inferred animation
-> Creates explicit change callouts for Invela adaptation
```

**Example 3: Analyze a video file directly**
```
User: "/animation-copycat /Users/me/Downloads/demo.mp4"
-> Detects video file, extracts frames via ffmpeg
-> Auto-detects scene boundaries and animation phases
-> Groups frames into logical sections
-> Runs full analysis pipeline on extracted frames
```

**Example 4: Re-analyze with more frames added**
```
User: "I added more frames to the directory, re-run animation-copycat"
-> Re-reads all frames including new ones
-> Updates analysis with better motion inference
-> Refines easing and timing estimates
```
