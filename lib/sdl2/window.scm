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

(export sdl-create-window
        sdl-get-window-from-id
        sdl-destroy-window

        sdl-update-window-surface
        sdl-update-window-surface-rects

        sdl-show-window
        sdl-hide-window
        sdl-maximize-window
        sdl-minimize-window
        sdl-raise-window
        sdl-restore-window

        sdl-window-brightness
        ;; TODO: sdl-window-data
        sdl-window-display-index
        ;; TODO: sdl-window-display-mode
        sdl-window-flags
        ;; TODO: sdl-window-gamma-ramp
        sdl-window-grab
        sdl-window-id
        sdl-window-maximum-size
        sdl-window-minimum-size
        sdl-window-pixel-format
        sdl-window-position
        sdl-window-size
        sdl-window-surface
        sdl-window-title
        ;; TODO: sdl-window-wm-info

        sdl-window-brightness-set!
        ;; TODO: sdl-window-data-set!
        sdl-window-display-mode-set!
        sdl-window-fullscreen-set!
        ;; TODO: sdl-window-gamma-ramp-set!
        sdl-window-grab-set!
        sdl-window-icon-set!
        sdl-window-maximum-size-set!
        sdl-window-minimum-size-set!
        sdl-window-position-set!
        sdl-window-size-set!
        sdl-window-title-set!)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; CREATE / DESTROY WINDOW

(define (%window-pos->int p)
  (if (number? p)
      (inexact->exact (round p))
      (%keyword->sdl-window-pos p default: 0)))

(define (sdl-create-window title x y w h . flags)
  (SDL_CreateWindow
   title
   (%window-pos->int x) (%window-pos->int y)
   w h
   (apply bitwise-ior
     (map (lambda (flag)
            (%keyword->sdl-window-flag flag default: 0))
          flags))))

(define (sdl-get-window-from-id id)
  (SDL_GetWindowFromID id))

(define (sdl-destroy-window window)
  (SDL_DestroyWindow window))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; UPDATE WINDOW SURFACE

(define (sdl-update-window-surface window)
  (= 0 (SDL_UpdateWindowSurface window)))

(define (%make-rects-vector rects)
  (let* ((rect-parts 4)
        (result (make-s32vector (* (length rects) rect-parts))))
    (for-each
     (lambda (i)
       (let ((rect-data (%sdl-rect-data (list-ref rects i))))
         (for-each
          (lambda (j)
            (s32vector-set!
             result (+ j (* i rect-parts))
             (s32vector-ref rect-data j)))
          (iota rect-parts))))
     (iota (length rects)))
    result))

(define (sdl-update-window-surface-rects window . rects)
  (assert (every sdl-rect? rects))
  (= 0 (SDL_UpdateWindowSurfaceRects
        window (make-locative (%make-rects-vector rects)) (length rects))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; WINDOW MANAGEMENT

(define (sdl-show-window window)
  (SDL_ShowWindow window))

(define (sdl-hide-window window)
  (SDL_HideWindow window))

(define (sdl-maximize-window window)
  (SDL_MaximizeWindow window))

(define (sdl-minimize-window window)
  (SDL_MinimizeWindow window))

(define (sdl-raise-window window)
  (SDL_RaiseWindow window))

(define (sdl-restore-window window)
  (SDL_RestoreWindow window))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; GET WINDOW PROPERTIES

(define (sdl-window-brightness window)
  (SDL_GetWindowBrightness window))

;; TODO: sdl-window-data

(define (sdl-window-display-index window)
  (SDL_GetWindowDisplayIndex window))

;; TODO: sdl-window-display-mode

(define (sdl-window-flags window)
  (let ((result (SDL_GetWindowFlags window)))
    (map %sdl-window-flag->keyword
         (masks->list result
                      (list SDL_WINDOW_FULLSCREEN
                            SDL_WINDOW_FULLSCREEN_DESKTOP
                            SDL_WINDOW_OPENGL
                            SDL_WINDOW_SHOWN
                            SDL_WINDOW_BORDERLESS
                            SDL_WINDOW_RESIZABLE
                            SDL_WINDOW_MINIMIZED
                            SDL_WINDOW_MAXIMIZED
                            SDL_WINDOW_INPUT_GRABBED
                            SDL_WINDOW_INPUT_FOCUS
                            SDL_WINDOW_MOUSE_FOCUS
                            SDL_WINDOW_FOREIGN)))))

;; TODO: sdl-window-gamma-ramp

(define (sdl-window-grab window)
  (SDL_GetWindowGrab window))

(define (sdl-window-id window)
  (SDL_GetWindowID window))

(define (sdl-window-maximum-size window)
  (let ((w-out (allocate (foreign-type-size "int")))
        (h-out (allocate (foreign-type-size "int"))))
    (SDL_GetWindowMaximumSize window w-out h-out)
    (list (pointer-s32-ref w-out)
          (pointer-s32-ref h-out))))

(define (sdl-window-minimum-size window)
  (let ((w-out (allocate (foreign-type-size "int")))
        (h-out (allocate (foreign-type-size "int"))))
    (SDL_GetWindowMinimumSize window w-out h-out)
    (list (pointer-s32-ref w-out)
          (pointer-s32-ref h-out))))

(define (sdl-window-pixel-format window)
  (SDL_GetWindowPixelFormat window))

(define (sdl-window-position window)
  (let ((x-out (allocate (foreign-type-size "int")))
        (y-out (allocate (foreign-type-size "int"))))
    (SDL_GetWindowPosition window x-out y-out)
    (list (pointer-s32-ref x-out)
          (pointer-s32-ref y-out))))

(define (sdl-window-size window)
  (let ((w-out (allocate (foreign-type-size "int")))
        (h-out (allocate (foreign-type-size "int"))))
    (SDL_GetWindowSize window w-out h-out)
    (list (pointer-s32-ref w-out)
          (pointer-s32-ref h-out))))

(define (sdl-window-surface window)
  (SDL_GetWindowSurface window))

(define (sdl-window-title window)
  (SDL_GetWindowTitle window))

;; TODO: sdl-window-wm-info


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; SET WINDOW PROPERTIES

(define (sdl-window-brightness-set! window brightness)
  (SDL_SetWindowBrightness window brightness))

(set! sdl-window-brightness
      (getter-with-setter sdl-window-brightness
                          sdl-window-brightness-set!))


;; TODO: sdl-window-data-set!


(define (sdl-window-display-mode-set! window mode)
  (SDL_SetWindowDisplayMode window mode))

;; (set! sdl-window-display-mode
;;       (getter-with-setter sdl-window-display-mode
;;                           sdl-window-display-mode-set!))


(define (sdl-window-fullscreen-set! window mode)
  (SDL_SetWindowFullscreen
   window
   (case mode
     ((#t #:fullscreen) SDL_WINDOW_FULLSCREEN)
     ((#:fullscreen-desktop) SDL_WINDOW_FULLSCREEN_DESKTOP)
     ((#f) 0)
     (else mode))))


;; TODO: sdl-window-gamma-ramp-set!


(define (sdl-window-grab-set! window grab?)
  (SDL_SetWindowGrab window grab?))

(set! sdl-window-grab
      (getter-with-setter sdl-window-grab
                          sdl-window-grab-set!))


(define (sdl-window-icon-set! window icon)
  (SDL_SetWindowIcon window icon))


(define (sdl-window-maximum-size-set! window size)
  (SDL_SetWindowMaximumSize window (car size) (cadr size)))

(set! sdl-window-maximum-size
      (getter-with-setter sdl-window-maximum-size
                          sdl-window-maximum-size-set!))


(define (sdl-window-minimum-size-set! window size)
  (SDL_SetWindowMinimumSize window (car size) (cadr size)))

(set! sdl-window-minimum-size
      (getter-with-setter sdl-window-minimum-size
                          sdl-window-minimum-size-set!))


(define (sdl-window-position-set! window pos)
  (SDL_SetWindowPosition
   window
   (%window-pos->int (car pos)) (%window-pos->int (cadr pos))))

(set! sdl-window-position
      (getter-with-setter sdl-window-position
                          sdl-window-position-set!))


(define (sdl-window-size-set! window size)
  (SDL_SetWindowSize window (car size) (cadr size)))

(set! sdl-window-size
      (getter-with-setter sdl-window-size
                          sdl-window-size-set!))


(define (sdl-window-title-set! window title)
  (SDL_SetWindowTitle window title))

(set! sdl-window-title
      (getter-with-setter sdl-window-title
                          sdl-window-title-set!))
