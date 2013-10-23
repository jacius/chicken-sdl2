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


(export SDL_CreateRGBSurface
        SDL_CreateRGBSurfaceFrom
        SDL_FreeSurface

        SDL_ConvertSurface
        SDL_ConvertSurfaceFormat
        SDL_ConvertPixels

        SDL_LoadBMP
        ;;; TODO: SDL_LoadBMP_RW
        SDL_SaveBMP
        ;;; TODO: SDL_SaveBMP_RW

        SDL_LockSurface
        SDL_UnlockSurface
        SDL_MUSTLOCK

        SDL_BlitSurface
        SDL_BlitScaled
        SDL_LowerBlit
        SDL_LowerBlitScaled

        SDL_FillRect
        SDL_FillRects

        SDL_GetClipRect
        SDL_GetColorKey
        SDL_GetSurfaceAlphaMod
        SDL_GetSurfaceBlendMode
        SDL_GetSurfaceColorMod

        SDL_SetClipRect
        SDL_SetColorKey
        SDL_SetSurfaceAlphaMod
        SDL_SetSurfaceBlendMode
        SDL_SetSurfaceColorMod

        SDL_SetSurfacePalette
        SDL_SetSurfaceRLE)


(define-function-binding SDL_CreateRGBSurface
  return: (SDL_Surface* surface)
  args: ((unsigned-int32 flags)
         (int width)
         (int height)
         (int depth)
         (unsigned-int32 Rmask)
         (unsigned-int32 Gmask)
         (unsigned-int32 Bmask)
         (unsigned-int32 Amask)))

(define-function-binding SDL_CreateRGBSurfaceFrom
  return: (SDL_Surface* surface)
  args: ((c-pointer pixels)
         (int width)
         (int height)
         (int depth)
         (int pitch)
         (unsigned-int32 Rmask)
         (unsigned-int32 Gmask)
         (unsigned-int32 Bmask)
         (unsigned-int32 Amask)))

(define-function-binding SDL_FreeSurface
  args: ((SDL_Surface* surface)))


(define-function-binding SDL_ConvertSurface
  return: (SDL_Surface* surface)
  args: ((SDL_Surface* src)
         (SDL_PixelFormat* fmt)
         (unsigned-int32 flags)))

(define-function-binding SDL_ConvertSurfaceFormat
  return: (SDL_Surface* surface)
  args: ((SDL_Surface* src)
         (SDL_PixelFormatEnum pixel_format)
         (unsigned-int32 flags)))

(define-function-binding SDL_ConvertPixels
  return: (int zero-if-success)
  args: ((int width)
         (int height)
         (SDL_PixelFormatEnum src-format)
         ((const c-pointer) src)
         (int src-pitch)
         (SDL_PixelFormatEnum dst-format)
         (c-pointer dst-out)
         (int dst-pitch)))


(define-function-binding SDL_LoadBMP
  return: (SDL_Surface* surface)
  args: (((const c-string) filepath)))

;;; TODO:
;; (define-function-binding SDL_LoadBMP_RW
;;   return: (SDL_Surface* surface)
;;   args: ((SDL_RWops* src)
;;          (bool freesrc)))

(define-function-binding SDL_SaveBMP
  return: (int zero-if-success)
  args: ((SDL_Surface* surface)
         ((const c-string) filepath)))

;;; TODO:
;; (define-function-binding SDL_SaveBMP_RW
;;   return: (int zero-if-success)
;;   args: ((SDL_Surface* surface)
;;          (SDL_RWops* dst)
;;          (bool freedst)))


(define-function-binding SDL_LockSurface
  return: (int zero-if-success)
  args: ((SDL_Surface* surface)))

(define-function-binding SDL_UnlockSurface
  args: ((SDL_Surface* surface)))

(define-function-binding SDL_MUSTLOCK
  return: (bool must-lock?)
  args: ((SDL_Surface* surface)))


(define-function-binding SDL_BlitSurface
  return: (int zero-if-success)
  args: ((SDL_Surface* src)
         ((const SDL_Rect*) srcrect)
         (SDL_Surface* dst)
         (SDL_Rect* dstrect-in-out)))

(define-function-binding SDL_BlitScaled
  return: (int zero-if-success)
  args: ((SDL_Surface* src)
         ((const SDL_Rect*) srcrect)
         (SDL_Surface* dst)
         (SDL_Rect* dstrect-in-out)))

(define-function-binding SDL_LowerBlit
  return: (int zero-if-success)
  args: ((SDL_Surface* src)
         (SDL_Rect* srcrect)
         (SDL_Surface* dst)
         (SDL_Rect* dstrect-in-out)))

(define-function-binding SDL_LowerBlitScaled
  return: (int zero-if-success)
  args: ((SDL_Surface* src)
         (SDL_Rect* srcrect)
         (SDL_Surface* dst)
         (SDL_Rect* dstrect-in-out)))


(define-function-binding SDL_FillRect
  return: (int zero-if-success)
  args: ((SDL_Surface* dst)
         ((const SDL_Rect*) rect)
         (unsigned-int32 mapped-color)))

(define-function-binding SDL_FillRects
  return: (int zero-if-success)
  args: ((SDL_Surface* dst)
         ((const SDL_Rect*) rects)
         (int count)
         (unsigned-int32 mapped-color)))


(define-function-binding SDL_GetClipRect
  args: ((SDL_Surface* surface)
         (SDL_Rect* rect-out)))

(define-function-binding SDL_GetColorKey
  return: (int zero-if-success)
  args: ((SDL_Surface* surface)
         ((c-pointer unsigned-int32) key-out)))

(define-function-binding SDL_GetSurfaceAlphaMod
  return: (int zero-if-success)
  args: ((SDL_Surface* surface)
         ((c-pointer unsigned-int8) alpha-out)))

(define-function-binding SDL_GetSurfaceBlendMode
  return: (int zero-if-success)
  args: ((SDL_Surface* surface)
         ((c-pointer "SDL_BlendMode") blend-mode-out)))

(define-function-binding SDL_GetSurfaceColorMod
  return: (int zero-if-success)
  args: ((SDL_Surface* surface)
         ((c-pointer unsigned-int8) r-out)
         ((c-pointer unsigned-int8) g-out)
         ((c-pointer unsigned-int8) b-out)))


(define-function-binding SDL_SetClipRect
  return: (bool intersects?)
  args: ((SDL_Surface* surface)
         ((const SDL_Rect*) rect)))

(define-function-binding SDL_SetColorKey
  return: (int zero-on-success)
  args: ((SDL_Surface* surface)
         (bool enable-or-disable?)
         (unsigned-int32 key)))

(define-function-binding SDL_SetSurfaceAlphaMod
  return: (int zero-on-success)
  args: ((SDL_Surface* surface)
         (unsigned-int8 alpha)))

(define-function-binding SDL_SetSurfaceBlendMode
  return: (int zero-on-success)
  args: ((SDL_Surface* surface)
         (SDL_BlendMode blend-mode)))

(define-function-binding SDL_SetSurfaceColorMod
  return: (int zero-on-success)
  args: ((SDL_Surface* surface)
         (unsigned-int8 r)
         (unsigned-int8 g)
         (unsigned-int8 b)))


(define-function-binding SDL_SetSurfacePalette
  return: (int zero-on-success)
  args: ((SDL_Surface* surface)
         (SDL_Palette* palette)))

(define-function-binding SDL_SetSurfaceRLE
  return: (int zero-on-success)
  args: ((SDL_Surface* surface)
         (bool enable-or-disable)))
