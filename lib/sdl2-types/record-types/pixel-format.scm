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


(export sdl-pixel-format?
        %wrap-sdl-pixel-format
        %sdl-pixel-format-pointer
        %sdl-pixel-format-pointer-set!
        %sdl-pixel-format-data
        %sdl-pixel-format-data-set!

        allocate-sdl-pixel-format
        %SDL_PixelFormat*->sdl-pixel-format
        %sdl-pixel-format->SDL_PixelFormat*
        %->SDL_PixelFormat*)

(define-record-type sdl-pixel-format
  (%wrap-sdl-pixel-format pointer data)
  sdl-pixel-format?
  (pointer %sdl-pixel-format-pointer %sdl-pixel-format-pointer-set!)
  (data %sdl-pixel-format-data %sdl-pixel-format-data-set!))

(define-nonuniform-struct-constructors
  for: ("SDL_PixelFormat"
        sdl-pixel-format  sdl-pixel-format?  %wrap-sdl-pixel-format
        %sdl-pixel-format-pointer  %sdl-pixel-format-pointer-set!
        %sdl-pixel-format-data     %sdl-pixel-format-data-set!)
  allocate: allocate-sdl-pixel-format
  converters: (%SDL_PixelFormat*->sdl-pixel-format
               %sdl-pixel-format->SDL_PixelFormat*
               %->SDL_PixelFormat*))
