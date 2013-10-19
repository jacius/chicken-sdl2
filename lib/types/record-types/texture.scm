
(export sdl-texture?
        %wrap-sdl-texture
        %sdl-texture-pointer
        %sdl-texture-pointer-set!)

(define-record-type sdl-texture
  (%wrap-sdl-texture pointer)
  sdl-texture?
  (pointer %sdl-texture-pointer %sdl-texture-pointer-set!))
