
(module sdl2-record-types

(sdl-display-mode?
 %wrap-sdl-display-mode
 %sdl-display-mode-pointer
 %sdl-display-mode-pointer-set!

 sdl-gl-context?
 %wrap-sdl-gl-context
 %sdl-gl-context-pointer
 %sdl-gl-context-pointer-set!

 sdl-pixel-format?
 %wrap-sdl-pixel-format
 %sdl-pixel-format-pointer
 %sdl-pixel-format-pointer-set!

 sdl-rect?
 %wrap-sdl-rect
 %sdl-rect-buffer
 %sdl-rect-buffer-set!

 sdl-surface?
 %wrap-sdl-surface
 %sdl-surface-pointer
 %sdl-surface-pointer-set!

 sdl-sys-wm-info?
 %wrap-sdl-sys-wm-info
 %sdl-sys-wm-info-pointer
 %sdl-sys-wm-info-pointer-set!

 sdl-texture?
 %wrap-sdl-texture
 %sdl-texture-pointer
 %sdl-texture-pointer-set!

 sdl-version?
 %wrap-sdl-version
 %sdl-version-pointer
 %sdl-version-pointer-set!

 sdl-window?
 %wrap-sdl-window
 %sdl-window-pointer
 %sdl-window-pointer-set!)

(import scheme chicken)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; DISPLAY MODE

(define-record-type sdl-display-mode
  (%wrap-sdl-display-mode pointer)
  sdl-display-mode?
  (pointer %sdl-display-mode-pointer %sdl-display-mode-pointer-set!))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; GL-CONTEXT

(define-record-type sdl-gl-context
  (%wrap-sdl-gl-context pointer)
  sdl-gl-context?
  (pointer %sdl-gl-context-pointer %sdl-gl-context-pointer-set!))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; PIXEL FORMAT

(define-record-type sdl-pixel-format
  (%wrap-sdl-pixel-format pointer)
  sdl-pixel-format?
  (pointer %sdl-pixel-format-pointer %sdl-pixel-format-pointer-set!))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; RECT

(define-record-type sdl-rect
  (%wrap-sdl-rect buffer)
  sdl-rect?
  (buffer %sdl-rect-buffer %sdl-rect-buffer-set!))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; SYS WM INFO

(define-record-type sdl-sys-wm-info
  (%wrap-sdl-sys-wm-info pointer)
  sdl-sys-wm-info?
  (pointer %sdl-sys-wm-info-pointer %sdl-sys-wm-info-pointer-set!))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; SURFACE

(define-record-type sdl-surface
  (%wrap-sdl-surface pointer)
  sdl-surface?
  (pointer %sdl-surface-pointer %sdl-surface-pointer-set!))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; TEXTURE

(define-record-type sdl-texture
  (%wrap-sdl-texture pointer)
  sdl-texture?
  (pointer %sdl-texture-pointer %sdl-texture-pointer-set!))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; VERSION

(define-record-type sdl-version
  (%wrap-sdl-version pointer)
  sdl-version?
  (pointer %sdl-version-pointer %sdl-version-pointer-set!))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; WINDOW

(define-record-type sdl-window
  (%wrap-sdl-window pointer)
  sdl-window?
  (pointer %sdl-window-pointer %sdl-window-pointer-set!))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
) ; module sdl2-record-types
