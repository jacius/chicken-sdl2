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
        sdl-rect->list
        sdl-rect-set!
        sdl-rect-x  sdl-rect-x-set!
        sdl-rect-y  sdl-rect-y-set!
        sdl-rect-w  sdl-rect-w-set!
        sdl-rect-h  sdl-rect-h-set!)

(define-uniform-struct-accessors
  procs: (make-sdl-rect sdl-rect->list sdl-rect-set!)
  fields: ((x index: 0 default: 0 guard: void
              get: sdl-rect-x set: sdl-rect-x-set!)
           (y index: 1 default: 0 guard: void
              get: sdl-rect-y set: sdl-rect-y-set!)
           (w index: 2 default: 0 guard: void
              get: sdl-rect-w set: sdl-rect-w-set!)
           (h index: 3 default: 0 guard: void
              get: sdl-rect-h set: sdl-rect-h-set!))
  using: (sdl-rect sdl-rect?
          %wrap-sdl-rect %sdl-rect-data
          s32vector s32vector-ref s32vector->list))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; POINT

(export make-sdl-point
        sdl-point->list
        sdl-point-set!
        sdl-point-x  sdl-point-x-set!
        sdl-point-y  sdl-point-y-set!)

(define-uniform-struct-accessors
  procs: (make-sdl-point sdl-point->list sdl-point-set!)
  fields: ((x index: 0 default: 0 guard: void
              get: sdl-point-x set: sdl-point-x-set!)
           (y index: 1 default: 0 guard: void
              get: sdl-point-y set: sdl-point-y-set!))
  using: (sdl-point sdl-point?
          %wrap-sdl-point %sdl-point-data
          s32vector s32vector-ref s32vector->list))
