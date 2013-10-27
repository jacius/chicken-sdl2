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


(define-syntax define-uniform-struct-accessors
  (syntax-rules (procs: fields: using: index: default: guard: get: set:)
    ((define-uniform-struct-accessors
       procs: (make-struct struct->list struct-set!)
       fields: ((field-name index: index
                            default: default-value
                            guard: value-guard
                            get: getter
                            set: setter)
                ...)
       using: (record-type predicate
               wrapper unwrapper
               vector-constructor vector-ref vector->list))
     (begin
       (define-record-printer (record-type struct out)
         (%displayify out "#<" 'record-type " " (struct->list struct) ">"))
       (define (make-struct #!optional (field-name default-value) ...)
         (wrapper (vector-constructor (value-guard field-name) ...)))
       (define (struct->list struct)
         (assert (predicate struct))
         (vector->list (unwrapper struct)))
       (define (struct-set! struct #!key field-name ...)
         (assert (predicate struct))
         (when field-name
           (setter struct (value-guard field-name)))
         ...)
       (begin
         (define (setter struct value)
           (assert (predicate struct))
           (set! (vector-ref (unwrapper struct) index) (value-guard value)))
         (define getter
           (getter-with-setter
            (lambda (struct)
              (assert (predicate struct))
              (vector-ref (unwrapper struct) index))
            setter)))
       ...))))
