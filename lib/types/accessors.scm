
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; COLOR

(export make-sdl-color
        sdl-color-r sdl-color-r-set!
        sdl-color-g sdl-color-g-set!
        sdl-color-b sdl-color-b-set!
        sdl-color-a sdl-color-a-set!
        sdl-color-set!
        sdl-color->list
        make-sdl-colour
        sdl-colour?
        sdl-colour-r sdl-colour-r-set!
        sdl-colour-g sdl-colour-g-set!
        sdl-colour-b sdl-colour-b-set!
        sdl-colour-a sdl-colour-a-set!
        sdl-colour-set!)

(define-record-printer (sdl-color c out)
  (%displayify out "#<sdl-color " (sdl-color->list c) ">"))

(define (make-sdl-color r g b a)
  (assert (<= 0 r 255)) (assert (<= 0 g 255))
  (assert (<= 0 b 255)) (assert (<= 0 a 255))
  (%wrap-sdl-color (u8vector r g b a)))

(define-foreign-struct SDL_Color*
  (unsigned-int8 r sdl-color-r sdl-color-r-set!)
  (unsigned-int8 g sdl-color-g sdl-color-g-set!)
  (unsigned-int8 b sdl-color-b sdl-color-b-set!)
  (unsigned-int8 a sdl-color-a sdl-color-a-set!))

(define (sdl-color-set! c #!key r g b a)
  (assert (sdl-color? c))
  (when r (assert (<= 0 r 255)) (sdl-color-r-set! c r))
  (when g (assert (<= 0 g 255)) (sdl-color-g-set! c g))
  (when b (assert (<= 0 b 255)) (sdl-color-b-set! c b))
  (when a (assert (<= 0 a 255)) (sdl-color-a-set! c a)))

(define (sdl-color->list c)
  (u8vector->list (%sdl-color-data c)))

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
(define sdl-colour-set!   sdl-color-set!)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; DISPLAY-MODE

(export sdl-display-mode-format
        sdl-display-mode-w
        sdl-display-mode-h
        sdl-display-mode-refresh-rate
        %sdl-display-mode-driverdata)

(define-foreign-struct SDL_DisplayMode*
  (unsigned-int32 format sdl-display-mode-format)
  (int w sdl-display-mode-w)
  (int h sdl-display-mode-h)
  (int refresh_rate sdl-display-mode-refresh-rate)
  (c-pointer driverdata %sdl-display-mode-driverdata))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; GL-CONTEXT
;;; is an opaque pointer, so there's nothing else to define here.


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; PALETTE

(export ;; TODO: make-sdl-pallete
        %sdl-palette-ncolors %sdl-palette-ncolors-set!
        %sdl-palette-colors %sdl-palette-colors-set!
        sdl-palette-version
        sdl-palette-refcount
        ;; TODO: sdl-palette-colors
        ;; TODO: sdl-palette-colors-set!
        ;; TODO: sdl-palette-ref
        ;; TODO: sdl-palette-ref-set!
        )

;;; TODO: make-sdl-palette that takes a vector of sdl-color instances.

(define-foreign-struct SDL_Palette*
  (int ncolors %sdl-palette-ncolors %sdl-palette-ncolors-set!)
  (c-pointer colors %sdl-palette-colors %sdl-palette-colors-set!)
  (unsigned-int32 version sdl-palette-version)
  (int refcount sdl-palette-refcount))

;;; TODO: sdl-palette-colors and sdl-palette-colors-set! that
;;; return/take a vector of sdl-color instances.

;;; TODO: sdl-palette-ref and sdl-palette-ref-set! that access
;;; individual colors.


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; PIXEL-FORMAT

(export sdl-pixel-format-format
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
        sdl-pixel-format-next)

(define-foreign-struct SDL_PixelFormat*
  (unsigned-int32 format sdl-pixel-format-format)
  (SDL_Palette* palette sdl-pixel-format-palette)
  (unsigned-int8 BitsPerPixel sdl-pixel-format-bits-per-pixel)
  (unsigned-int8 BytesPerPixel sdl-pixel-format-bytes-per-pixel)
  ;;(unsigned-int8 padding[2]) ; see below
  (unsigned-int32 Rmask sdl-pixel-format-rmask)
  (unsigned-int32 Gmask sdl-pixel-format-gmask)
  (unsigned-int32 Bmask sdl-pixel-format-bmask)
  (unsigned-int32 Amask sdl-pixel-format-amask)
  (unsigned-int8 Rloss  sdl-pixel-format-rloss)
  (unsigned-int8 Gloss  sdl-pixel-format-gloss)
  (unsigned-int8 Bloss  sdl-pixel-format-bloss)
  (unsigned-int8 Aloss  sdl-pixel-format-aloss)
  (unsigned-int8 Rshift sdl-pixel-format-rshift)
  (unsigned-int8 Gshift sdl-pixel-format-gshift)
  (unsigned-int8 Bshift sdl-pixel-format-bshift)
  (unsigned-int8 Ashift sdl-pixel-format-ashift)
  (int refcount sdl-pixel-format-refcount)
  (SDL_PixelFormat* next sdl-pixel-format-next))

(define sdl-pixel-format-padding
  (let ((get-padding
         (foreign-lambda*
          unsigned-int8 ((SDL_PixelFormat* pf) (unsigned-byte i))
          "C_return(pf->padding[i]);")))
    (lambda (pixel-format)
      (list (get-padding pixel-format 0) (get-padding pixel-format 1)))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; RECT

(export make-sdl-rect
        sdl-rect-x sdl-rect-x-set!
        sdl-rect-y sdl-rect-y-set!
        sdl-rect-w sdl-rect-w-set!
        sdl-rect-h sdl-rect-h-set!)

(define make-sdl-rect
  (foreign-lambda*
   SDL_Rect* ((int x) (int y) (int w) (int h))
   "SDL_Rect r = {x, y, w, h}; C_return(&r);"))

(define-foreign-struct SDL_Rect*
  (int x sdl-rect-x sdl-rect-x-set!)
  (int y sdl-rect-y sdl-rect-y-set!)
  (int w sdl-rect-w sdl-rect-w-set!)
  (int h sdl-rect-h sdl-rect-h-set!))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; SURFACE

(export sdl-surface-flags
        sdl-surface-format
        sdl-surface-w
        sdl-surface-h
        sdl-surface-pitch
        %sdl-surface-pixels    %sdl-surface-pixels-set!
        %sdl-surface-userdata  %sdl-surface-userdata-set!
        sdl-surface-locked
        %sdl-surface-lock-data)

(define-foreign-struct SDL_Surface*
  (unsigned-int32 flags sdl-surface-flags)  ; read-only
  (SDL_PixelFormat* format sdl-surface-format)  ; read-only
  (int w sdl-surface-w)                     ; read-only
  (int h sdl-surface-h)                     ; read-only
  (int pitch sdl-surface-pitch)             ; read-only
  (c-pointer pixels %sdl-surface-pixels         ; read-write
             %sdl-surface-pixels-set!)
  (c-pointer userdata %sdl-surface-userdata     ; read-write
             %sdl-surface-userdata-set!)
  (int locked sdl-surface-locked)           ; read-only
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

(export make-sdl-version
        sdl-version-major
        sdl-version-minor
        sdl-version-patch)

(define make-sdl-version
  (foreign-lambda*
   SDL_version* ((unsigned-int8 major)
                 (unsigned-int8 minor)
                 (unsigned-int8 patch))
   "SDL_version v = {major, minor, patch}; C_return(&v);"))

(define-foreign-struct SDL_version*
  (unsigned-int8 major sdl-version-major)
  (unsigned-int8 minor sdl-version-minor)
  (unsigned-int8 patch sdl-version-patch))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; WINDOW
;;; is an opaque pointer, so there's nothing else to define here.

