# Invela Design System Quick Reference (for AnimationCopycat)

## Brand Values

All color, typography, and spacing values are maintained in the `invela-brand` skill (single source of truth). Reference these files for authoritative values:

- **Colors**: `invela-brand/colors.md` — full 12-step blue/gray scales, AI colors, status colors, semantic tokens
- **Typography**: `invela-brand/typography.md` — font stack (Plus Jakarta Sans, Lexend, Sulphur Point), size scale, weights
- **Spacing**: `invela-brand/spacing.md` — 4px base grid, 16-value scale
- **Shadows**: `invela-brand/shadows.md` — blue-tinted light mode, elevation dark mode
- **Transitions**: `invela-brand/transitions.md` — duration/easing tokens

### Quick Color Anchors (for animation mapping)

When adapting reference animations to Invela, map to these key tokens (see `invela-brand/colors.md` for full values):
- **Primary brand**: Deep Blue `#4166F5`
- **Secondary**: Middle Blue `#9EC0F5`
- **AI accent**: AI Violet `#4D14D8`
- **Dark bg**: `#181818`
- **Light bg**: `#FFFFFF`

### Gradients (AnimationCopycat-specific)
- AI gradient: `linear-gradient(135deg, #4D14D8, #4166F5)`
- Brand sweep: `conic-gradient(from 0deg, #ECF2FD, #9EC0F5, #4166F5, #C7B0FF, #4D14D8, #ECF2FD)`

## Logo
- Ring + notch shape
- SVG paths in `remotion/src/compositions/LoadingSpinner.tsx`
- `INVELA_LOGO_PATH` (ring), `NOTCH_PATH` (notch)
- Native: 137x139px, center (68.3, 69.5), radius 49.5, stroke 19.3
- Colorways: White on dark, Deep Blue on light, Black on white

## Icons
- Library: Lucide Icons
- Style: Stroke, round caps, slightly rounded corners
- Sizes: 12, 16, 20, 24, 32, 48px
