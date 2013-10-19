
(export sdl-display-mode-format
        sdl-display-mode-w
        sdl-display-mode-h
        sdl-display-mode-refresh-rate
        %sdl-display-mode-driverdata)

(define-foreign-struct SDL_DisplayMode*
  (unsigned-int32 format sdl-display-mode-format)
  (int w sdl-display-mode-w)
  (int h sdl-display-mode-h)
  (int refresh_rate sdl-display-mode-refresh-rate)
  (c-pointer driverdata %sdl-display-mode-driverdata))
