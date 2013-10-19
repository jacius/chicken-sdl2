
(export sdl-pixel-format?
        %wrap-sdl-pixel-format
        %sdl-pixel-format-pointer
        %sdl-pixel-format-pointer-set!)

(define-record-type sdl-pixel-format
  (%wrap-sdl-pixel-format pointer)
  sdl-pixel-format?
  (pointer %sdl-pixel-format-pointer %sdl-pixel-format-pointer-set!))
