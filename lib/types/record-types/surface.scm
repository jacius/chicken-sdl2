
(export sdl-surface?
        %wrap-sdl-surface
        %sdl-surface-pointer
        %sdl-surface-pointer-set!)

(define-record-type sdl-surface
  (%wrap-sdl-surface pointer)
  sdl-surface?
  (pointer %sdl-surface-pointer %sdl-surface-pointer-set!))
