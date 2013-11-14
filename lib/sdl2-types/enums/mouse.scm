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


;;; Technically not an enum, but close enough.
(define-and-export-enum (SDL_MouseButton sdl-mouse-button-name)
  SDL_BUTTON_LEFT
  SDL_BUTTON_MIDDLE
  SDL_BUTTON_RIGHT
  SDL_BUTTON_X1
  SDL_BUTTON_X2)

;;; Technically not an enum, but close enough.
(define-and-export-enum (SDL_MouseButtonMask sdl-mouse-button-mask-name)
  SDL_BUTTON_LMASK
  SDL_BUTTON_MMASK
  SDL_BUTTON_RMASK
  SDL_BUTTON_X1MASK
  SDL_BUTTON_X2MASK)

(define-and-export-enum SDL_SystemCursor
  SDL_SYSTEM_CURSOR_ARROW
  SDL_SYSTEM_CURSOR_IBEAM
  SDL_SYSTEM_CURSOR_WAIT
  SDL_SYSTEM_CURSOR_CROSSHAIR
  SDL_SYSTEM_CURSOR_WAITARROW
  SDL_SYSTEM_CURSOR_SIZENWSE
  SDL_SYSTEM_CURSOR_SIZENESW
  SDL_SYSTEM_CURSOR_SIZEWE
  SDL_SYSTEM_CURSOR_SIZENS
  SDL_SYSTEM_CURSOR_SIZEALL
  SDL_SYSTEM_CURSOR_NO
  SDL_SYSTEM_CURSOR_HAND
  SDL_NUM_SYSTEM_CURSORS)


(export sdl-mouse-masks->list
        sdl-mouse-mask->button)

(define (sdl-mouse-masks->list state)
  (masks->list state
               (list SDL_BUTTON_LMASK
                     SDL_BUTTON_MMASK
                     SDL_BUTTON_RMASK
                     SDL_BUTTON_X1MASK
                     SDL_BUTTON_X2MASK)))

(define (sdl-mouse-mask->button mask)
  (select mask
    ((SDL_BUTTON_LMASK)  SDL_BUTTON_LEFT)
    ((SDL_BUTTON_MMASK)  SDL_BUTTON_MIDDLE)
    ((SDL_BUTTON_RMASK)  SDL_BUTTON_RIGHT)
    ((SDL_BUTTON_X1MASK) SDL_BUTTON_X1)
    ((SDL_BUTTON_X2MASK) SDL_BUTTON_X2)))
