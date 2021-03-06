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

;;; This is a crude demo showing some basic SDL functionality with the
;;; sdl2-raw bindings.

(when (feature? 'csi)
  (print "ERROR: sdl2 demos must be compiled, not run in the interpreter (csi).")
  (print "Try compiling like this:  csc demos/main/basics.scm")
  (print "Then run it like this:    demos/main/basics")
  (exit 1))

(use sdl2 miscmacros extras
     sdl2-types sdl2-raw)

(printf "Compiled with SDL ~A~N" (sdl-version->list (sdl-get-compiled-version)))
(printf "Running with SDL ~A~N" (sdl-version->list (sdl-get-version)))

(sdl-init #:video #:events #:timer)
(on-exit sdl-quit)


(define window
  (sdl-create-window "SDL Basics" #:centered 100 800 600 #:shown #:resizable))

(printf "Window position: ~A, size: ~A, max size: ~A, min size: ~A~N"
        (sdl-window-position window)
        (sdl-window-size window)
        (sdl-window-maximum-size window)
        (sdl-window-minimum-size window))


;;; Hacky event loop. Please don't consider this the recommended way
;;; of structuring an event loop in a real app!

(let ((done? #f)
      (text-input? #f))
  (while (not done?)
    (let ((ev (sdl-wait-event)))
      (print ev)
      (select (sdl-event-type ev)

        ;; Window exposed, resized, etc.
        ((SDL_WINDOWEVENT)
         (SDL_FillRect (sdl-window-surface window)
                       #f            ; NULL, i.e. fill the whole surface
                       (SDL_MapRGB
                        (sdl-surface-format (sdl-window-surface window))
                        0 50 128))
         (sdl-update-window-surface window))

        ;; User requested that the app quit.
        ((SDL_QUIT)
         (set! done? #t))

        ;; Keyboard key pressed.
        ((SDL_KEYDOWN)
         (let ((key (sdl-keysym-sym (sdl-keyboard-event-keysym ev))))
           (select key
             ((SDLK_ESCAPE SDLK_q)
              (set! done? #t))
             ((SDLK_RETURN)
              (set! text-input? (not text-input?))
              (if text-input?
                  (begin
                    (SDL_StartTextInput)
                    (print "Started accepting text input events."))
                  (begin
                    (SDL_StopTextInput)
                    (print "Stopped accepting text input events.")))))))))))
