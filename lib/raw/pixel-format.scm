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


(export SDL_GetPixelFormatName
        SDL_PixelFormatEnumToMasks
        SDL_MasksToPixelFormatEnum

        SDL_AllocFormat
        SDL_FreeFormat
        SDL_AllocPalette
        SDL_FreePalette

        SDL_SetPixelFormatPalette
        SDL_SetPaletteColors

        SDL_MapRGB
        SDL_MapRGBA
        SDL_GetRGB
        SDL_GetRGBA

        SDL_CalculateGammaRamp)


(define-function-binding SDL_GetPixelFormatName
  return: ((const c-string) name)
  args: ((SDL_PixelFormatEnum format)))

(define-function-binding SDL_PixelFormatEnumToMasks
  return: (bool success?)
  args: ((SDL_PixelFormatEnum format)
         ((c-pointer int) bpp)
         ((c-pointer unsigned-int32) rmask-out)
         ((c-pointer unsigned-int32) gmask-out)
         ((c-pointer unsigned-int32) bmask-out)
         ((c-pointer unsigned-int32) amask-out)))

(define-function-binding SDL_MasksToPixelFormatEnum
  return: (SDL_PixelFormatEnum format)
  args: ((int bpp)
         (unsigned-int32 rmask)
         (unsigned-int32 gmask)
         (unsigned-int32 bmask)
         (unsigned-int32 amask)))


(define-function-binding SDL_AllocFormat
  return: (SDL_PixelFormat* format)
  args: ((SDL_PixelFormatEnum pixel_format)))

(define-function-binding SDL_FreeFormat
  args: ((SDL_PixelFormat* format)))

(define-function-binding SDL_AllocPalette
  return: (SDL_Palette* palette)
  args: ((int ncolors)))

(define-function-binding SDL_FreePalette
  args: ((SDL_Palette* palette)))


(define-function-binding SDL_SetPixelFormatPalette
  return: (int zero-if-success)
  args: ((SDL_PixelFormat* format)
         (SDL_Palette* palette)))

(define-function-binding SDL_SetPaletteColors
  return: (int zero-if-success)
  args: ((SDL_Palette* palette)
         ((const SDL_Color*) colors)
         (int firstcolor)
         (int ncolors)))


(define-function-binding SDL_MapRGB
  return: (unsigned-int32 color)
  args: (((const SDL_PixelFormat*) format)
         (unsigned-int8 r)
         (unsigned-int8 g)
         (unsigned-int8 b)))

(define-function-binding SDL_MapRGBA
  return: (unsigned-int32 color)
  args: (((const SDL_PixelFormat*) format)
         (unsigned-int8 r)
         (unsigned-int8 g)
         (unsigned-int8 b)
         (unsigned-int8 a)))

(define-function-binding SDL_GetRGB
  args: ((unsigned-int32 pixel)
         ((const SDL_PixelFormat*) format)
         ((c-pointer unsigned-int8) r-out)
         ((c-pointer unsigned-int8) g-out)
         ((c-pointer unsigned-int8) b-out)))

(define-function-binding SDL_GetRGBA
  args: ((unsigned-int32 pixel)
         ((const SDL_PixelFormat*) format)
         ((c-pointer unsigned-int8) r-out)
         ((c-pointer unsigned-int8) g-out)
         ((c-pointer unsigned-int8) b-out)
         ((c-pointer unsigned-int8) a-out)))


(define-function-binding SDL_CalculateGammaRamp
  args: ((float gamma)
         ((c-pointer unsigned-int16) ramp-out)))
