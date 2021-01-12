// wasm deals with 2 level namespaces
// 
let importObj = {
  "imports": {
    "console.log": (arg) => console.log(arg)
  }
}

fetch("js_api.wasm")
  .then((response) => response.arrayBuffer())
  .then((bytes) => WebAssembly.instantiate(bytes, importObj))
  .then((response) => {
    let result = response.instance.exports.add(12131, 2);
    console.log(result);
  });