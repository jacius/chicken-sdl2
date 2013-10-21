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


(export SDL_RectEmpty
        SDL_RectEquals
        SDL_EnclosePoints
        SDL_IntersectRectAndLine
        SDL_HasIntersection
        SDL_IntersectRect
        SDL_UnionRect)


(define-function-binding SDL_RectEmpty
  return: (bool rect-empty?)
  args: (((const SDL_Rect*) r)))

(define-function-binding SDL_RectEquals
  return: (bool rect-equals?)
  args: (((const SDL_Rect*) a)
         ((const SDL_Rect*) b)))

(define-function-binding SDL_EnclosePoints
  return: (bool success?)
  args: (((const SDL_Point*) points)
         (int count)
         ((const SDL_Rect*) clip-or-null)
         (SDL_Rect* result-out)))

(define-function-binding SDL_HasIntersection
  return: (bool intersects?)
  args: (((const SDL_Rect*) a)
         ((const SDL_Rect*) b)))

(define-function-binding SDL_IntersectRect
  return: (bool intersects?)
  args: (((const SDL_Rect*) a)
         ((const SDL_Rect*) b)
         (SDL_Rect* result-out)))

(define-function-binding SDL_IntersectRectAndLine
  return: (bool intersects?)
  args: (((const SDL_Rect*) rect)
         ((c-pointer int) x1-in-out)
         ((c-pointer int) y1-in-out)
         ((c-pointer int) x2-in-out)
         ((c-pointer int) y2-in-out)))

(define-function-binding SDL_UnionRect
  args: (((const SDL_Rect*) a)
         ((const SDL_Rect*) b)
         (SDL_Rect* result-out)))

