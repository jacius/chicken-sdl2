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


(define-foreign-constants+ SDL_MouseButton
  (sdl-mouse-button-name
   %symbol->sdl-mouse-button
   %sdl-mouse-button->keyword
   %keyword->sdl-mouse-button)

  ((SDL_BUTTON_LEFT    #:left)
   (SDL_BUTTON_MIDDLE  #:middle)
   (SDL_BUTTON_RIGHT   #:right)
   (SDL_BUTTON_X1      #:x1)
   (SDL_BUTTON_X2      #:x2)))


(define-foreign-constants+ SDL_MouseButtonMask
  (sdl-mouse-button-mask-name
   %symbol->sdl-mouse-button-mask
   %sdl-mouse-button-mask->keyword
   %keyword->sdl-mouse-button-mask)

  ((SDL_BUTTON_LMASK   #:left-mask)
   (SDL_BUTTON_MMASK   #:middle-mask)
   (SDL_BUTTON_RMASK   #:right-mask)
   (SDL_BUTTON_X1MASK  #:x1-mask)
   (SDL_BUTTON_X2MASK  #:x2-mask)))


(export sdl-mouse-masks->list)
(define (sdl-mouse-masks->list state)
  (masks->list state
               (list SDL_BUTTON_LMASK
                     SDL_BUTTON_MMASK
                     SDL_BUTTON_RMASK
                     SDL_BUTTON_X1MASK
                     SDL_BUTTON_X2MASK)))


(export sdl-mouse-mask->button)
(define (sdl-mouse-mask->button mask)
  (select mask
    ((SDL_BUTTON_LMASK)  SDL_BUTTON_LEFT)
    ((SDL_BUTTON_MMASK)  SDL_BUTTON_MIDDLE)
    ((SDL_BUTTON_RMASK)  SDL_BUTTON_RIGHT)
    ((SDL_BUTTON_X1MASK) SDL_BUTTON_X1)
    ((SDL_BUTTON_X2MASK) SDL_BUTTON_X2)))
