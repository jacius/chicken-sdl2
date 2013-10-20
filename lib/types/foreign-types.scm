
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; GENERIC

(define-foreign-type unsigned-int8 unsigned-byte)
(define-foreign-type unsigned-int16 unsigned-short)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ENUMS

(define-foreign-type SDL_EventType int)
(define-foreign-type SDL_eventaction int)
(define-foreign-type SDL_GLattr int)
(define-foreign-type SDL_GLprofile int)
(define-foreign-type SDL_GLcontextFlag int)
(define-foreign-type SDL_Keycode int)
(define-foreign-type SDL_Keymod int)
(define-foreign-type SDL_MouseButton int)
(define-foreign-type SDL_MouseButtonMask int)
(define-foreign-type SDL_SystemCursor int)
(define-foreign-type SDL_Scancode int)
(define-foreign-type SDL_WindowFlags int)
(define-foreign-type SDL_WindowEventID int)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; STRUCTS

(define-foreign-type SDL_Color*
  (c-pointer "SDL_Color")
  %sdl-color->SDL_Color*
  %SDL_Color*->sdl-color)

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
  %sdl-rect->SDL_Rect*
  %SDL_Rect*->sdl-rect)

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
  %sdl-version->SDL_version*
  %SDL_version*->sdl-version)

(define-foreign-type SDL_Window*
  (c-pointer "SDL_Window")
  %sdl-window-pointer %wrap-sdl-window)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; EVENTS

(define-foreign-type SDL_Event*
  (c-pointer "SDL_Event"))

;; (define-foreign-type SDL_DollarGestureEvent*
;;   (c-pointer "SDL_DollarGestureEvent"))

(define-foreign-type SDL_DropEvent*
  (c-pointer "SDL_DropEvent"))

(define-foreign-type SDL_JoyAxisEvent*
  (c-pointer "SDL_JoyAxisEvent"))

(define-foreign-type SDL_JoyBallEvent*
  (c-pointer "SDL_JoyBallEvent"))

(define-foreign-type SDL_JoyButtonEvent*
  (c-pointer "SDL_JoyButtonEvent"))

(define-foreign-type SDL_JoyHatEvent*
  (c-pointer "SDL_JoyHatEvent"))

(define-foreign-type SDL_KeyboardEvent*
  (c-pointer "SDL_KeyboardEvent"))

(define-foreign-type SDL_MouseButtonEvent*
  (c-pointer "SDL_MouseButtonEvent"))

(define-foreign-type SDL_MouseMotionEvent*
  (c-pointer "SDL_MouseMotionEvent"))

(define-foreign-type SDL_MouseWheelEvent*
  (c-pointer "SDL_MouseWheelEvent"))

;; (define-foreign-type SDL_MultiGestureEvent*
;;   (c-pointer "SDL_MultiGestureEvent"))

(define-foreign-type SDL_QuitEvent*
  (c-pointer "SDL_QuitEvent"))

(define-foreign-type SDL_SysWMEvent*
  (c-pointer "SDL_SysWMEvent"))

(define-foreign-type SDL_TextEditingEvent*
  (c-pointer "SDL_TextEditingEvent"))

(define-foreign-type SDL_TextInputEvent*
  (c-pointer "SDL_TextInputEvent"))

;; (define-foreign-type SDL_TouchFingerEvent*
;;   (c-pointer "SDL_TouchFingerEvent"))

(define-foreign-type SDL_UserEvent*
  (c-pointer "SDL_UserEvent"))

(define-foreign-type SDL_WindowEvent*
  (c-pointer "SDL_WindowEvent"))

;;; EVENT-RELATED TYPES

(define-foreign-type SDL_EventFilter
  (function int (c-pointer SDL_Event*)))

(define-foreign-type SDL_EventFilter*
  (c-pointer (function int (c-pointer SDL_Event*))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
