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

(define-foreign-type int*    (c-pointer int))

(define-foreign-type Sint8   byte)
(define-foreign-type Sint16  short)
(define-foreign-type Sint32  integer32)
(define-foreign-type Sint64  integer64)

(define-foreign-type Sint8*  (c-pointer Sint8))
(define-foreign-type Sint16* (c-pointer Sint16))
(define-foreign-type Sint32* (c-pointer Sint32))
(define-foreign-type Sint32* (c-pointer Sint32))

(define-foreign-type Uint8   unsigned-byte)
(define-foreign-type Uint16  unsigned-short)
(define-foreign-type Uint32  unsigned-integer32)
(define-foreign-type Uint64  unsigned-integer64)

(define-foreign-type Uint8*  (c-pointer Uint8))
(define-foreign-type Uint16* (c-pointer Uint16))
(define-foreign-type Uint32* (c-pointer Uint32))
(define-foreign-type Uint64* (c-pointer Uint64))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ENUMS

(define-foreign-type SDL_AudioDeviceID Uint32)
(define-foreign-type SDL_AudioFormat Uint16)
(define-foreign-type SDL_AudioFormatEnum int)
(define-foreign-type SDL_AudioStatus int)

(define-foreign-type SDL_BlendMode int)
(define-foreign-type SDL_EventType int)
(define-foreign-type SDL_FingerID Sint64)
(define-foreign-type SDL_GLattr int)
(define-foreign-type SDL_GLcontextFlag int)
(define-foreign-type SDL_GLprofile int)
(define-foreign-type SDL_GestureID Sint64)
(define-foreign-type SDL_JoystickHatPosition int)
(define-foreign-type SDL_JoystickID Sint32)
(define-foreign-type SDL_Keycode int)
(define-foreign-type SDL_Keymod int)
(define-foreign-type SDL_MouseButton int)
(define-foreign-type SDL_MouseButtonMask int)
(define-foreign-type SDL_RWopsWhenceEnum int)
(define-foreign-type SDL_Scancode int)
(define-foreign-type SDL_SystemCursor int)
(define-foreign-type SDL_TouchID Sint64)
(define-foreign-type SDL_WindowEventID int)
(define-foreign-type SDL_WindowFlags int)
(define-foreign-type SDL_eventaction int)

(define-foreign-type SDL_PixelFormatEnum int)
(define-foreign-type SDL_PixelTypeEnum int)
(define-foreign-type SDL_BitmapOrderEnum int)
(define-foreign-type SDL_PackedOrderEnum int)
(define-foreign-type SDL_ArrayOrderEnum int)
(define-foreign-type SDL_PackedLayoutEnum int)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; STRUCTS


(define-foreign-type SDL_AudioCVT*
  (c-pointer "SDL_AudioCVT")
  %sdl-audio-cvt-pointer %wrap-sdl-audio-cvt)

(define-foreign-type SDL_AudioSpec*
  (c-pointer "SDL_AudioSpec")
  %sdl-audio-spec-pointer %wrap-sdl-audio-spec)

(define-foreign-type SDL_AudioCallback
  (function void ((c-pointer userdata)
                  (Uint8* stream)
                  (int len))))

(define-foreign-type SDL_AudioFilter
  (function void ((SDL_AudioCVT* cvt)
                  (SDL_AudioFormat format))))


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

(define-foreign-type SDL_Finger*
  (c-pointer "SDL_Finger")
  %sdl-finger-pointer %wrap-sdl-finger)


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
  %->SDL_Palette*
  %SDL_Palette*->sdl-palette)

(define-foreign-type SDL_PixelFormat*
  (c-pointer "SDL_PixelFormat")
  %->SDL_PixelFormat*
  %SDL_PixelFormat*->sdl-pixel-format)


(define-foreign-type SDL_Rect*
  (nonnull-c-pointer "SDL_Rect")
  %sdl-rect->SDL_Rect*
  %SDL_Rect*->sdl-rect)

(define-foreign-type SDL_Rect*-or-null
  (c-pointer "SDL_Rect")
  %->SDL_Rect*
  %SDL_Rect*->sdl-rect)


(define-foreign-type SDL_Point*
  (nonnull-c-pointer "SDL_Point")
  %sdl-point->SDL_Point*
  %SDL_Point*->sdl-point)

(define-foreign-type SDL_Point*-or-null
  (c-pointer "SDL_Point")
  %->SDL_Point*
  %SDL_Point*->sdl-point)


(define-foreign-type SDL_RWops*
  (c-pointer "SDL_RWops")
  %sdl-rwops-pointer %wrap-sdl-rwops)

(define-foreign-type SDL_Surface*
  (c-pointer "SDL_Surface")
  %->SDL_Surface*
  %SDL_Surface*->sdl-surface)

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
  %->SDL_Event*
  %SDL_Event*->sdl-event)

(define-foreign-type SDL_EventFilter
  (function int (c-pointer SDL_Event*)))

(define-foreign-type SDL_EventFilter*
  (c-pointer (function int (c-pointer SDL_Event*))))

(define-foreign-type SDL_Keysym*
  (c-pointer "SDL_Keysym")
  %->SDL_Keysym*
  %SDL_Keysym*->sdl-keysym)
