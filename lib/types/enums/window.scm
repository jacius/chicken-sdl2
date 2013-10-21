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


(export SDL_WINDOWPOS_UNDEFINED_MASK
        SDL_WINDOWPOS_UNDEFINED
        SDL_WINDOWPOS_UNDEFINED_DISPLAY
        SDL_WINDOWPOS_ISUNDEFINED

        SDL_WINDOWPOS_CENTERED_MASK
        SDL_WINDOWPOS_CENTERED
        SDL_WINDOWPOS_CENTERED_DISPLAY
        SDL_WINDOWPOS_ISCENTERED)


(define SDL_WINDOWPOS_UNDEFINED_MASK
  (foreign-value "SDL_WINDOWPOS_UNDEFINED_MASK" unsigned-int32))
(define SDL_WINDOWPOS_UNDEFINED
  (foreign-value "SDL_WINDOWPOS_UNDEFINED" unsigned-int32))

(define-function-binding* SDL_WINDOWPOS_UNDEFINED_DISPLAY
  return: (unsigned-int32 value)
  args: ((unsigned-int32 displayNum))
  body: "C_return(SDL_WINDOWPOS_UNDEFINED_DISPLAY(displayNum));")

(define-function-binding* SDL_WINDOWPOS_ISUNDEFINED
  return: (bool is-undefined?)
  args: ((unsigned-int32 value))
  body: "C_return(SDL_WINDOWPOS_ISUNDEFINED(value));")


(define SDL_WINDOWPOS_CENTERED_MASK
  (foreign-value "SDL_WINDOWPOS_CENTERED_MASK" unsigned-int32))
(define SDL_WINDOWPOS_CENTERED
  (foreign-value "SDL_WINDOWPOS_CENTERED" unsigned-int32))

(define-function-binding* SDL_WINDOWPOS_CENTERED_DISPLAY
  return: (unsigned-int32 value)
  args: ((unsigned-int32 displayNum))
  body: "C_return(SDL_WINDOWPOS_CENTERED_DISPLAY(displayNum));")

(define-function-binding* SDL_WINDOWPOS_ISCENTERED
  return: (bool is-undefined?)
  args: ((unsigned-int32 value))
  body: "C_return(SDL_WINDOWPOS_ISCENTERED(value));")


(define-and-export-enum SDL_WindowFlags
  SDL_WINDOW_FULLSCREEN
  SDL_WINDOW_FULLSCREEN_DESKTOP
  SDL_WINDOW_OPENGL
  SDL_WINDOW_SHOWN
  SDL_WINDOW_HIDDEN
  SDL_WINDOW_BORDERLESS
  SDL_WINDOW_RESIZABLE
  SDL_WINDOW_MINIMIZED
  SDL_WINDOW_MAXIMIZED
  SDL_WINDOW_INPUT_GRABBED
  SDL_WINDOW_INPUT_FOCUS
  SDL_WINDOW_MOUSE_FOCUS
  SDL_WINDOW_FOREIGN)


(define-and-export-enum SDL_WindowEventID
  SDL_WINDOWEVENT_NONE
  SDL_WINDOWEVENT_SHOWN
  SDL_WINDOWEVENT_HIDDEN
  SDL_WINDOWEVENT_EXPOSED
  SDL_WINDOWEVENT_MOVED
  SDL_WINDOWEVENT_RESIZED
  SDL_WINDOWEVENT_SIZE_CHANGED
  SDL_WINDOWEVENT_MINIMIZED
  SDL_WINDOWEVENT_MAXIMIZED
  SDL_WINDOWEVENT_RESTORED
  SDL_WINDOWEVENT_ENTER
  SDL_WINDOWEVENT_LEAVE
  SDL_WINDOWEVENT_FOCUS_GAINED
  SDL_WINDOWEVENT_FOCUS_LOST
  SDL_WINDOWEVENT_CLOSE)
