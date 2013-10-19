
(export sdl-window?
        %wrap-sdl-window
        %sdl-window-pointer
        %sdl-window-pointer-set!)

(define-record-type sdl-window
  (%wrap-sdl-window pointer)
  sdl-window?
  (pointer %sdl-window-pointer %sdl-window-pointer-set!))
