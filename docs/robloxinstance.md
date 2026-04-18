---
title: RobloxInstance Methods
parent: LuaVM Documentation
nav_order: 5
---

## RobloxInstance Methods

All methods below are called on a `RobloxInstance` object, for example `datamodel:FindFirstChild("Workspace")`.

### `instance:FindFirstChild(name)`

Searches for the first direct child of the `instance` with the given `name`.

- `name` (string): The name of the child to find.

**Returns:** A `RobloxInstance` object if found, otherwise `nil`.

### `instance:FindFirstChildOfClass(className)`

Searches for the first direct child of the `instance` that is of the specified `className`.

- `className` (string): The class name of the child to find, for example `"Part"` or `"Player"`.

**Returns:** A `RobloxInstance` object if found, otherwise `nil`.

### `instance:FindFirstDescendant(name)`

Recursively searches through all descendants of the `instance` to find the first one with the given `name`.

- `name` (string): The name of the descendant to find.

**Returns:** A `RobloxInstance` object if found, otherwise `nil`.

### `instance:IsA(className)`

Checks if the `instance` is of the specified `className` or inherits from it.

- `className` (string): The class name to check against.

**Returns:** `true` if the instance is of the given class or a subclass, `false` otherwise.

### `instance:GetDescendants()`

Retrieves a list of all descendants of the `instance`, including children, grandchildren, and deeper descendants.

**Returns:** A Lua table containing `RobloxInstance` objects.

### `instance:GetCFrame()`

Retrieves the CFrame of the `instance`. This is typically applicable to `BasePart` objects.

**Returns:** A Lua table with two fields:

- `Position`: A table with `X`, `Y`, and `Z` numbers.
- `Rotation`: A table with `RightVector`, `UpVector`, and `LookVector`, each containing `X`, `Y`, and `Z` numbers.

Returns `nil` if the instance does not have a CFrame.

### `instance:GetPosition()`

Retrieves the position of the `instance` in 3D space. This is typically applicable to `BasePart` objects.

**Returns:** A Lua table with `X`, `Y`, and `Z` number fields representing the position. Returns `nil` if the instance does not have a position.

### `instance:GetParent()`

Retrieves the parent of the `instance`.

**Returns:** A `RobloxInstance` object representing the parent, or `nil` if it has no parent.

### `instance:GetStringValue()`

If the `instance` is a `StringValue` object, this method returns its string value.

**Returns:** A string if the instance is a `StringValue`, otherwise `nil`.

### `instance:GetBoolValue()`

If the `instance` is a `BoolValue` object, this method returns its boolean value.

**Returns:** A boolean if the instance is a `BoolValue`, otherwise `nil`.

### `instance:GetVelocity()`

Retrieves the linear velocity of the `instance`. This is typically applicable to `BasePart` objects.

**Returns:** A Lua table with `X`, `Y`, and `Z` number fields representing the velocity. Returns `nil` if the instance does not have a velocity.

### `instance:SetVelocity(vector3)`

Sets the linear velocity of the `instance`. This is typically applicable to `BasePart` objects.

- `vector3` (table): A Lua table with `X`, `Y`, and `Z` number fields representing the new velocity.

**Returns:** `true` if the velocity was set successfully, `false` otherwise.

### `instance:GetSize()`

Retrieves the size of the `instance`. This is typically applicable to `BasePart` objects.

**Returns:** A Lua table with `X`, `Y`, and `Z` number fields representing the size. Returns `nil` if the instance does not have a size.

### `instance:SetSize(vector3)`

Sets the size of the `instance`. This is typically applicable to `BasePart` objects.

- `vector3` (table): A Lua table with `X`, `Y`, and `Z` number fields representing the new size.

**Returns:** `true` if the size was set successfully, `false` otherwise.

### `instance:GetTransparency()`

Retrieves the transparency of the `instance`.

**Returns:** A number representing the transparency from `0` to `1`. Returns `nil` if the instance does not have transparency.

### `instance:SetTransparency(value)`

Sets the transparency of the `instance`.

- `value` (number): A number between `0` and `1` representing the new transparency.

**Returns:** `true` if the transparency was set successfully, `false` otherwise.

### `instance:Character()`

If the `instance` is a `Player` object, this method returns their `Character` model.

**Returns:** A `RobloxInstance` object representing the player's character, or `nil`.

### `instance:Health()`

Retrieves the current health of the `instance`. This is typically applicable to `Humanoid` objects or other health-enabled instances.

**Returns:** A number representing the current health. Returns `nil` if the instance does not have health.

### `instance:MaxHealth()`

Retrieves the maximum health of the `instance`. This is typically applicable to `Humanoid` objects.

**Returns:** A number representing the maximum health. Returns `nil` if the instance does not have a max health property.

### `instance:Team()`

Retrieves the team of the `instance`. This is typically applicable to `Player` objects.

**Returns:** A `RobloxInstance` object representing the player's team, or `nil`.

### `instance:RigType()`

Retrieves the rig type of the `instance`. This is typically applicable to `Humanoid` objects.

**Returns:** An integer representing the rig type. Returns `nil` if the instance does not have a rig type.

### `instance:GetWalkspeed()`

Retrieves the walkspeed of the `instance`. This is typically applicable to `Humanoid` objects.

**Returns:** A number representing the walkspeed. Returns `nil` if the instance does not have a walkspeed.

### `instance:SetWalkspeed(value)`

Sets the walkspeed of the `instance`. This is typically applicable to `Humanoid` objects.

- `value` (number): The new walkspeed.

**Returns:** `true` if the walkspeed was set successfully, `false` otherwise.

### `instance:GetJumpPower()`

Retrieves the jump power of the `instance`. This is typically applicable to `Humanoid` objects.

**Returns:** A number representing the jump power. Returns `nil` if the instance does not have jump power.

### `instance:SetJumpPower(value)`

Sets the jump power of the `instance`. This is typically applicable to `Humanoid` objects.

- `value` (number): The new jump power.

**Returns:** `true` if the jump power was set successfully, `false` otherwise.

### `instance:GetFOV()`

Retrieves the Field of View (FOV) of the `instance`. This is typically applicable to `Camera` objects.

**Returns:** A number representing the FOV. Returns `nil` if the instance does not have an FOV property.

### `instance:SetFOV(value)`

Sets the Field of View (FOV) of the `instance`. This is typically applicable to `Camera` objects.

- `value` (number): The new FOV.

**Returns:** `true` if the FOV was set successfully, `false` otherwise.

### `instance:Name()`

Retrieves the name of the `instance`.

**Returns:** A string representing the name of the instance.

### `instance:Class()`

Retrieves the class name of the `instance`.

**Returns:** A string representing the class name of the instance.

### `instance:GetChildren()`

Retrieves a list of all direct children of the `instance`.

**Returns:** A Lua table containing `RobloxInstance` objects.
