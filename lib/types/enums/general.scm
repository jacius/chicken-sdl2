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
;;; GENERAL

(export SDL_ENABLE
        SDL_DISABLE
        SDL_QUERY
        SDL_IGNORE)

(define SDL_ENABLE  (foreign-value "SDL_ENABLE"  int))
(define SDL_DISABLE (foreign-value "SDL_DISABLE" int))
(define SDL_QUERY   (foreign-value "SDL_QUERY"   int))
(define SDL_IGNORE  (foreign-value "SDL_IGNORE"  int))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; INIT / SUBSYSTEMS

(export SDL_INIT_AUDIO
        SDL_INIT_EVENTS
        SDL_INIT_EVERYTHING
        SDL_INIT_GAMECONTROLLER
        SDL_INIT_HAPTIC
        SDL_INIT_JOYSTICK
        SDL_INIT_NOPARACHUTE
        SDL_INIT_TIMER
        SDL_INIT_VIDEO)

(define SDL_INIT_VIDEO          (foreign-value "SDL_INIT_VIDEO"          unsigned-int32))
(define SDL_INIT_AUDIO          (foreign-value "SDL_INIT_AUDIO"          unsigned-int32))
(define SDL_INIT_TIMER          (foreign-value "SDL_INIT_TIMER"          unsigned-int32))
(define SDL_INIT_JOYSTICK       (foreign-value "SDL_INIT_JOYSTICK"       unsigned-int32))
(define SDL_INIT_HAPTIC         (foreign-value "SDL_INIT_HAPTIC"         unsigned-int32))
(define SDL_INIT_GAMECONTROLLER (foreign-value "SDL_INIT_GAMECONTROLLER" unsigned-int32))
(define SDL_INIT_EVENTS         (foreign-value "SDL_INIT_EVENTS"         unsigned-int32))
(define SDL_INIT_EVERYTHING     (foreign-value "SDL_INIT_EVERYTHING"     unsigned-int32))
(define SDL_INIT_NOPARACHUTE    (foreign-value "SDL_INIT_NOPARACHUTE"    unsigned-int32))
