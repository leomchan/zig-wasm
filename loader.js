const memory = new WebAssembly.Memory({
  // See build.zig for reasoning
  initial: 2 /* pages */,
  maximum: 2 /* pages */,
});
const importObject = {
  env: {
    memory: memory,
  },
};
WebAssembly.instantiateStreaming(fetch("zig-out/lib/zig-wasm.wasm"), importObject).then((results) => {
  const addDemo = results.instance.exports.add_two;
  console.log('add', addDemo(3, 5));
  const hello = results.instance.exports.hello;
  // Limit size of string to 256 bytes
  const view = new Uint8Array(memory.buffer, hello(), 256);
  // Find null terminator
  const helloEnd = view.indexOf(0);
  const helloStr = new TextDecoder().decode(view.slice(0, helloEnd));
  console.log('hello() returned', helloStr);
});