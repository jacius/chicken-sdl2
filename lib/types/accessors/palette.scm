
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
