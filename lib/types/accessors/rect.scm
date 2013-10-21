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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; RECT

(export make-sdl-rect
        sdl-rect-x sdl-rect-x-set!
        sdl-rect-y sdl-rect-y-set!
        sdl-rect-w sdl-rect-w-set!
        sdl-rect-h sdl-rect-h-set!
        sdl-rect-set!
        sdl-rect->list)

(define-record-printer (sdl-rect c out)
  (%displayify out "#<sdl-rect " (sdl-rect->list c) ">"))

(define (make-sdl-rect x y w h)
  (%wrap-sdl-rect (s32vector x y w h)))

(define-foreign-struct SDL_Rect*
  (int x sdl-rect-x sdl-rect-x-set!)
  (int y sdl-rect-y sdl-rect-y-set!)
  (int w sdl-rect-w sdl-rect-w-set!)
  (int h sdl-rect-h sdl-rect-h-set!))

(define (sdl-rect-set! r #!key x y w h)
  (assert (sdl-rect? r))
  (when x (sdl-rect-x-set! r x))
  (when y (sdl-rect-y-set! r y))
  (when w (sdl-rect-w-set! r w))
  (when h (sdl-rect-h-set! r h)))

(define (sdl-rect->list c)
  (s32vector->list (%sdl-rect-data c)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; POINT

(export make-sdl-point
        sdl-point-x sdl-point-x-set!
        sdl-point-y sdl-point-y-set!
        sdl-point-set!
        sdl-point->list)

(define-record-printer (sdl-point c out)
  (%displayify out "#<sdl-point " (sdl-point->list c) ">"))

(define (make-sdl-point x y)
  (%wrap-sdl-point (s32vector x y)))

(define-foreign-struct SDL_Point*
  (int x sdl-point-x sdl-point-x-set!)
  (int y sdl-point-y sdl-point-y-set!))

(define (sdl-point-set! p #!key x y)
  (assert (sdl-point? p))
  (when x (sdl-point-x-set! p x))
  (when y (sdl-point-y-set! p y)))

(define (sdl-point->list c)
  (s32vector->list (%sdl-point-data c)))
