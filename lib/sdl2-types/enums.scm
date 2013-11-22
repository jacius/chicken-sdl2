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


(define-syntax define-enum
  (syntax-rules ()
    ;; with string converter
    ((define-enum (enum-type enum-name) value-name ...)
     (begin
       (define (enum-name value)
         (select value
           ((value-name) 'value-name)
           ...))
       (define value-name (foreign-value value-name enum-type))
       ...))
    ;; without string converter
    ((define-enum enum-type value-name ...)
     (begin
       (define value-name (foreign-value value-name enum-type))
       ...))))

(define-syntax define-and-export-enum
  (syntax-rules ()
    ;; with string converter
    ((define-and-export-enum (enum-type enum-name) value-name ...)
     (begin
       (export enum-name value-name ...)
       (define-enum (enum-type enum-name) value-name ...)))
    ;; without string converter
    ((define-and-export-enum enum-type value-name ...)
     (begin
       (export value-name ...)
       (define-enum enum-type value-name ...)))))


(define-syntax define-and-export-foreign-constants
  (syntax-rules ()
    ((define-and-export-foreign-constants type name ...)
     (begin
       (export name ...)
       (define name (foreign-value name type))
       ...))))


(include "lib/sdl2-types/enums/general.scm")
(include "lib/sdl2-types/enums/audio.scm")
(include "lib/sdl2-types/enums/events.scm")
(include "lib/sdl2-types/enums/gl.scm")
(include "lib/sdl2-types/enums/joystick.scm")
(include "lib/sdl2-types/enums/keycode.scm")
(include "lib/sdl2-types/enums/mouse.scm")
(include "lib/sdl2-types/enums/pixel-format.scm")
(include "lib/sdl2-types/enums/scancode.scm")
(include "lib/sdl2-types/enums/surface.scm")
(include "lib/sdl2-types/enums/window.scm")
