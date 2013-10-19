
(export sdl-gl-context?
        %wrap-sdl-gl-context
        %sdl-gl-context-pointer
        %sdl-gl-context-pointer-set!)

(define-record-type sdl-gl-context
  (%wrap-sdl-gl-context pointer)
  sdl-gl-context?
  (pointer %sdl-gl-context-pointer %sdl-gl-context-pointer-set!))
