
(export ;; TODO: make-sdl-palette
        sdl-palette?
        %wrap-sdl-palette
        %sdl-palette-pointer
        %sdl-palette-pointer-set!)

(define-record-type sdl-palette
  (%wrap-sdl-palette pointer)
  sdl-palette?
  (pointer %sdl-palette-pointer %sdl-palette-pointer-set!))
