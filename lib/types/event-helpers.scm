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


(define-syntax define-sdl-event-type
  (syntax-rules ()
    ((define-sdl-event-type struct-name
       types: (type-id ...)
       make: maker
       predicate: pred?
       fields: (((field-type field-name)
                 guard: field-guard
                 get: field-getter
                 set: field-setter)
                ...))
     
     (begin
       (define (maker type timestamp field-name ...)
         (let ((event (allocate-sdl-event)))
           (sdl-event-type-set! event type)
           (sdl-event-timestamp-set! event timestamp)
           (field-setter event field-name)
           ...
           event))
       
       (define (pred? event)
         (and (sdl-event? event)
              (any (lambda (t)
                     (eq? t (sdl-event-type event)))
                   (list type-id ...))))

       (begin
         (define (field-setter event value)
           (assert (pred? event))
           (let ((guarded-value (field-guard value)))
             ((foreign-lambda*-with-dynamic-body
               void ((SDL_Event* ev) (field-type val))
               ("((~A*)ev)->~A = val;" struct-name field-name))
              event guarded-value)))
         
         (define field-getter
           (getter-with-setter
            (lambda (event)
              (assert (pred? event))
              ((foreign-lambda*-with-dynamic-body
                field-type ((SDL_Event* ev))
                ("C_return(((~A*)ev)->~A);" struct-name field-name))
               event))
            field-setter)))
       ...))

    ;; no fields
    ((define-sdl-event-type struct-name
       types: (type-id ...)
       make: maker
       predicate: pred?)
     
     (begin
       (define (maker type timestamp)
         (let ((event (allocate-sdl-event)))
           (sdl-event-type-set! event type)
           (sdl-event-timestamp-set! event timestamp)
           event))
       
       (define (pred? event)
         (and (%sdl-event? event)
              (any (lambda (t)
                     (eq? t (sdl-event-type event)))
                   (list type-id ...))))))))
