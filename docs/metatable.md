---
title: Metatable Functions
parent: LuaVM Documentation
nav_order: 6
---

## Metatable Functions

These functions are primarily for internal LuaVM operations but define behavior for `RobloxInstance` objects.

### `__gc`

Called when a `RobloxInstance` userdata is garbage collected by Lua. Performs cleanup for the underlying C++ object.

### `__tostring`

Defines how a `RobloxInstance` object is converted to a string when `tostring()` is called on it. It returns a string in the format `ClassName "InstanceName"`.

### `__eq`

Defines how `RobloxInstance` objects are compared for equality using `==`. Two `RobloxInstance` objects are considered equal if their underlying memory addresses are the same.
