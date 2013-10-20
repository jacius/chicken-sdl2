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


(export sdl-color?
        %wrap-sdl-color
        %sdl-color-data
        %sdl-color-data-set!
        %sdl-color->SDL_Color*
        %SDL_Color*->sdl-color)

(define-record-type sdl-color
  (%wrap-sdl-color data)
  sdl-color?
  (data %sdl-color-data %sdl-color-data-set!))

(define (%sdl-color->SDL_Color* color)
  ((foreign-lambda* (c-pointer "SDL_Color") ((u8vector data))
                    "C_return((SDL_Color*)data);")
   (%sdl-color-data color)))

(define (%SDL_Color*->sdl-color ptr)
  (let ((new-color (%wrap-sdl-color (make-u8vector 4))))
    ((foreign-lambda* void (((c-pointer "SDL_Color") c) (u8vector data))
                      "*((SDL_Color*)data) = *c;")
     ptr (%sdl-color-data new-color))
    new-color))
