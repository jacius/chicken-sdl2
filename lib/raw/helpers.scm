
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; HELPERS

;;; Convenience and descriptiveness wrapper around foreign-lambda.
;;; Usage (stuff in square brackets can be omitted):
;;;
;;;   (define-function-binding* NAME
;;;     [return: (RETURN-TYPE RETURN-SEMANTICS)]
;;;     [args: ((ARG-TYPE ARG-NAME) ...)])
;;;
(define-syntax define-function-binding
  (syntax-rules (return: args:)
    ;; return type and args
    ((define-function-binding func-name-symbol
       return: (return-type return-semantics)
       args: ((arg-type arg-name) ...))
     (define func-name-symbol
       (foreign-lambda return-type func-name-symbol arg-type ...)))
    ;; no args
    ((define-function-binding func-name-symbol
       return: (return-type return-semantics))
     (define func-name-symbol
       (foreign-lambda return-type func-name-symbol)))
    ;; no return type (i.e. void)
    ((define-function-binding func-name-symbol
       args: ((arg-type arg-name) ...))
     (define func-name-symbol
       (foreign-lambda void func-name-symbol arg-type ...)))
    ;; no return type or args
    ((define-function-binding func-name-symbol)
     (define func-name-symbol
       (foreign-lambda void func-name-symbol)))))


;;; Convenience and descriptiveness wrapper around foreign-lambda*.
;;; Usage (stuff in square brackets can be omitted):
;;;
;;;   (define-function-binding* FUNC-NAME-SYMBOL
;;;     [return: (RETURN-TYPE RETURN-SEMANTICS)]
;;;     [args: ((ARG-TYPE ARG-NAME) ...)]
;;;     body: "C code goes here;")
;;;
(define-syntax define-function-binding*
  (syntax-rules (return: args: body:)
    ;; return type and args
    ((define-function-binding* func-name-symbol
       return: (return-type return-semantics)
       args: ((arg-type arg-name) ...)
       body: body-string)
     (define func-name-symbol
       (foreign-lambda* return-type ((arg-type arg-name) ...) body-string)))
    ;; no args
    ((define-function-binding* func-name-symbol
       return: (return-type return-semantics)
       body: body-string)
     (define func-name-symbol
       (foreign-lambda* return-type () body-string)))
    ;; no return type (i.e. void)
    ((define-function-binding* func-name-symbol
       args: ((arg-type arg-name) ...)
       body: body-string)
     (define func-name-symbol
       (foreign-lambda* void ((arg-type arg-name) ...) body-string)))
    ;; no return type or args
    ((define-function-binding* func-name-symbol
       body: body-string)
     (define func-name-symbol
       (foreign-lambda* void () body-string)))))
