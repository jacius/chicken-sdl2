
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; HELPERS

(define (%displayify out . things)
  (for-each (lambda (thing) (display thing out))
            things))


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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ENUMS

(define-syntax define-enum
  (syntax-rules ()
    ((define-enum enum-name value-name ...)
     (begin
       (define-foreign-type enum-name int)
       (define value-name (foreign-value value-name enum-name))
       ...))))


(define-syntax define-and-export-enum
  (syntax-rules ()
    ((define-and-export-enum enum-name value-name ...)
     (begin
       (export value-name ...)
       (define-enum enum-name value-name ...)))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; STRUCTS


(define-syntax define-foreign-struct
  (syntax-rules ()
    ((define-foreign-struct struct-type
       (field-args ...)
       ...)
     (begin
       (%define-foreign-struct-field struct-type field-args ...)
       ...))))

;;; I sure wish syntax-rules could easily use strings generated at
;;; macro expansion time. Then I could do this:

;; (define-syntax %define-foreign-struct-field
;;   (syntax-rules ()
;;     ;; getter and setter
;;     ((%define-foreign-struct-field
;;       struct-type field-type field-name
;;       getter-name setter-name)
;;      (begin
;;        (define setter-name
;;          (foreign-lambda*
;;           void
;;           ((struct-type obj) (field-type val))
;;           ,(sprintf "~S->~S = ~S;" obj field-name val)))
;;        (define getter-name
;;          (getter-with-setter
;;           (foreign-lambda*
;;            field-type
;;            ((struct-type obj))
;;            ,(sprintf "C_return(~S->~S);" obj field-name))
;;           setter-name))))
;;     ;; no setter
;;     ((%define-foreign-struct-field
;;       struct-type field-type field-name
;;       getter-name)
;;      (define getter-name
;;        (foreign-lambda*
;;         field-type
;;         ((struct-type obj))
;;         ,(sprintf "C_return(~S->~S);" obj field-name))))))

;;; ... instead of this:

(define-syntax %define-foreign-struct-field
  (ir-macro-transformer
   (lambda (form inject compare?)
     (let ((obj 'obj)
           (val 'val)
           (struct-type (inject (list-ref form 1)))
           (field-type  (inject (list-ref form 2)))
           (field-name  (inject (list-ref form 3)))
           (getter-name (inject (list-ref form 4)))
           (setter-name (and (> (length form) 5)
                             (inject (list-ref form 5)))))
       (if setter-name
           ;; getter and setter
           `(begin
              (define ,(inject setter-name)
                (foreign-lambda*
                 void
                 ((,(inject struct-type) ,(inject obj))
                  (,(inject field-type) ,(inject val)))
                 ,(sprintf "~S->~S = ~S;" obj field-name val)))
              (define ,(inject getter-name)
                (getter-with-setter
                 (foreign-lambda*
                  ,(inject field-type)
                  ((,(inject struct-type) ,(inject obj)))
                  ,(sprintf "C_return(~S->~S);" obj field-name))
                 ,(inject setter-name))))
           ;; no setter
           `(define ,(inject getter-name)
              (foreign-lambda*
               ,(inject field-type)
               ((,(inject struct-type) ,(inject obj)))
               ,(sprintf "C_return(~S->~S);" obj field-name))))))))
