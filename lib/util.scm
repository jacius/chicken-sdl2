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


(define-syntax foreign-lambda*-with-dynamic-body
  (ir-macro-transformer
   (lambda (form inject compare?)
     (let ((return-type (list-ref form 1))
           (args        (list-ref form 2))
           (body        (list-ref form 3)))
       `(foreign-lambda*
         ,return-type ,args
         ,(apply sprintf (map strip-syntax body)))))))

;;; Compare the value to a list of masks, and return a list of the
;;; matching masks. Example:
;;;
;;;   (masks->list (bitwise-ior KMOD_LSHIFT KMOD_RCTRL)
;;;                (list KMOD_LSHIFT
;;;                      KMOD_RSHIFT
;;;                      KMOD_LCTRL
;;;                      KMOD_RCTRL
;;;                      ...))
;;;   ;; => (list KMOD_LSHIFT KMOD_RCTRL)
;;;
(define (masks->list value masks)
  (filter (lambda (mask) (> (bitwise-and value mask) 0))
          masks))
