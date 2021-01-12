let importObj = {
  "js": {
    "print": (arg) => document.writeln(arg),
    // used to create a global variable in our wasm
    // called g1, initialized to 123
    // note: we still have to initialize this in our wasm file
    "g1": new WebAssembly.Global({
        value: "i32",
        mutable: true
      },
      123
    ),
    // gona use js to help instantiate memory in wasm module 
    "mem": new WebAssembly.Memory({ initial: 1 }),
  }
}

fetch("globals_memory.wasm")
  .then(response => response.arrayBuffer())
  .then(bytes => WebAssembly.instantiate(bytes, importObj))
  .then(result => {
    // result.instance.exports.getG1()
    // result.instance.exports.setG1(432423)

    result.instance.exports.populateMem()
    result.instance.exports.getAt(0)
    result.instance.exports.getAt(10)
    result.instance.exports.getAt(2)

    document.writeln(importObj.js.mem.buffer.byteLength)
    // grow the memory by 1 page
    importObj.js.mem.grow(1)
    document.writeln(importObj.js.mem.buffer.byteLength)
  })