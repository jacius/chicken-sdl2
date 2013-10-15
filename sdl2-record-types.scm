
;;; NOTE: The ordering of things is a bit odd in this file because we
;;; have to declare the record types so that we can (un)wrap pointers,
;;; then we include lib/raw/foreign-types.scm to get the foreign type
;;; definitions (which depend on the wrappers), then we define struct
;;; field pseudo-accessors (which depend on the foreign type
;;; definitions).


(module sdl2-record-types

(;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 make-sdl-color
 sdl-color?
 %wrap-sdl-color
 %sdl-color-pointer
 %sdl-color-pointer-set!
 sdl-color-r sdl-color-r-set!
 sdl-color-g sdl-color-g-set!
 sdl-color-b sdl-color-b-set!
 sdl-color-a sdl-color-a-set!
 ;; TODO: sdl-color-set!
 make-sdl-colour
 sdl-colour?
 sdl-colour-r sdl-colour-r-set!
 sdl-colour-g sdl-colour-g-set!
 sdl-colour-b sdl-colour-b-set!
 sdl-colour-a sdl-colour-a-set!
 ;; TODO: sdl-colour-set!

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 sdl-display-mode?
 %wrap-sdl-display-mode
 %sdl-display-mode-pointer
 %sdl-display-mode-pointer-set!
 sdl-display-mode-format
 sdl-display-mode-w
 sdl-display-mode-h
 sdl-display-mode-refresh-rate
 %sdl-display-mode-driverdata

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 sdl-gl-context?
 %wrap-sdl-gl-context
 %sdl-gl-context-pointer
 %sdl-gl-context-pointer-set!

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;; TODO: make-sdl-palette
 sdl-palette?
 %wrap-sdl-palette
 %sdl-palette-pointer
 %sdl-palette-pointer-set!
 %sdl-palette-ncolors %sdl-palette-ncolors-set!
 %sdl-palette-colors %sdl-palette-colors-set!
 sdl-palette-version
 sdl-palette-refcount
 ;; TODO: sdl-palette-colors sdl-palette-colors-set!
 ;; TODO: sdl-palette-ref    sdl-palette-ref-set!

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 sdl-pixel-format?
 %wrap-sdl-pixel-format
 %sdl-pixel-format-pointer
 %sdl-pixel-format-pointer-set!
 sdl-pixel-format-format
 sdl-pixel-format-palette
 sdl-pixel-format-bits-per-pixel
 sdl-pixel-format-bytes-per-pixel
 sdl-pixel-format-padding
 sdl-pixel-format-rmask
 sdl-pixel-format-gmask
 sdl-pixel-format-bmask
 sdl-pixel-format-amask
 sdl-pixel-format-rloss
 sdl-pixel-format-gloss
 sdl-pixel-format-bloss
 sdl-pixel-format-aloss
 sdl-pixel-format-rshift
 sdl-pixel-format-gshift
 sdl-pixel-format-bshift
 sdl-pixel-format-ashift
 sdl-pixel-format-refcount
 sdl-pixel-format-next

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 make-sdl-rect
 sdl-rect?
 %wrap-sdl-rect
 %sdl-rect-pointer
 %sdl-rect-pointer-set!
 sdl-rect-x sdl-rect-x-set!
 sdl-rect-y sdl-rect-y-set!
 sdl-rect-w sdl-rect-w-set!
 sdl-rect-h sdl-rect-h-set!

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 sdl-surface?
 %wrap-sdl-surface
 %sdl-surface-pointer
 %sdl-surface-pointer-set!
 sdl-surface-flags
 sdl-surface-format
 sdl-surface-w
 sdl-surface-h
 sdl-surface-pitch
 %sdl-surface-pixels    %sdl-surface-pixels-set!
 %sdl-surface-userdata  %sdl-surface-userdata-set!
 sdl-surface-locked
 %sdl-surface-lock-data

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 sdl-sys-wm-info?
 %wrap-sdl-sys-wm-info
 %sdl-sys-wm-info-pointer
 %sdl-sys-wm-info-pointer-set!

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 sdl-texture?
 %wrap-sdl-texture
 %sdl-texture-pointer
 %sdl-texture-pointer-set!

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 make-sdl-version
 sdl-version?
 %wrap-sdl-version
 %sdl-version-pointer
 %sdl-version-pointer-set!
 sdl-version-major
 sdl-version-minor
 sdl-version-patch

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 sdl-window?
 %wrap-sdl-window
 %sdl-window-pointer
 %sdl-window-pointer-set!)


(import scheme chicken foreign)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;; COLOR

(define-record-type sdl-color
  (%wrap-sdl-color pointer)
  sdl-color?
  (pointer %sdl-color-pointer %sdl-color-pointer-set!))

;;; DISPLAY-MODE

(define-record-type sdl-display-mode
  (%wrap-sdl-display-mode pointer)
  sdl-display-mode?
  (pointer %sdl-display-mode-pointer %sdl-display-mode-pointer-set!))

;;; GL-CONTEXT

(define-record-type sdl-gl-context
  (%wrap-sdl-gl-context pointer)
  sdl-gl-context?
  (pointer %sdl-gl-context-pointer %sdl-gl-context-pointer-set!))

;;; PALETTE

(define-record-type sdl-palette
  (%wrap-sdl-palette pointer)
  sdl-palette?
  (pointer %sdl-palette-pointer %sdl-palette-pointer-set!))

;;; PIXEL-FORMAT

(define-record-type sdl-pixel-format
  (%wrap-sdl-pixel-format pointer)
  sdl-pixel-format?
  (pointer %sdl-pixel-format-pointer %sdl-pixel-format-pointer-set!))

;;; RECT

(define-record-type sdl-rect
  (%wrap-sdl-rect pointer)
  sdl-rect?
  (pointer %sdl-rect-pointer %sdl-rect-pointer-set!))

;;; SYS-WM-INFO

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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; COLOR

(define make-sdl-color
  (foreign-lambda*
   SDL_Color* ((unsigned-integer8 r) (unsigned-integer8 g)
               (unsigned-integer8 b) (unsigned-integer8 a))
   "SDL_Color c = {r, g, b, a}; C_return(&c);"))

(define-foreign-struct SDL_Color*
  (unsigned-integer8 r sdl-color-r sdl-color-r-set!)
  (unsigned-integer8 g sdl-color-g sdl-color-g-set!)
  (unsigned-integer8 b sdl-color-b sdl-color-b-set!)
  (unsigned-integer8 a sdl-color-a sdl-color-a-set!))

;; TODO: sdl-color-set! to set multiple channels (keyword args).

(define make-sdl-colour   make-sdl-color)
(define sdl-colour?       sdl-color?)
(define sdl-colour-r      sdl-color-r)
(define sdl-colour-g      sdl-color-g)
(define sdl-colour-b      sdl-color-b)
(define sdl-colour-a      sdl-color-a)
(define sdl-colour-r-set! sdl-color-r-set!)
(define sdl-colour-g-set! sdl-color-g-set!)
(define sdl-colour-b-set! sdl-color-b-set!)
(define sdl-colour-a-set! sdl-color-a-set!)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; DISPLAY-MODE

(define-foreign-struct SDL_DisplayMode*
  (unsigned-integer32 format sdl-display-mode-format)
  (integer w sdl-display-mode-w)
  (integer h sdl-display-mode-h)
  (integer refresh_rate sdl-display-mode-refresh-rate)
  (c-pointer driverdata %sdl-display-mode-driverdata))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; GL-CONTEXT
;;; is an opaque pointer, so there's nothing else to define here.


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; PALETTE

;;; TODO: make-sdl-palette that takes a vector of sdl-color instances.

(define-foreign-struct SDL_Palette*
  (integer ncolors %sdl-palette-ncolors %sdl-palette-ncolors-set!)
  (SDL_Color* colors %sdl-palette-colors %sdl-palette-colors-set!)
  (unsigned-integer32 version sdl-palette-version)
  (integer refcount sdl-palette-refcount))

;;; TODO: sdl-palette-colors and sdl-palette-colors-set! that
;;; return/take a vector of sdl-color instances.

;;; TODO: sdl-palette-ref and sdl-palette-ref-set! that access
;;; individual colors.


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; PIXEL-FORMAT

(define-foreign-struct SDL_PixelFormat*
  (unsigned-integer32 format sdl-pixel-format-format)
  (SDL_Palette* palette sdl-pixel-format-palette)
  (unsigned-integer8 BitsPerPixel sdl-pixel-format-bits-per-pixel)
  (unsigned-integer8 BytesPerPixel sdl-pixel-format-bytes-per-pixel)
  ;(unsigned-integer8 padding[2])
  (unsigned-integer32 Rmask sdl-pixel-format-rmask)
  (unsigned-integer32 Gmask sdl-pixel-format-gmask)
  (unsigned-integer32 Bmask sdl-pixel-format-bmask)
  (unsigned-integer32 Amask sdl-pixel-format-amask)
  (unsigned-integer8 Rloss  sdl-pixel-format-rloss)
  (unsigned-integer8 Gloss  sdl-pixel-format-gloss)
  (unsigned-integer8 Bloss  sdl-pixel-format-bloss)
  (unsigned-integer8 Aloss  sdl-pixel-format-aloss)
  (unsigned-integer8 Rshift sdl-pixel-format-rshift)
  (unsigned-integer8 Gshift sdl-pixel-format-gshift)
  (unsigned-integer8 Bshift sdl-pixel-format-bshift)
  (unsigned-integer8 Ashift sdl-pixel-format-ashift)
  (integer refcount sdl-pixel-format-refcount)
  (SDL_PixelFormat* next sdl-pixel-format-next))

(define sdl-pixel-format-padding
  (let ((get-padding
         (foreign-lambda*
          unsigned-integer8 ((SDL_PixelFormat* pf) (unsigned-byte i))
          "C_return(pf->padding[i]);")))
    (lambda (pixel-format)
      (list (get-padding pixel-format 0) (get-padding pixel-format 1)))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
;;; SURFACE

(define-foreign-struct SDL_Surface*
  (unsigned-integer32 flags sdl-surface-flags)  ; read-only
  (SDL_PixelFormat* format sdl-surface-format)  ; read-only
  (integer w sdl-surface-w)                     ; read-only
  (integer h sdl-surface-h)                     ; read-only
  (integer pitch sdl-surface-pitch)             ; read-only
  (c-pointer pixels %sdl-surface-pixels         ; read-write
             %sdl-surface-pixels-set!)
  (c-pointer userdata %sdl-surface-userdata     ; read-write
             %sdl-surface-userdata-set!)
  (integer locked sdl-surface-locked)           ; read-only
  (c-pointer lock_data %sdl-surface-lock-data)) ; read-only

;;; TODO: nice accessors for pixels and userdata?


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; SYS-WM-INFO
;;; is weird and I don't feel like dealing with it.


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; TEXTURE
;;; is an opaque pointer, so there's nothing else to define here.


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; VERSION

(define make-sdl-version
  (foreign-lambda*
   SDL_version* ((unsigned-integer8 major)
                 (unsigned-integer8 minor)
                 (unsigned-integer8 patch))
   "SDL_version v = {major, minor, patch}; C_return(&v);"))

(define-foreign-struct SDL_version*
  (unsigned-integer8 major sdl-version-major)
  (unsigned-integer8 minor sdl-version-minor)
  (unsigned-integer8 patch sdl-version-patch))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; WINDOW
;;; is an opaque pointer, so there's nothing else to define here.


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
) ; module sdl2-record-types
