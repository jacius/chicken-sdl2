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


;;; No frills, just define and export a bunch of foreign constants (or
;;; enums). value-name must be an unquoted symbol that exactly matches
;;; name of the foreign constant.
;;;
;;; Examples:
;;;
;;;  (define-foreign-constants int
;;;    SDL_ENABLE
;;;    SDL_DISABLE)
;;;
;;;  (define-foreign-constants SDL_AudioStatus
;;;    SDL_AUDIO_STOPPED
;;;    SDL_AUDIO_PLAYING
;;;    SDL_AUDIO_PAUSED)
;;;
(define-syntax define-foreign-constants
  (syntax-rules ()
    ((define-foreign-constants foreign-type value-name ...)
     (begin
       (export value-name ...)
       (define value-name (foreign-value value-name foreign-type))
       ...))))


;;; Define and export a bunch of foreign constants (or enums), plus up
;;; to 4 helper procedures:
;;;
;;;   1. Convert a constant's value to its symbol name.
;;;   2. Vice versa.
;;;   3. Convert a constant's value to its associated keyword.
;;;   4. Vice versa.
;;;
;;; If you don't want one or more of those helper procedures, specify
;;; #f (the false value) for its name.
;;;
;;; Example:
;;;
;;;  (define-foreign-constants+ Uint32
;;;    ;; The names of the helper procedures:
;;;    (%sdl-init-flag->symbol
;;;     %symbol->sdl-init-flag
;;;     %sdl-init-flag->keyword
;;;     %keyword->sdl-init-flag)
;;;    ;; The name and associated keyword of each of the constants:
;;;    ((SDL_INIT_TIMER          #:timer)
;;;     (SDL_INIT_AUDIO          #:audio)
;;;     (SDL_INIT_VIDEO          #:video)
;;;     (SDL_INIT_JOYSTICK       #:joystick)
;;;     (SDL_INIT_HAPTIC         #:haptic)
;;;     (SDL_INIT_GAMECONTROLLER #:controller)
;;;     (SDL_INIT_EVENTS         #:events)
;;;     (SDL_INIT_EVERYTHING     #:everything)
;;;     (SDL_INIT_NOPARACHUTE    #:no-parachute)))
;;;
(define-syntax define-foreign-constants+
  (syntax-rules ()
    ((define-foreign-constants+ foreign-type
       (value->symbol
        symbol->value
        value->keyword
        keyword->value)
       ((value-name value-keyword)
        ...))

     (begin
       (export value-name ...)
       (define value-name (foreign-value value-name foreign-type))
       ...

       (ignore-if-false value->symbol
         (export value->symbol)
         (define (value->symbol value #!key default)
           (define value->symbol-table
             (alist->hash-table
              (list (cons value-name 'value-name) ...)
              test: =
              hash: number-hash))
           (hash-table-ref/default value->symbol-table value default)))

       (ignore-if-false symbol->value
         (export symbol->value)
         (define (symbol->value symbol #!key default)
           (define symbol->value-table
             (alist->hash-table
              (list (cons 'value-name value-name) ...)
              test: eq?
              hash: symbol-hash))
           (hash-table-ref/default symbol->value-table symbol default)))

       (ignore-if-false value->keyword
         (export value->keyword)
         (define (value->keyword value #!key default)
           (define value->keyword-table
             (alist->hash-table
              (list (cons value-name value-keyword) ...)
              test: =
              hash: number-hash))
           (hash-table-ref/default value->keyword-table value default)))

       (ignore-if-false keyword->value
         (export keyword->value)
         (define (keyword->value keyword #!key default)
           (define keyword->value-table
             (alist->hash-table
              (list (cons value-keyword value-name) ...)
              test: equal?
              hash: keyword-hash))
           (hash-table-ref/default keyword->value-table keyword default)))))))



(include "lib/sdl2-types/enums/general.scm")
(include "lib/sdl2-types/enums/audio.scm")
(include "lib/sdl2-types/enums/cursor.scm")
(include "lib/sdl2-types/enums/events.scm")
(include "lib/sdl2-types/enums/gl.scm")
(include "lib/sdl2-types/enums/joystick.scm")
(include "lib/sdl2-types/enums/keycode.scm")
(include "lib/sdl2-types/enums/mouse.scm")
(include "lib/sdl2-types/enums/pixel-format.scm")
(include "lib/sdl2-types/enums/scancode.scm")
(include "lib/sdl2-types/enums/surface.scm")
(include "lib/sdl2-types/enums/window.scm")
