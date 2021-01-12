;; GLOBALS
;; (module
;;   ;; note: imports names are arbitrary
;;   (import "js" "print" (func $print (param i32)))
;;   ;; note, we define this before $g cus it has an import
;;   ;; we use the mutable cariable we definied in js
;;   (global $g1 (import "js" "g1") (mut i32))
;;   ;; make a global cariable $g with value of 1
;;   (global $g i32 (i32.const 1))

;;   (func $getG1 (export "getG1")
;;     global.get $g1
;;     call $print
;;   )
;;   (func $setG1 (export "setG1") (param i32)
;;     local.get 0
;;     global.set $g1
;;     call $getG1
;;   )
;; ) 

;; MEMORY
(module
  (import "js" "print" (func $print (param i32)))
  (import "js" "mem" (memory 1))

  ;; memory w size 1 page, which is 64kb
  ;; can only have 1 memory per module btw
  ;; (memory 1)

  (func (export "populateMem")
    ;; set value 123 to index 0
    i32.const 0
    i32.const 123
    i32.store

    ;; set value 1230 to index 10 
    i32.const 10
    i32.const 1230
    i32.store
  )

  (func (export "getAt") (param i32)
    local.get 0
    ;; loads value at the index 
    ;; specified by the param
    i32.load
    call $print
  )
)