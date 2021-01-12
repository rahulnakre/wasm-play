;; FUNCTIONS
;; sig: parameters, and return type
;; locals: typed variables
;; body: the code itself
;; (func <signature> <locals> <body>)

;; DATA TYPES
;; i32, i64, f32, f64

;; s-expression, its a tree
(module
  (func $add (param i32) (param $p1 i32) (result i32)
    ;; get param at index 1, add to stack
    local.get 0
    ;; get param named $p1, and add to stack
    local.get $p1
    ;; pop 2 things from the stack, add them, and store on stack
    i32.add
  )
  ;; export is what will be exposed to js
  (export "add" (func $add))
)