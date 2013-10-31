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
;;; RECORD TYPE / CONVERTERS / ETC.


(define-syntax define-nonuniform-struct-constructors
  (syntax-rules (type: pointer: data: alloc: converters:)
    ((define-nonuniform-struct-constructors
       for: (struct-name
             record-type  predicate?  wrapper
             get-pointer  set-pointer
             get-data     set-data)
       allocate: allocater
       converters: (pointer->record
                    record->pointer
                    ->pointer))

     (begin
       (define (allocater)
         (wrapper #f (make-blob (foreign-type-size struct-name))))

       (define (pointer->record pointer)
         (wrapper pointer #f))

       (define (record->pointer record)
         (if (get-data record)
             ((foreign-lambda*-with-dynamic-body
               (c-pointer struct-name) ((blob data))
               ("C_return((~A*)data);" struct-name))
              (get-data record))
             (get-pointer record)))

       (define (->pointer thing)
         (cond
          ((predicate? thing)
           (record->pointer thing))
          ((pointer? thing)
           ((foreign-lambda*-with-dynamic-body
             (c-pointer struct-name) ((c-pointer pointer))
             ("C_return((~A*)pointer);" struct-name))
            thing))
          ((eq? #f thing)
           ((foreign-lambda*-with-dynamic-body
             (c-pointer struct-name) ()
             ("C_return((~A*)NULL);" struct-name))))
          (else
           (error (format "~S cannot convert ~S to ~A pointer"
                          '->pointer thing struct-name)))))))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ACCESSORS

(define-syntax define-nonuniform-struct-accessors
  (syntax-rules (type: fields:)
    ((define-nonuniform-struct-accessors
       type: struct-type
       fields: ((field-args ...)
                ...))
     (begin
       (%define-nonuniform-struct-field struct-type field-args ...)
       ...))))


(define-syntax %define-nonuniform-struct-field
  (syntax-rules (get: set:)
    ;; getter and setter
    ((%define-nonuniform-struct-field
      struct-type (field-type field-name) get: getter-name set: setter-name)
     (%define-nonuniform-struct-field-getter-and-setter
      struct-type field-type field-name getter-name setter-name))
    ;; only getter
    ((%define-nonuniform-struct-field
      struct-type (field-type field-name) get: getter-name)
     (%define-nonuniform-struct-field-only-getter
      struct-type field-type field-name getter-name))))


(define-syntax %define-nonuniform-struct-field-only-getter
  (ir-macro-transformer
   (lambda (form inject compare?)
     (let ((obj 'obj)
           (val 'val)
           (struct-type (inject (list-ref form 1)))
           (field-type  (inject (list-ref form 2)))
           (field-name  (inject (list-ref form 3)))
           (getter-name (inject (list-ref form 4))))
       `(define ,(inject getter-name)
          (foreign-lambda*
           ,(inject field-type)
           ((,(inject struct-type) ,(inject obj)))
           ,(sprintf "C_return(~S->~S);" obj field-name)))))))


(define-syntax %define-nonuniform-struct-field-getter-and-setter
  (ir-macro-transformer
   (lambda (form inject compare?)
     (let ((obj 'obj)
           (val 'val)
           (struct-type (inject (list-ref form 1)))
           (field-type  (inject (list-ref form 2)))
           (field-name  (inject (list-ref form 3)))
           (getter-name (inject (list-ref form 4)))
           (setter-name (inject (list-ref form 5))))
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
             ,(inject setter-name))))))))
