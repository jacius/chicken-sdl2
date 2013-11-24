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


(define-foreign-constants+ Uint32
  (%sdl-window-pos->symbol
   %symbol->sdl-window-pos
   %sdl-window-pos->keyword
   %keyword->sdl-window-pos)

  ((SDL_WINDOWPOS_UNDEFINED  #:undefined)
   (SDL_WINDOWPOS_CENTERED   #:centered)))

(define-foreign-constants Uint32
  SDL_WINDOWPOS_UNDEFINED_MASK
  SDL_WINDOWPOS_CENTERED_MASK)


(export SDL_WINDOWPOS_UNDEFINED_DISPLAY
        SDL_WINDOWPOS_ISUNDEFINED
        SDL_WINDOWPOS_CENTERED_DISPLAY
        SDL_WINDOWPOS_ISCENTERED)

(define-function-binding* SDL_WINDOWPOS_UNDEFINED_DISPLAY
  return: (Uint32 value)
  args: ((Uint32 displayNum))
  body: "C_return(SDL_WINDOWPOS_UNDEFINED_DISPLAY(displayNum));")

(define-function-binding* SDL_WINDOWPOS_ISUNDEFINED
  return: (bool is-undefined?)
  args: ((Uint32 value))
  body: "C_return(SDL_WINDOWPOS_ISUNDEFINED(value));")

(define-function-binding* SDL_WINDOWPOS_CENTERED_DISPLAY
  return: (Uint32 value)
  args: ((Uint32 displayNum))
  body: "C_return(SDL_WINDOWPOS_CENTERED_DISPLAY(displayNum));")

(define-function-binding* SDL_WINDOWPOS_ISCENTERED
  return: (bool is-undefined?)
  args: ((Uint32 value))
  body: "C_return(SDL_WINDOWPOS_ISCENTERED(value));")


(define-foreign-constants+ SDL_WindowFlags
  (%sdl-window-flag->symbol
   %symbol->sdl-window-flag
   %sdl-window-flag->keyword
   %keyword->sdl-window-flag)

  ((SDL_WINDOW_FULLSCREEN          #:fullscreen)
   (SDL_WINDOW_FULLSCREEN_DESKTOP  #:fullscreen-desktop)
   (SDL_WINDOW_OPENGL              #:opengl)
   (SDL_WINDOW_SHOWN               #:shown)
   (SDL_WINDOW_HIDDEN              #:hidden)
   (SDL_WINDOW_BORDERLESS          #:borderless)
   (SDL_WINDOW_RESIZABLE           #:resizable)
   (SDL_WINDOW_MINIMIZED           #:minimized)
   (SDL_WINDOW_MAXIMIZED           #:maximized)
   (SDL_WINDOW_INPUT_GRABBED       #:input-grabbed)
   (SDL_WINDOW_INPUT_FOCUS         #:input-focus)
   (SDL_WINDOW_MOUSE_FOCUS         #:mouse-focus)
   (SDL_WINDOW_FOREIGN             #:foreign)))


(define-foreign-constants+ SDL_WindowEventID
  (%sdl-window-event-id->symbol
   %symbol->sdl-window-event-id
   %sdl-window-event-id->keyword
   %keyword->sdl-window-event-id)

  ((SDL_WINDOWEVENT_NONE          #:none)
   (SDL_WINDOWEVENT_SHOWN         #:shown)
   (SDL_WINDOWEVENT_HIDDEN        #:hidden)
   (SDL_WINDOWEVENT_EXPOSED       #:exposed)
   (SDL_WINDOWEVENT_MOVED         #:moved)
   (SDL_WINDOWEVENT_RESIZED       #:resized)
   (SDL_WINDOWEVENT_SIZE_CHANGED  #:size-changed)
   (SDL_WINDOWEVENT_MINIMIZED     #:minimized)
   (SDL_WINDOWEVENT_MAXIMIZED     #:maximized)
   (SDL_WINDOWEVENT_RESTORED      #:restored)
   (SDL_WINDOWEVENT_ENTER         #:enter)
   (SDL_WINDOWEVENT_LEAVE         #:leave)
   (SDL_WINDOWEVENT_FOCUS_GAINED  #:focus-gained)
   (SDL_WINDOWEVENT_FOCUS_LOST    #:focus-lost)
   (SDL_WINDOWEVENT_CLOSE         #:close)))
