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
  console.log(results);
  var addDemo = results.instance.exports.add_two;
  console.log(addDemo(3, 5));
});