;;
;; chicken-sdl2: Chicken bindings to SDL 2 (Simple DirectMedia Layer 2)
;;
;; Copyright © 2013  John Croisant.
;; All rights reserved.
;;
;; Redistribution and use in source and binary forms, with or without
;; modification, are permitted provided that the following conditions
;; are met:
;;
;; - Redistributions of source code must retain the above copyright
;;   notice, this list of conditions and the following disclaimer.
;;
;; - Redistributions in binary form must reproduce the above copyright
;;   notice, this list of conditions and the following disclaimer in
;;   the documentation and/or other materials provided with the
;;   distribution.
;;
;; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
;; "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
;; LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
;; FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
;; COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
;; INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
;; (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
;; SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
;; HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
;; STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
;; ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
;; OF THE POSSIBILITY OF SUCH DAMAGE.


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
