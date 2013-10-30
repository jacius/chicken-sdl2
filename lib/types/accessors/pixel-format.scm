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


(export allocate-sdl-pixel-format
        %SDL_PixelFormat*->sdl-pixel-format
        %sdl-pixel-format->SDL_PixelFormat*
        %->SDL_PixelFormat*

        sdl-pixel-format-format
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

(define-nonuniform-struct-constructors
  for: (SDL_PixelFormat*
        sdl-pixel-format  sdl-pixel-format?  %wrap-sdl-pixel-format
        %sdl-pixel-format-pointer  %sdl-pixel-format-pointer-set!
        %sdl-pixel-format-data     %sdl-pixel-format-data-set!)
  allocate: allocate-sdl-pixel-format
  converters: (%SDL_PixelFormat*->sdl-pixel-format
               %sdl-pixel-format->SDL_PixelFormat*
               %->SDL_PixelFormat*))

(define-nonuniform-struct-accessors
  type: SDL_PixelFormat*
  fields: (((Uint32 format)         get: sdl-pixel-format-format)
           ((SDL_Palette* palette)  get: sdl-pixel-format-palette)
           ((Uint8 BitsPerPixel)    get: sdl-pixel-format-bits-per-pixel)
           ((Uint8 BytesPerPixel)   get: sdl-pixel-format-bytes-per-pixel)
           ;; Uint8 padding[2]      ; see below
           ((Uint32 Rmask)          get: sdl-pixel-format-rmask)
           ((Uint32 Gmask)          get: sdl-pixel-format-gmask)
           ((Uint32 Bmask)          get: sdl-pixel-format-bmask)
           ((Uint32 Amask)          get: sdl-pixel-format-amask)
           ((Uint8 Rloss)           get: sdl-pixel-format-rloss)
           ((Uint8 Gloss)           get: sdl-pixel-format-gloss)
           ((Uint8 Bloss)           get: sdl-pixel-format-bloss)
           ((Uint8 Aloss)           get: sdl-pixel-format-aloss)
           ((Uint8 Rshift)          get: sdl-pixel-format-rshift)
           ((Uint8 Gshift)          get: sdl-pixel-format-gshift)
           ((Uint8 Bshift)          get: sdl-pixel-format-bshift)
           ((Uint8 Ashift)          get: sdl-pixel-format-ashift)
           ((int refcount)          get: sdl-pixel-format-refcount)
           ((SDL_PixelFormat* next) get: sdl-pixel-format-next)))

(define sdl-pixel-format-padding
  (let ((get-padding
         (foreign-lambda*
          Uint8 ((SDL_PixelFormat* pf) (unsigned-byte i))
          "C_return(pf->padding[i]);")))
    (lambda (pixel-format)
      (list (get-padding pixel-format 0) (get-padding pixel-format 1)))))
