
;;; NOTE: The ordering of things is a bit odd in this file because we
;;; have to declare the record types so that we can (un)wrap pointers,
;;; then we include lib/raw/foreign-types.scm to get the foreign type
;;; definitions (which depend on the wrappers), then we define struct
;;; field pseudo-accessors (which depend on the foreign type
;;; definitions).


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

 make-sdl-rect
 sdl-rect?
 %wrap-sdl-rect
 %sdl-rect-pointer
 %sdl-rect-pointer-set!
 sdl-rect-x sdl-rect-x-set!
 sdl-rect-y sdl-rect-y-set!
 sdl-rect-w sdl-rect-w-set!
 sdl-rect-h sdl-rect-h-set!

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

(import scheme chicken foreign)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; DISPLAY MODE

(define-record-type sdl-display-mode
  (%wrap-sdl-display-mode pointer)
  sdl-display-mode?
  (pointer %sdl-display-mode-pointer %sdl-display-mode-pointer-set!))

;;; GL-CONTEXT

(define-record-type sdl-gl-context
  (%wrap-sdl-gl-context pointer)
  sdl-gl-context?
  (pointer %sdl-gl-context-pointer %sdl-gl-context-pointer-set!))

;;; PIXEL FORMAT

(define-record-type sdl-pixel-format
  (%wrap-sdl-pixel-format pointer)
  sdl-pixel-format?
  (pointer %sdl-pixel-format-pointer %sdl-pixel-format-pointer-set!))

;;; RECT

(define-record-type sdl-rect
  (%wrap-sdl-rect pointer)
  sdl-rect?
  (pointer %sdl-rect-pointer %sdl-rect-pointer-set!))

;;; SYS WM INFO

(define-record-type sdl-sys-wm-info
  (%wrap-sdl-sys-wm-info pointer)
  sdl-sys-wm-info?
  (pointer %sdl-sys-wm-info-pointer %sdl-sys-wm-info-pointer-set!))

;;; SURFACE

(define-record-type sdl-surface
  (%wrap-sdl-surface pointer)
  sdl-surface?
  (pointer %sdl-surface-pointer %sdl-surface-pointer-set!))

;;; TEXTURE

(define-record-type sdl-texture
  (%wrap-sdl-texture pointer)
  sdl-texture?
  (pointer %sdl-texture-pointer %sdl-texture-pointer-set!))

;;; VERSION

(define-record-type sdl-version
  (%wrap-sdl-version pointer)
  sdl-version?
  (pointer %sdl-version-pointer %sdl-version-pointer-set!))

;;; WINDOW

(define-record-type sdl-window
  (%wrap-sdl-window pointer)
  sdl-window?
  (pointer %sdl-window-pointer %sdl-window-pointer-set!))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(foreign-declare "#include \"SDL.h\"")
(foreign-declare "#include \"SDL_syswm.h\"")

(include "lib/raw/foreign-types.scm")
(include "lib/raw/helpers.scm")


;;; RECT

(define make-sdl-rect
  (foreign-lambda*
   SDL_Rect* ((integer x) (integer y) (integer w) (integer h))
   "SDL_Rect r = {x, y, w, h}; C_return(&r);"))

(define-foreign-struct SDL_Rect*
  (integer x sdl-rect-x sdl-rect-x-set!)
  (integer y sdl-rect-y sdl-rect-y-set!)
  (integer w sdl-rect-w sdl-rect-w-set!)
  (integer h sdl-rect-h sdl-rect-h-set!))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
) ; module sdl2-record-types
