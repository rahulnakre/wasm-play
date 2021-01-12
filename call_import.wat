(module
  ;; access the console.log from the imports obj 
  ;; NOTE: import has to be before the function declarations
  (import "imports" "console.log" (func $log (param i32)))
  (func (param i32) (param i32)
    ;; add param to stack
    local.get 0
  )
  (func (export "add") (param i32) (param i32) (param $p1 i32) (result i32)
    ;; push first param to the stack 
    local.get 0
    ;; we call the first function, which is at 1 in the s-expr
    call 1
    local.get $p1
    i32.add
    ;; access top value in the stack, and print
    call $log
  )
)