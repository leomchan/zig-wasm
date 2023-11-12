# Zig WASM

Learn to generate a WASM library that can be used in a browser.

## Building WASM library

```sh
zig build-lib src/main.zig -target wasm32-freestanding -dynamic
```
