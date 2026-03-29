## ADDED Requirements

### Requirement: Catppuccin Latte color system

The page SHALL use Catppuccin Latte color palette as CSS custom properties, replacing all fauvism (`--fauve-*`) variables. The palette SHALL include at minimum: base (`#eff1f5`), mantle (`#e6e9ef`), crust (`#dce0e8`), surface0 (`#ccd0da`), surface1 (`#bcc0cc`), text (`#4c4f69`), subtext0 (`#6c6f85`), subtext1 (`#5c5f77`), and sapphire (`#209fb5`).

#### Scenario: CSS variables are Catppuccin Latte values

- **WHEN** the page is loaded
- **THEN** the `:root` block SHALL contain only Catppuccin Latte color variables and MUJI shadow variables, with no `--fauve-*` variables present

### Requirement: MUJI shadow system

The page SHALL define a three-tier MUJI shadow system as CSS custom properties: `--muji-sm` (subtle), `--muji` (default), and `--muji-md` (elevated). Shadows SHALL use low-opacity black (`rgba(0,0,0, 0.04–0.08)`) for a minimal, paper-like appearance.

#### Scenario: Shadow variables are defined

- **WHEN** the page is loaded
- **THEN** CSS custom properties `--muji-sm`, `--muji`, and `--muji-md` SHALL be available with subtle box-shadow values

### Requirement: Minimal background

The page background SHALL be a subtle linear gradient from `--latte-base` to `--latte-mantle` (top to bottom). All geometric patterns (radial-gradient dots, linear-gradient lines, repeating-linear-gradient grids) from the `.background::before` and `.background::after` pseudo-elements SHALL be removed.

#### Scenario: Clean background without geometric patterns

- **WHEN** the page is rendered
- **THEN** the background SHALL display a smooth vertical gradient from light (#eff1f5) to slightly darker (#e6e9ef) with no geometric shapes, dots, or lines visible

### Requirement: Clean avatar presentation

The avatar SHALL have a thin border (`2px solid` using surface0 color), a subtle MUJI shadow, and no rotation animation. The thick black border, yellow offset shadow, and infinite rotation animation SHALL be removed.

#### Scenario: Avatar without rotation

- **WHEN** the page is loaded
- **THEN** the avatar image SHALL be stationary (no CSS animation) with a thin, subtle border

#### Scenario: Avatar hover effect

- **WHEN** the user hovers over the avatar
- **THEN** the avatar shadow SHALL deepen slightly (from `--muji` to `--muji-md`) without any translate transform

### Requirement: Understated name typography

The name heading SHALL use font-weight 500, font-size 2rem, color `--latte-text`, and no text-shadow. The previous bold (900), large (3rem), text-shadowed style SHALL be removed.

#### Scenario: Name displays with clean typography

- **WHEN** the page is rendered
- **THEN** the name heading SHALL appear in medium weight with no text-shadow or outline effects

### Requirement: Unified link card style

All link cards SHALL share a single visual style: white background, `1px solid` border using surface0 color, and `--muji-sm` box-shadow. Per-card color assignments via `nth-child` selectors SHALL be removed. Text SHALL NOT be uppercase.

#### Scenario: All cards have consistent appearance

- **WHEN** the page is rendered
- **THEN** every link card SHALL have the same white background, thin border, and subtle shadow regardless of its position in the list

#### Scenario: Link card hover effect

- **WHEN** the user hovers over a link card
- **THEN** the card SHALL translate upward by 2px, the shadow SHALL deepen to `--muji-md`, and the border color SHALL change to sapphire (`#209fb5`)

#### Scenario: Link card active state

- **WHEN** the user clicks a link card
- **THEN** the card SHALL return to its original position with the base shadow level

### Requirement: Sapphire accent for icons

All link card icons SHALL be colored with the sapphire accent (`#209fb5`). The previous drop-shadow filter on icons SHALL be removed.

#### Scenario: Icons display in sapphire color

- **WHEN** the page is rendered
- **THEN** all link card icons SHALL appear in sapphire color with no drop-shadow filter

### Requirement: Gentle fade-in animation

Link cards SHALL animate in using a `fadeInUp` keyframe (opacity 0→1, translateY 12px→0) with staggered delays. The previous bouncy `popIn` animation (using cubic-bezier with overshoot) SHALL be replaced.

#### Scenario: Cards animate with gentle upward fade

- **WHEN** the page loads
- **THEN** each link card SHALL fade in and slide up gently, with each successive card appearing slightly after the previous one

### Requirement: Japanese-friendly typography

The page SHALL load Noto Sans JP from Google Fonts and use it as the primary font family, followed by system font fallbacks.

#### Scenario: Noto Sans JP font is loaded

- **WHEN** the page is loaded
- **THEN** a Google Fonts link for Noto Sans JP (weights 300, 400, 500, 700) SHALL be present in the document head

### Requirement: No random color JavaScript

The JavaScript block that randomly swaps link card background colors on hover SHALL be completely removed. No `<script>` elements SHALL remain in the page.

#### Scenario: No JavaScript in page

- **WHEN** the page source is inspected
- **THEN** there SHALL be no `<script>` blocks containing card color-swap logic

### Requirement: Understated footer

The footer SHALL use color `--latte-subtext0`, font-size 0.8rem, font-weight 300, and no text-shadow. The year SHALL be updated to 2026.

#### Scenario: Footer displays subtly

- **WHEN** the page is rendered
- **THEN** the footer text SHALL appear in a small, light-colored font with no text-shadow, showing "© 2026 Cash Wu"
