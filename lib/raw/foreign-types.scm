
(define-foreign-type unsigned-integer8 unsigned-byte)
(define-foreign-type unsigned-integer16 unsigned-short)


(define-foreign-type SDL_Color*
  (c-pointer "SDL_Color")
  %sdl-color-pointer %wrap-sdl-color)

(define-foreign-type SDL_DisplayMode*
  (c-pointer "SDL_DisplayMode")
  %sdl-display-mode-pointer %wrap-sdl-display-mode)

;;; NOTE: "SDL_GLContext" is a typedef alias of "void *" so properly
;;; this should be SDL_GLContext (no *), but I'm adding the * for
;;; semantic consistency. It is a pointer, after all.
(define-foreign-type SDL_GLContext*
  (c-pointer void)
  %sdl-gl-context-pointer %wrap-sdl-gl-context)

(define-foreign-type SDL_Palette*
  (c-pointer "SDL_Palette")
  %sdl-palette-pointer %wrap-sdl-palette)

(define-foreign-type SDL_PixelFormat*
  (c-pointer "SDL_PixelFormat")
  %sdl-pixel-format-pointer %wrap-sdl-pixel-format)

(define-foreign-type SDL_Rect*
  (c-pointer "SDL_Rect")
  %sdl-rect-pointer %wrap-sdl-rect)

(define-foreign-type SDL_Surface*
  (c-pointer "SDL_Surface")
  %sdl-surface-pointer %wrap-sdl-surface)

(define-foreign-type SDL_SysWMinfo*
  (c-pointer "SDL_SysWMinfo")
  %sdl-sys-wm-info-pointer %wrap-sdl-sys-wm-info)

(define-foreign-type SDL_Texture*
  (c-pointer "SDL_Texture")
  %sdl-texture-pointer %wrap-sdl-texture)

(define-foreign-type SDL_version*
  (c-pointer "SDL_version")
  %sdl-version-pointer %wrap-sdl-version)

(define-foreign-type SDL_Window*
  (c-pointer "SDL_Window")
  %sdl-window-pointer %wrap-sdl-window)
