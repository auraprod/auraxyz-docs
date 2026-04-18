---
title: Standard Library
parent: LuaVM Documentation
nav_order: 2
---

## Standard Library Additions

### `print(...)`

Prints values to the internal console with standard logging level.

- Accepts multiple arguments, converting them to strings.

### `warn(...)`

Prints values to the internal console with warning logging level.

- Highlighted in yellow/orange in the console.

### `error(...)`

Prints values to the internal console with error logging level.

- Highlighted in red in the console.

### `wait(seconds)`

Pauses the script execution for the specified amount of time.

- `seconds` (number): Time to wait in seconds.
- **Note**: This yields the thread; without this in loops, the script might freeze the worker thread.
