
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; COLOR

(export sdl-color?
        %wrap-sdl-color
        %sdl-color-pointer
        %sdl-color-pointer-set!)

(define-record-type sdl-color
  (%wrap-sdl-color pointer)
  sdl-color?
  (pointer %sdl-color-pointer %sdl-color-pointer-set!))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; DISPLAY-MODE

(export sdl-display-mode?
        %wrap-sdl-display-mode
        %sdl-display-mode-pointer
        %sdl-display-mode-pointer-set!)

(define-record-type sdl-display-mode
  (%wrap-sdl-display-mode pointer)
  sdl-display-mode?
  (pointer %sdl-display-mode-pointer %sdl-display-mode-pointer-set!))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; GL-CONTEXT

(export sdl-gl-context?
        %wrap-sdl-gl-context
        %sdl-gl-context-pointer
        %sdl-gl-context-pointer-set!)

(define-record-type sdl-gl-context
  (%wrap-sdl-gl-context pointer)
  sdl-gl-context?
  (pointer %sdl-gl-context-pointer %sdl-gl-context-pointer-set!))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; PALETTE

(export ;; TODO: make-sdl-palette
        sdl-palette?
        %wrap-sdl-palette
        %sdl-palette-pointer
        %sdl-palette-pointer-set!)

(define-record-type sdl-palette
  (%wrap-sdl-palette pointer)
  sdl-palette?
  (pointer %sdl-palette-pointer %sdl-palette-pointer-set!))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; PIXEL-FORMAT

(export sdl-pixel-format?
        %wrap-sdl-pixel-format
        %sdl-pixel-format-pointer
        %sdl-pixel-format-pointer-set!)

(define-record-type sdl-pixel-format
  (%wrap-sdl-pixel-format pointer)
  sdl-pixel-format?
  (pointer %sdl-pixel-format-pointer %sdl-pixel-format-pointer-set!))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; RECT

(export sdl-rect?
        %wrap-sdl-rect
        %sdl-rect-pointer
        %sdl-rect-pointer-set!)

(define-record-type sdl-rect
  (%wrap-sdl-rect pointer)
  sdl-rect?
  (pointer %sdl-rect-pointer %sdl-rect-pointer-set!))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; SURFACE

(export sdl-surface?
        %wrap-sdl-surface
        %sdl-surface-pointer
        %sdl-surface-pointer-set!)

(define-record-type sdl-surface
  (%wrap-sdl-surface pointer)
  sdl-surface?
  (pointer %sdl-surface-pointer %sdl-surface-pointer-set!))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; SYS-WM-INFO

(export sdl-sys-wm-info?
        %wrap-sdl-sys-wm-info
        %sdl-sys-wm-info-pointer
        %sdl-sys-wm-info-pointer-set!)

(define-record-type sdl-sys-wm-info
  (%wrap-sdl-sys-wm-info pointer)
  sdl-sys-wm-info?
  (pointer %sdl-sys-wm-info-pointer %sdl-sys-wm-info-pointer-set!))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; TEXTURE

(export sdl-texture?
        %wrap-sdl-texture
        %sdl-texture-pointer
        %sdl-texture-pointer-set!)

(define-record-type sdl-texture
  (%wrap-sdl-texture pointer)
  sdl-texture?
  (pointer %sdl-texture-pointer %sdl-texture-pointer-set!))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; VERSION

(export sdl-version?
        %wrap-sdl-version
        %sdl-version-pointer
        %sdl-version-pointer-set!)

(define-record-type sdl-version
  (%wrap-sdl-version pointer)
  sdl-version?
  (pointer %sdl-version-pointer %sdl-version-pointer-set!))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; WINDOW

(export sdl-window?
        %wrap-sdl-window
        %sdl-window-pointer
        %sdl-window-pointer-set!)

(define-record-type sdl-window
  (%wrap-sdl-window pointer)
  sdl-window?
  (pointer %sdl-window-pointer %sdl-window-pointer-set!))
