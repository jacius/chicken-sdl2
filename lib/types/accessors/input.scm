
(export sdl-keysym-scancode
        sdl-keysym-sym
        sdl-keysym-mod)

(define-foreign-struct SDL_Keysym*
  (SDL_Scancode scancode sdl-keysym-scancode)
  (SDL_Keycode sym sdl-keysym-sym)
  (unsigned-int16 mod sdl-keysym-mod))
