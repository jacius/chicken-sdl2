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

(export sdl-rect?
        %wrap-sdl-rect
        %sdl-rect-data
        %sdl-rect-data-set!
        %sdl-rect->SDL_Rect*
        %SDL_Rect*->sdl-rect
        %->SDL_Rect*)

(define-record-type sdl-rect
  (%wrap-sdl-rect data)
  sdl-rect?
  (data %sdl-rect-data %sdl-rect-data-set!))

(define (%sdl-rect->SDL_Rect* rect)
  ((foreign-lambda* SDL_Rect* ((s32vector data))
                    "C_return((SDL_Rect*)data);")
   (%sdl-rect-data rect)))

(define (%SDL_Rect*->sdl-rect ptr)
  (let ((new-rect (%wrap-sdl-rect (make-s32vector 4 0))))
    ((foreign-lambda* void ((SDL_Rect* r) (s32vector data))
                      "*((SDL_Rect*)data) = *r;")
     ptr (%sdl-rect-data new-rect))
    new-rect))

(define (%->SDL_Rect* rect)
  (cond
   ((sdl-rect? rect)
    (%sdl-rect->SDL_Rect* rect))
   ((pointer? rect)
    ((foreign-lambda* SDL_Rect* ((c-pointer ptr))
                      "C_return((SDL_Rect*)ptr);")
     rect))
   ((eq? #f rect)
    (foreign-value "(SDL_Rect*)NULL" SDL_Rect*))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; POINT

(export sdl-point?
        %wrap-sdl-point
        %sdl-point-data
        %sdl-point-data-set!
        %sdl-point->SDL_Point*
        %SDL_Point*->sdl-point
        %->SDL_Point*)

(define-record-type sdl-point
  (%wrap-sdl-point data)
  sdl-point?
  (data %sdl-point-data %sdl-point-data-set!))

(define (%sdl-point->SDL_Point* point)
  ((foreign-lambda* SDL_Point* ((s32vector data))
                    "C_return((SDL_Point*)data);")
   (%sdl-point-data point)))

(define (%SDL_Point*->sdl-point ptr)
  (let ((new-point (%wrap-sdl-rect (make-s32vector 2 0))))
    ((foreign-lambda* void ((SDL_Point* p) (s32vector data))
                      "*((SDL_Point*)data) = *p;")
     ptr (%sdl-point-data new-point))
    new-point))

(define (%->SDL_Point* point)
  (cond
   ((sdl-point? point)
    (%sdl-point->SDL_Point* point))
   ((pointer? point)
    ((foreign-lambda* SDL_Point* ((c-pointer ptr))
                      "C_return((SDL_Point*)ptr);")
     point))
   ((eq? #f point)
    (foreign-value "(SDL_Point*)NULL" SDL_Point*))))
