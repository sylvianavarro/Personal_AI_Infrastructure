# WCAG 2.2 Success Criteria Reference

All Level A and AA criteria. AAA marked with `[AAA]`.

---

## Principle 1: Perceivable

### 1.1 Text Alternatives
| SC | Level | Title | Requirement |
|----|-------|-------|-------------|
| 1.1.1 | A | Non-text Content | All non-text content has text alternative |

### 1.2 Time-based Media
| SC | Level | Title | Requirement |
|----|-------|-------|-------------|
| 1.2.1 | A | Audio-only/Video-only | Provide alternatives |
| 1.2.2 | A | Captions (Prerecorded) | Synchronized captions |
| 1.2.3 | A | Audio Description | For video content |
| 1.2.4 | AA | Captions (Live) | Real-time captions |
| 1.2.5 | AA | Audio Description | For all video |

### 1.3 Adaptable
| SC | Level | Title | Requirement |
|----|-------|-------|-------------|
| 1.3.1 | A | Info & Relationships | Structure conveyed programmatically |
| 1.3.2 | A | Meaningful Sequence | Reading order is logical |
| 1.3.3 | A | Sensory Characteristics | Don't rely on shape/size/location only |
| 1.3.4 | AA | Orientation | Don't restrict to single orientation |
| 1.3.5 | AA | Identify Input Purpose | Autocomplete for user data fields |

### 1.4 Distinguishable
| SC | Level | Title | Requirement |
|----|-------|-------|-------------|
| 1.4.1 | A | Use of Color | Color not sole means of conveying info |
| 1.4.2 | A | Audio Control | Pause/stop audio that plays >3s |
| **1.4.3** | **AA** | **Contrast (Minimum)** | **4.5:1 normal, 3:1 large text** |
| 1.4.4 | AA | Resize Text | 200% zoom without loss |
| 1.4.5 | AA | Images of Text | Use real text when possible |
| 1.4.10 | AA | Reflow | No horizontal scroll at 320px |
| **1.4.11** | **AA** | **Non-text Contrast** | **3:1 for UI components/graphics** |
| 1.4.12 | AA | Text Spacing | Support user text spacing adjustments |
| 1.4.13 | AA | Content on Hover/Focus | Dismissible, hoverable, persistent |

---

## Principle 2: Operable

### 2.1 Keyboard Accessible
| SC | Level | Title | Requirement |
|----|-------|-------|-------------|
| 2.1.1 | A | Keyboard | All functionality via keyboard |
| 2.1.2 | A | No Keyboard Trap | Can navigate away from all components |
| 2.1.4 | A | Character Key Shortcuts | Can remap/turn off single-key shortcuts |

### 2.2 Enough Time
| SC | Level | Title | Requirement |
|----|-------|-------|-------------|
| 2.2.1 | A | Timing Adjustable | User can extend time limits |
| 2.2.2 | A | Pause, Stop, Hide | Control moving/blinking content |

### 2.3 Seizures and Physical Reactions
| SC | Level | Title | Requirement |
|----|-------|-------|-------------|
| 2.3.1 | A | Three Flashes | No content flashes >3x/second |

### 2.4 Navigable
| SC | Level | Title | Requirement |
|----|-------|-------|-------------|
| 2.4.1 | A | Bypass Blocks | Skip to main content |
| 2.4.2 | A | Page Titled | Descriptive page titles |
| 2.4.3 | A | Focus Order | Logical focus sequence |
| 2.4.4 | A | Link Purpose | Link text indicates destination |
| 2.4.5 | AA | Multiple Ways | 2+ ways to find pages |
| 2.4.6 | AA | Headings and Labels | Descriptive headings/labels |
| **2.4.7** | **AA** | **Focus Visible** | **Keyboard focus indicator visible** |
| **2.4.11** | **AA** | **Focus Not Obscured (Min)** | **NEW: Focus not fully hidden** |
| [AAA] 2.4.12 | AAA | Focus Not Obscured (Enhanced) | Focus not partially hidden |
| [AAA] **2.4.13** | **AAA** | **Focus Appearance** | **2px, 3:1 contrast** |

### 2.5 Input Modalities
| SC | Level | Title | Requirement |
|----|-------|-------|-------------|
| 2.5.1 | A | Pointer Gestures | Simple alternatives to complex gestures |
| 2.5.2 | A | Pointer Cancellation | Up-event activation, abort mechanism |
| 2.5.3 | A | Label in Name | Accessible name contains visible text |
| 2.5.4 | A | Motion Actuation | Alternatives to device motion |
| 2.5.7 | A | Dragging Movements | NEW: Simple pointer alternative |
| **2.5.8** | **AA** | **Target Size (Minimum)** | **NEW: 24x24 CSS pixels** |

---

## Principle 3: Understandable

### 3.1 Readable
| SC | Level | Title | Requirement |
|----|-------|-------|-------------|
| 3.1.1 | A | Language of Page | Declare page language |
| 3.1.2 | AA | Language of Parts | Declare language changes |

### 3.2 Predictable
| SC | Level | Title | Requirement |
|----|-------|-------|-------------|
| 3.2.1 | A | On Focus | No context change on focus |
| 3.2.2 | A | On Input | No auto context change on input |
| 3.2.3 | AA | Consistent Navigation | Consistent nav order |
| 3.2.4 | AA | Consistent Identification | Same function = same name |
| 3.2.6 | A | Consistent Help | NEW: Help in same location |

### 3.3 Input Assistance
| SC | Level | Title | Requirement |
|----|-------|-------|-------------|
| 3.3.1 | A | Error Identification | Identify and describe errors |
| 3.3.2 | A | Labels or Instructions | Provide input guidance |
| 3.3.3 | AA | Error Suggestion | Suggest corrections |
| 3.3.4 | AA | Error Prevention | Reversible/confirmed submissions |
| 3.3.7 | A | Redundant Entry | NEW: Don't require re-entry |
| 3.3.8 | AA | Accessible Authentication (Min) | NEW: No cognitive tests |

---

## Principle 4: Robust

### 4.1 Compatible
| SC | Level | Title | Requirement |
|----|-------|-------|-------------|
| 4.1.2 | A | Name, Role, Value | Programmatic info for UI |
| 4.1.3 | AA | Status Messages | Announce status without focus |

---

## NEW in WCAG 2.2 (9 Criteria)

| SC | Level | Summary |
|----|-------|---------|
| 2.4.11 | AA | Focus Not Obscured (Minimum) |
| 2.4.12 | AAA | Focus Not Obscured (Enhanced) |
| 2.4.13 | AAA | Focus Appearance |
| 2.5.7 | A | Dragging Movements |
| **2.5.8** | **AA** | **Target Size (Minimum) - 24x24px** |
| 3.2.6 | A | Consistent Help |
| 3.3.7 | A | Redundant Entry |
| 3.3.8 | AA | Accessible Authentication (Minimum) |
| 3.3.9 | AAA | Accessible Authentication (Enhanced) |

---

## Removed in WCAG 2.2

| SC | Title | Note |
|----|-------|------|
| 4.1.1 | Parsing | HTML5 handles this |
