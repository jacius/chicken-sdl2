;;
;; chicken-sdl2: Chicken bindings to SDL 2 (Simple DirectMedia Layer 2)
;;
;; Copyright © 2013  John Croisant.
;; All rights reserved.
;;
;; Redistribution and use in source and binary forms, with or without
;; modification, are permitted provided that the following conditions
;; are met:
;;
;; - Redistributions of source code must retain the above copyright
;;   notice, this list of conditions and the following disclaimer.
;;
;; - Redistributions in binary form must reproduce the above copyright
;;   notice, this list of conditions and the following disclaimer in
;;   the documentation and/or other materials provided with the
;;   distribution.
;;
;; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
;; "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
;; LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
;; FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
;; COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
;; INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
;; (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
;; SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
;; HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
;; STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
;; ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
;; OF THE POSSIBILITY OF SUCH DAMAGE.


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; GENERIC

(define-foreign-type int8 byte)
(define-foreign-type int16 short)
(define-foreign-type unsigned-int8 unsigned-byte)
(define-foreign-type unsigned-int16 unsigned-short)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ENUMS

(define-foreign-type SDL_BlendMode int)
(define-foreign-type SDL_EventType int)
(define-foreign-type SDL_eventaction int)
(define-foreign-type SDL_GLattr int)
(define-foreign-type SDL_GLprofile int)
(define-foreign-type SDL_GLcontextFlag int)
(define-foreign-type SDL_JoystickHatPosition int)
(define-foreign-type SDL_Keycode int)
(define-foreign-type SDL_Keymod int)
(define-foreign-type SDL_MouseButton int)
(define-foreign-type SDL_MouseButtonMask int)
(define-foreign-type SDL_SystemCursor int)
(define-foreign-type SDL_Scancode int)
(define-foreign-type SDL_WindowFlags int)
(define-foreign-type SDL_WindowEventID int)

(define-foreign-type SDL_PixelFormatEnum int)
(define-foreign-type SDL_PixelTypeEnum int)
(define-foreign-type SDL_BitmapOrderEnum int)
(define-foreign-type SDL_PackedOrderEnum int)
(define-foreign-type SDL_ArrayOrderEnum int)
(define-foreign-type SDL_PackedLayoutEnum int)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; MISC

(define-foreign-type SDL_JoystickID int32)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; STRUCTS

(define-foreign-type SDL_Color*
  (c-pointer "SDL_Color")
  %sdl-color->SDL_Color*
  %SDL_Color*->sdl-color)

(define-foreign-type SDL_Cursor*
  (c-pointer "SDL_Cursor")
  %sdl-cursor-pointer %wrap-sdl-cursor)

(define-foreign-type SDL_DisplayMode*
  (c-pointer "SDL_DisplayMode")
  %sdl-display-mode-pointer %wrap-sdl-display-mode)

;;; NOTE: "SDL_GLContext" is a typedef alias of "void *" so properly
;;; this should be SDL_GLContext (no *), but I'm adding the * for
;;; semantic consistency. It is a pointer, after all.
(define-foreign-type SDL_GLContext*
  (c-pointer void)
  %sdl-gl-context-pointer %wrap-sdl-gl-context)

(define-foreign-type SDL_Joystick*
  (c-pointer "SDL_Joystick")
  %sdl-joystick-pointer %wrap-sdl-joystick)

(define-foreign-type SDL_JoystickGUID*
  (c-pointer "SDL_JoystickGUID")
  %sdl-joystick-guid->SDL_JoystickGUID*
  %SDL_JoystickGUID*->sdl-joystick-guid)

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

(define-foreign-type SDL_Point*
  (c-pointer "SDL_Point")
  %sdl-point->SDL_Point*
  %SDL_Point*->sdl-point)

(define-foreign-type SDL_Surface*
  (c-pointer "SDL_Surface")
  %sdl-surface-pointer %wrap-sdl-surface)

(define-foreign-type SDL_SysWMinfo*
  (c-pointer "SDL_SysWMinfo")
  %sdl-sys-wm-info-pointer %wrap-sdl-sys-wm-info)

(define-foreign-type SDL_SysWMmsg*
  (c-pointer "SDL_SysWMmsg"))

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
  (c-pointer "SDL_Event")
  %sdl-event-pointer %wrap-sdl-event)


(define-foreign-type SDL_KeyboardEvent*
  (c-pointer "SDL_KeyboardEvent")
  %sdl-keyboard-event-pointer %wrap-sdl-keyboard-event)

(define-foreign-type SDL_TextEditingEvent*
  (c-pointer "SDL_TextEditingEvent")
  %sdl-text-editing-event-pointer %wrap-sdl-text-editing-event)

(define-foreign-type SDL_TextInputEvent*
  (c-pointer "SDL_TextInputEvent")
  %sdl-text-input-event-pointer %wrap-sdl-text-input-event)

(define-foreign-type SDL_MouseMotionEvent*
  (c-pointer "SDL_MouseMotionEvent")
  %sdl-mouse-motion-event-pointer %wrap-sdl-mouse-motion-event)

(define-foreign-type SDL_MouseButtonEvent*
  (c-pointer "SDL_MouseButtonEvent")
  %sdl-mouse-button-event-pointer %wrap-sdl-mouse-button-event)

(define-foreign-type SDL_MouseWheelEvent*
  (c-pointer "SDL_MouseWheelEvent")
  %sdl-mouse-wheel-event-pointer %wrap-sdl-mouse-wheel-event)

(define-foreign-type SDL_JoyAxisEvent*
  (c-pointer "SDL_JoyAxisEvent")
  %sdl-joy-axis-event-pointer %wrap-sdl-joy-axis-event)

(define-foreign-type SDL_JoyBallEvent*
  (c-pointer "SDL_JoyBallEvent")
  %sdl-joy-ball-event-pointer %wrap-sdl-joy-ball-event)

(define-foreign-type SDL_JoyButtonEvent*
  (c-pointer "SDL_JoyButtonEvent")
  %sdl-joy-button-event-pointer %wrap-sdl-joy-button-event)

(define-foreign-type SDL_JoyHatEvent*
  (c-pointer "SDL_JoyHatEvent")
  %sdl-joy-hat-event-pointer %wrap-sdl-joy-hat-event)

;; (define-foreign-type SDL_MultiGestureEvent*
;;   (c-pointer "SDL_MultiGestureEvent")
;;   %sdl-multi-gesture-event-pointer %wrap-sdl-multi-gesture-event)

;; (define-foreign-type SDL_DollarGestureEvent*
;;   (c-pointer "SDL_DollarGestureEvent")
;;   %sdl-dollar-gesture-event-pointer %wrap-sdl-dollar-gesture-event)

;; (define-foreign-type SDL_TouchFingerEvent*
;;   (c-pointer "SDL_TouchFingerEvent")
;;   %sdl-touch-finger-event-pointer %wrap-sdl-touch-finger-event)

(define-foreign-type SDL_WindowEvent*
  (c-pointer "SDL_WindowEvent")
  %sdl-window-event-pointer %wrap-sdl-window-event)

(define-foreign-type SDL_DropEvent*
  (c-pointer "SDL_DropEvent")
  %sdl-drop-event-pointer %wrap-sdl-drop-event)

(define-foreign-type SDL_QuitEvent*
  (c-pointer "SDL_QuitEvent")
  %sdl-quit-event-pointer %wrap-sdl-quit-event)

(define-foreign-type SDL_UserEvent*
  (c-pointer "SDL_UserEvent")
  %sdl-user-event-pointer %wrap-sdl-user-event)

(define-foreign-type SDL_SysWMEvent*
  (c-pointer "SDL_SysWMEvent")
  %sdl-sys-wm-event-pointer %wrap-sdl-sys-wm-event)

;;; EVENT-RELATED TYPES

(define-foreign-type SDL_JoystickID integer32)
;; (define-foreign-type SDL_TouchID integer32)
;; (define-foreign-type SDL_FingerID integer32)

(define-foreign-type SDL_EventFilter
  (function int (c-pointer SDL_Event*)))

(define-foreign-type SDL_EventFilter*
  (c-pointer (function int (c-pointer SDL_Event*))))

(define-foreign-type SDL_Keysym*
  (c-pointer "SDL_Keysym")
  %sdl-keysym-pointer %wrap-sdl-keysym)
