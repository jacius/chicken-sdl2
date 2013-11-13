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
  (print "Try compiling like this:  csc demos/raw/basics.scm")
  (print "Then run it like this:    demos/raw/basics")
  (exit 1))

(use sdl2-types sdl2-raw miscmacros)

(SDL_Init (bitwise-ior SDL_INIT_VIDEO
                       SDL_INIT_EVENTS
                       SDL_INIT_TIMER))
(on-exit SDL_Quit)


(define window
  (SDL_CreateWindow
   "SDL Basics"                         ; title
   SDL_WINDOWPOS_CENTERED  100          ; x, y
   800  600                             ; w, h
   (bitwise-ior                         ; flags
    SDL_WINDOW_SHOWN
    SDL_WINDOW_RESIZABLE)))

;;; Hacky event loop. Please don't consider this the recommended way
;;; of structuring an event loop in a real app!

(let ((done? #f)
      (text-input? #f)
      (ev (allocate-sdl-event)))
  (while (not done?)
    (SDL_WaitEvent ev)
    (print ev)
    (select (sdl-event-type ev)

      ;; Window exposed, resized, etc.
      ((SDL_WINDOWEVENT)
       (SDL_FillRect (SDL_GetWindowSurface window)
                     #f                   ; NULL, i.e. fill the whole surface
                     (SDL_MapRGB
                      (sdl-surface-format (SDL_GetWindowSurface window))
                      0 50 128))
       (SDL_UpdateWindowSurface window))

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
                  (print "Stopped accepting text input events."))))))))))
