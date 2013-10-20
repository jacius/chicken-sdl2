
(export sdl-keysym?
        %wrap-sdl-keysym
        %sdl-keysym-pointer
        %sdl-keysym-pointer-set!)

(define-record-type sdl-keysym
  (%wrap-sdl-keysym pointer)
  sdl-keysym?
  (pointer %sdl-keysym-pointer %sdl-keysym-pointer-set!))
