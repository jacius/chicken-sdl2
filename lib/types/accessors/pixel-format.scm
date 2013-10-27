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


(export sdl-pixel-format-format
        sdl-pixel-format-palette
        sdl-pixel-format-bits-per-pixel
        sdl-pixel-format-bytes-per-pixel
        sdl-pixel-format-padding
        sdl-pixel-format-rmask
        sdl-pixel-format-gmask
        sdl-pixel-format-bmask
        sdl-pixel-format-amask
        sdl-pixel-format-rloss
        sdl-pixel-format-gloss
        sdl-pixel-format-bloss
        sdl-pixel-format-aloss
        sdl-pixel-format-rshift
        sdl-pixel-format-gshift
        sdl-pixel-format-bshift
        sdl-pixel-format-ashift
        sdl-pixel-format-refcount
        sdl-pixel-format-next)

(define-nonuniform-struct-accessors SDL_PixelFormat*
  (Uint32 format sdl-pixel-format-format)
  (SDL_Palette* palette sdl-pixel-format-palette)
  (Uint8 BitsPerPixel sdl-pixel-format-bits-per-pixel)
  (Uint8 BytesPerPixel sdl-pixel-format-bytes-per-pixel)
  ;;(Uint8 padding[2]) ; see below
  (Uint32 Rmask sdl-pixel-format-rmask)
  (Uint32 Gmask sdl-pixel-format-gmask)
  (Uint32 Bmask sdl-pixel-format-bmask)
  (Uint32 Amask sdl-pixel-format-amask)
  (Uint8 Rloss  sdl-pixel-format-rloss)
  (Uint8 Gloss  sdl-pixel-format-gloss)
  (Uint8 Bloss  sdl-pixel-format-bloss)
  (Uint8 Aloss  sdl-pixel-format-aloss)
  (Uint8 Rshift sdl-pixel-format-rshift)
  (Uint8 Gshift sdl-pixel-format-gshift)
  (Uint8 Bshift sdl-pixel-format-bshift)
  (Uint8 Ashift sdl-pixel-format-ashift)
  (int refcount sdl-pixel-format-refcount)
  (SDL_PixelFormat* next sdl-pixel-format-next))

(define sdl-pixel-format-padding
  (let ((get-padding
         (foreign-lambda*
          Uint8 ((SDL_PixelFormat* pf) (unsigned-byte i))
          "C_return(pf->padding[i]);")))
    (lambda (pixel-format)
      (list (get-padding pixel-format 0) (get-padding pixel-format 1)))))
