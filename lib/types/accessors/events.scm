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


(export sdl-event-type
        sdl-event-timestamp
        sdl-event-unwrap)

(define-function-binding* sdl-event-type
  return: (SDL_EventType type)
  args: ((c-pointer event))
  body: "C_return(((SDL_CommonEvent*)event)->type);")

(define-function-binding* sdl-event-timestamp
  return: (Uint32 timestamp)
  args: ((c-pointer event))
  body: "C_return(((SDL_CommonEvent*)event)->timestamp);")

(define (sdl-event-unwrap event)
  (let ((pointer (%sdl-event-pointer event)))
   (case (sdl-event-type event)
     ((SDL_QUIT)
      (%wrap-sdl-quit-event pointer))
     ((SDL_WINDOWEVENT)
      (%wrap-sdl-window-event pointer))
     ((SDL_SYSWMEVENT)
      (%wrap-sdl-sys-wm-event pointer))
     ((SDL_KEYDOWN SDL_KEYUP)
      (%wrap-sdl-keyboard-event pointer))
     ((SDL_TEXTEDITING)
      (%wrap-sdl-text-editing-event pointer))
     ((SDL_TEXTINPUT)
      (%wrap-sdl-text-input-event pointer))
     ((SDL_MOUSEMOTION)
      (%wrap-sdl-mouse-motion-event pointer))
     ((SDL_MOUSEBUTTONDOWN SDL_MOUSEBUTTONUP)
      (%wrap-sdl-mouse-button-event pointer))
     ((SDL_MOUSEWHEEL)
      (%wrap-sdl-mouse-wheel-event pointer))
     ((SDL_JOYAXISMOTION)
      (%wrap-sdl-joy-axis-event pointer))
     ((SDL_JOYBALLMOTION)
      (%wrap-sdl-joy-ball-event pointer))
     ((SDL_JOYHATMOTION)
      (%wrap-sdl-joy-hat-event pointer))
     ((SDL_JOYBUTTONDOWN SDL_JOYBUTTONUP)
      (%wrap-sdl-joy-button-event pointer))
     ;; ((SDL_JOYDEVICEADDED SDL_JOYDEVICEREMOVED)
     ;;  (%wrap-sdl-joy-devic-event pointer))
     ;; ((SDL_CONTROLLERAXISMOTION)
     ;;  (%wrap-sdl-controller-axis-event pointer))
     ;; ((SDL_CONTROLLERBUTTONDOWN SDL_CONTROLLERBUTTONUP)
     ;;  (%wrap-sdl-controller-button-event pointer))
     ;; ((SDL_CONTROLLERDEVICEADDED SDL_CONTROLLERDEVICEREMOVED SDL_CONTROLLERDEVICEREMAPPED)
     ;;  (%wrap-sdl-controller-device-event pointer))
     ;; ((SDL_FINGERDOWN SDL_FINGERUP SDL_FINGERMOTION)
     ;;  (%wrap-sdl-touch-event pointer))
     ;; ((SDL_DOLLARGESTURE SDL_DOLLARRECORD)
     ;;  (%wrap-sdl-dollar-gesture-event pointer))
     ;; ((SDL_MULTIGESTURE)
     ;;  (%wrap-sdl-multi-gesture-event pointer))
     ;; ((SDL_CLIPBOARDUPDATE)
     ;;   (%wrap-sdl-clipboard-update-event pointer))
     ((SDL_DROPFILE)
      (%wrap-sdl-drop-event pointer))
     ((SDL_USEREVENT)
      (%wrap-sdl-user-event pointer)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; KEYBOARD / TEXT

(export sdl-keyboard-event-window-id
        sdl-keyboard-event-state
        sdl-keyboard-event-repeat
        ;; sdl-keyboard-event-keysym
        ;; SDL_TEXTEDITINGEVENT_TEXT_SIZE
        sdl-text-editing-event-window-id
        ;; sdl-text-editing-event-text
        sdl-text-editing-event-start
        ;; sdl-text-editing-event-length
        ;; SDL_TEXTINPUTEVENT_TEXT_SIZE
        sdl-text-input-event-window-id
        ;; sdl-text-input-event-text
        )

(define-nonuniform-struct-accessors SDL_KeyboardEvent*
  (Uint32 windowID sdl-keyboard-event-window-id)
  (Uint8 state sdl-keyboard-event-state)
  (Uint8 repeat sdl-keyboard-event-repeat)
  ;; (SDL_Keysym* keysym sdl-keyboard-event-keysym)
  )

; #define SDL_TEXTEDITINGEVENT_TEXT_SIZE (32)

(define-nonuniform-struct-accessors SDL_TextEditingEvent*
  (Uint32 windowID sdl-text-editing-event-window-id)
  ;; (c-string text sdl-text-editing-event-text)
  (int32 start sdl-text-editing-event-start)
  ;; (int32 length sdl-text-editing-event-length)
  )

; #define SDL_TEXTINPUTEVENT_TEXT_SIZE (32)
(define-nonuniform-struct-accessors SDL_TextInputEvent*
  (Uint32 windowID sdl-text-input-event-window-id)
  ;; (c-string text sdl-text-input-event-text)
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; MOUSE

(export sdl-mouse-motion-event-window-id
        sdl-mouse-motion-event-which
        sdl-mouse-motion-event-state
        sdl-mouse-motion-event-x
        sdl-mouse-motion-event-y
        sdl-mouse-motion-event-xrel
        sdl-mouse-motion-event-yrel

        sdl-mouse-wheel-event-window-id
        sdl-mouse-wheel-event-which
        sdl-mouse-wheel-event-x
        sdl-mouse-wheel-event-y

        sdl-mouse-motion-event-window-id
        sdl-mouse-motion-event-which
        sdl-mouse-motion-event-state
        sdl-mouse-motion-event-x
        sdl-mouse-motion-event-y
        sdl-mouse-motion-event-xrel
        sdl-mouse-motion-event-yrel

        sdl-mouse-button-event-window-id
        sdl-mouse-button-event-which
        sdl-mouse-button-event-button
        sdl-mouse-button-event-state
        sdl-mouse-button-event-x
        sdl-mouse-button-event-y

        sdl-mouse-wheel-event-window-id
        sdl-mouse-wheel-event-which
        sdl-mouse-wheel-event-x
        sdl-mouse-wheel-event-y)

(define-nonuniform-struct-accessors SDL_MouseButtonEvent*
  (Uint32 windowID sdl-mouse-button-event-window-id)
  (Uint32 which sdl-mouse-button-event-which)
  (Uint8 button sdl-mouse-button-event-button)
  (Uint8 state sdl-mouse-button-event-state)
  (int32 x sdl-mouse-button-event-x)
  (int32 y sdl-mouse-button-event-y))

(define-nonuniform-struct-accessors SDL_MouseWheelEvent*
  (Uint32 windowID sdl-mouse-wheel-event-window-id)
  (Uint32 which sdl-mouse-wheel-event-which)
  (int32 x sdl-mouse-wheel-event-x)
  (int32 y sdl-mouse-wheel-event-y))

(define-nonuniform-struct-accessors SDL_MouseMotionEvent*
  (Uint32 windowID sdl-mouse-motion-event-window-id)
  (Uint32 which sdl-mouse-motion-event-which)
  (Uint32 state sdl-mouse-motion-event-state)
  (int32 x sdl-mouse-motion-event-x)
  (int32 y sdl-mouse-motion-event-y)
  (int32 xrel sdl-mouse-motion-event-xrel)
  (int32 yrel sdl-mouse-motion-event-yrel))

(define-nonuniform-struct-accessors SDL_MouseButtonEvent*
  (Uint32 windowID sdl-mouse-button-event-window-id)
  (Uint32 which sdl-mouse-button-event-which)
  (Uint8 button sdl-mouse-button-event-button)
  (Uint8 state sdl-mouse-button-event-state)
  (int32 x sdl-mouse-button-event-x)
  (int32 y sdl-mouse-button-event-y))

(define-nonuniform-struct-accessors SDL_MouseWheelEvent*
  (Uint32 windowID sdl-mouse-wheel-event-window-id)
  (Uint32 which sdl-mouse-wheel-event-which)
  (int32 x sdl-mouse-wheel-event-x)
  (int32 y sdl-mouse-wheel-event-y))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; JOYSTICK

(export sdl-joy-axis-event-which
        sdl-joy-axis-event-axis
        sdl-joy-axis-event-value

        sdl-joy-ball-event-which
        sdl-joy-ball-event-ball
        sdl-joy-ball-event-xrel
        sdl-joy-ball-event-yrel

        sdl-joy-hat-event-which
        sdl-joy-hat-event-hat
        sdl-joy-hat-event-value

        sdl-joy-button-event-which
        sdl-joy-button-event-button
        sdl-joy-button-event-state

        ;; sdl-joy-device-event-which
        )

(define-nonuniform-struct-accessors SDL_JoyAxisEvent*
  (SDL_JoystickID which sdl-joy-axis-event-which)
  (Uint8 axis sdl-joy-axis-event-axis)
  (Sint16 value sdl-joy-axis-event-value))

(define-nonuniform-struct-accessors SDL_JoyBallEvent*
  (SDL_JoystickID which sdl-joy-ball-event-which)
  (Uint8 ball sdl-joy-ball-event-ball)
  (Sint16 xrel sdl-joy-ball-event-xrel)
  (Sint16 yrel sdl-joy-ball-event-yrel))

(define-nonuniform-struct-accessors SDL_JoyHatEvent*
  (SDL_JoystickID which sdl-joy-hat-event-which)
  (Uint8 hat sdl-joy-hat-event-hat)
  (Uint8 value sdl-joy-hat-event-value))

(define-nonuniform-struct-accessors SDL_JoyButtonEvent*
  (SDL_JoystickID which sdl-joy-button-event-which)
  (Uint8 button sdl-joy-button-event-button)
  (Uint8 state sdl-joy-button-event-state))

;; (define-nonuniform-struct-accessors SDL_JoyDeviceEvent*
;;   (int32 which sdl-joy-device-event-which))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; CONTROLLER


;; (export sdl-controller-axis-event-which
;;         sdl-controller-axis-event-axis
;;         sdl-controller-axis-event-value
;;
;;         sdl-controller-button-event-which
;;         sdl-controller-button-event-button
;;         sdl-controller-button-event-state
;;
;;         sdl-controller-device-event-which)

;; (define-nonuniform-struct-accessors SDL_ControllerAxisEvent*
;;   (SDL_JoystickID which sdl-controller-axis-event-which)
;;   (Uint8 axis sdl-controller-axis-event-axis)
;;   (Sint16 value sdl-controller-axis-event-value))

;; (define-nonuniform-struct-accessors SDL_ControllerButtonEvent*
;;   (SDL_JoystickID which sdl-controller-button-event-which)
;;   (Uint8 button sdl-controller-button-event-button)
;;   (Uint8 state sdl-controller-button-event-state))

;; (define-nonuniform-struct-accessors SDL_ControllerDeviceEvent*
;;   (int32 which sdl-controller-device-event-which))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; TOUCH / GESTURE

;; (export sdl-touch-finger-event-touch-id
;;         sdl-touch-finger-event-finger-id
;;         sdl-touch-finger-event-x
;;         sdl-touch-finger-event-y
;;         sdl-touch-finger-event-dx
;;         sdl-touch-finger-event-dy
;;         sdl-touch-finger-event-pressure
;;
;;         sdl-multi-gesture-event-touch-id
;;         sdl-multi-gesture-event-dtheta
;;         sdl-multi-gesture-event-ddist
;;         sdl-multi-gesture-event-x
;;         sdl-multi-gesture-event-y
;;         sdl-multi-gesture-event-num-fingers
;;
;;         sdl-dollar-gesture-event-touch-id
;;         sdl-dollar-gesture-event-gesture-id
;;         sdl-dollar-gesture-event-num-fingers
;;         sdl-dollar-gesture-event-error
;;         sdl-dollar-gesture-event-x
;;         sdl-dollar-gesture-event-y)

;; (define-nonuniform-struct-accessors SDL_TouchFingerEvent*
;;   (SDL_TouchID touchId sdl-touch-finger-event-touch-id)
;;   (SDL_FingerID fingerId sdl-touch-finger-event-finger-id)
;;   (float x sdl-touch-finger-event-x)
;;   (float y sdl-touch-finger-event-y)
;;   (float dx sdl-touch-finger-event-dx)
;;   (float dy sdl-touch-finger-event-dy)
;;   (float pressure sdl-touch-finger-event-pressure))

;; (define-nonuniform-struct-accessors SDL_MultiGestureEvent*
;;   (SDL_TouchID touchId sdl-multi-gesture-event-touch-id)
;;   (float dTheta sdl-multi-gesture-event-dtheta)
;;   (float dDist sdl-multi-gesture-event-ddist)
;;   (float x sdl-multi-gesture-event-x)
;;   (float y sdl-multi-gesture-event-y)
;;   (Uint16 numFingers sdl-multi-gesture-event-num-fingers))

;; (define-nonuniform-struct-accessors SDL_DollarGestureEvent*
;;   (SDL_TouchID touchId sdl-dollar-gesture-event-touch-id)
;;   (SDL_GestureID gestureId sdl-dollar-gesture-event-gesture-id)
;;   (Uint32 numFingers sdl-dollar-gesture-event-num-fingers)
;;   (float error sdl-dollar-gesture-event-error)
;;   (float x sdl-dollar-gesture-event-x)
;;   (float y sdl-dollar-gesture-event-y))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; MISC

(export sdl-window-event-window-id
        sdl-window-event-event
        sdl-window-event-data1
        sdl-window-event-data2

        sdl-drop-event-file

        sdl-user-event-window-id
        sdl-user-event-code
        sdl-user-event-data1
        sdl-user-event-data2

        sdl-sys-wm-event-msg)

(define-nonuniform-struct-accessors SDL_WindowEvent*
  (Uint32 windowID sdl-window-event-window-id)
  (Uint8 event sdl-window-event-event)
  (Sint32 data1 sdl-window-event-data1)
  (Sint32 data2 sdl-window-event-data2))

(define-nonuniform-struct-accessors SDL_DropEvent*
  (c-string file sdl-drop-event-file))

(define-nonuniform-struct-accessors SDL_QuitEvent*)

(define-nonuniform-struct-accessors SDL_OSEvent*)

(define-nonuniform-struct-accessors SDL_UserEvent*
  (Uint32 windowID sdl-user-event-window-id)
  (Sint32 code sdl-user-event-code)
  (c-pointer data1 sdl-user-event-data1)
  (c-pointer data2 sdl-user-event-data2))

(define-nonuniform-struct-accessors SDL_SysWMEvent*
  (SDL_SysWMmsg* msg sdl-sys-wm-event-msg))
