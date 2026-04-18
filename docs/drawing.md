---
title: Drawing Library
parent: LuaVM Documentation
nav_order: 4
---

## Drawing Library

The `Drawing` library allows rendering 2D shapes on the screen as an overlay.

### `Drawing.new(type)`

Creates a new drawing object.

- `type` (string): The type of object to create. Valid options: `"Line"`, `"Circle"`, `"Square"`, `"Text"`.
- **Returns**: A new Drawing object.

### `Drawing.WorldToScreen(position)`

Projects a 3D world position to 2D screen coordinates.

- `position` (Vector3 table): `{X, Y, Z}`.
- **Returns**:
  1. `Vector2` table `{X, Y}`: The screen coordinates.
  2. `bool`: `true` if the point is on screen, `false` otherwise.

### `Drawing.GetScreenSize()`

Returns the current screen resolution.

- **Returns**: `Vector2` table `{X, Y}`.

### Drawing Object Properties

**Common Properties**

- `Visible` (bool): Whether the object is rendered.
- `ZIndex` (number): Rendering order, default `1`.
- `Transparency` (number): Alpha value from `0` to `1`.
- `Color` (table): `{r, g, b}` in the `0` to `1` range.
- `Remove()`: Destroys the object.

**Line**

- `From` (Vector2): Start point `{X, Y}`.
- `To` (Vector2): End point `{X, Y}`.
- `Thickness` (number): Line width.

**Circle**

- `Position` (Vector2): Center `{X, Y}`.
- `Radius` (number): Circle radius.
- `Thickness` (number): Outline thickness.
- `Filled` (bool): Fills the circle when `true`.
- `NumSides` (number): Polygon approximation sides, `0` means auto.

**Square**

- `Position` (Vector2): Top-left corner `{X, Y}`.
- `Size` (Vector2): Dimensions `{X, Y}`.
- `Thickness` (number): Outline thickness.
- `Filled` (bool): Fills the square when `true`.

**Text**

- `Position` (Vector2): Text origin `{X, Y}`.
- `Text` (string): The content to display.
- `Size` (number): Font size, default `16`.
- `Center` (bool): Centers text at `Position` when `true`.
- `Outline` (bool): Draws a black outline when `true`.
- `OutlineColor` (table): `{r, g, b}` for the outline.
