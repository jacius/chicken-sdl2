
(export sdl-display-mode?
        %wrap-sdl-display-mode
        %sdl-display-mode-pointer
        %sdl-display-mode-pointer-set!)

(define-record-type sdl-display-mode
  (%wrap-sdl-display-mode pointer)
  sdl-display-mode?
  (pointer %sdl-display-mode-pointer %sdl-display-mode-pointer-set!))
