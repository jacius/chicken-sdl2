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
;;; INITIALIZATION AND SHUTDOWN

(define (%merge-init-flags flags)
  (apply bitwise-ior
    (map (lambda (flag) (%keyword->sdl-init-flag flag 0))
         flags)))


(export sdl-init
        sdl-init-subsystem
        sdl-quit
        sdl-quit-subsystem
        sdl-was-init)

(define (sdl-init . flags)
  (= 0 (SDL_Init
        (if (null? flags)
            SDL_INIT_EVERYTHING
            (%merge-init-flags flags)))))

(define (sdl-init-subsystem . flags)
  (= 0 (SDL_InitSubSystem (%merge-init-flags flags))))

(define (sdl-quit) (SDL_Quit))

(define (sdl-quit-subsystem . flags)
  (SDL_QuitSubSystem (%merge-init-flags flags)))

(define (sdl-was-init . flags)
  (let ((result (SDL_WasInit (%merge-init-flags flags))))
    (if (= 0 result)
        #f
        (map %sdl-init-flag->keyword
             (masks->list result
                          (list SDL_INIT_TIMER
                                SDL_INIT_AUDIO
                                SDL_INIT_VIDEO
                                SDL_INIT_JOYSTICK
                                SDL_INIT_HAPTIC
                                SDL_INIT_GAMECONTROLLER
                                SDL_INIT_EVENTS
                                SDL_INIT_EVERYTHING))))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ERROR HANDLING

(export sdl-clear-error
        sdl-get-error
        sdl-set-error)

(define (sdl-clear-error) (SDL_ClearError))
(define (sdl-get-error) (SDL_GetError))

(define (sdl-set-error fmt . fmt-args)
  (SDL_SetError (apply format fmt fmt-args)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; VERSION

(export sdl-get-version
        sdl-get-compiled-version)

(define (sdl-get-version)
  (let ((v (make-sdl-version)))
    (SDL_GetVersion v)
    v))

(define (sdl-get-compiled-version)
  (let ((v (make-sdl-version)))
    (SDL_VERSION v)
    v))
