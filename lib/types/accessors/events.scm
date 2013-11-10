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
        sdl-event-type-set!
        sdl-event-timestamp
        sdl-event-timestamp-set!)

(define-function-binding* sdl-event-type
  return: (SDL_EventType type)
  args: ((SDL_Event* event))
  body: "C_return(((SDL_CommonEvent*)event)->type);")

(define-function-binding* sdl-event-type-set!
  args: ((SDL_Event* event) (SDL_EventType type))
  body: "((SDL_CommonEvent*)event)->type = type;")

(define-function-binding* sdl-event-timestamp
  return: (Uint32 timestamp)
  args: ((SDL_Event* event))
  body: "C_return(((SDL_CommonEvent*)event)->timestamp);")

(define-function-binding* sdl-event-timestamp-set!
  args: ((SDL_Event* event) (Uint32 timestamp))
  body: "((SDL_CommonEvent*)event)->timestamp = timestamp;")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; KEYBOARD / TEXT

(export make-sdl-keyboard-event
        sdl-keyboard-event?
        sdl-keyboard-event-window-id
        sdl-keyboard-event-window-id-set!
        sdl-keyboard-event-state
        sdl-keyboard-event-state-set!
        sdl-keyboard-event-repeat
        sdl-keyboard-event-repeat-set!
        sdl-keyboard-event-keysym
        sdl-keyboard-event-keysym-set!

        make-sdl-text-editing-event
        sdl-text-editing-event?
        ;; SDL_TEXTEDITINGEVENT_TEXT_SIZE
        sdl-text-editing-event-window-id
        sdl-text-editing-event-window-id-set!
        ;; sdl-text-editing-event-text
        ;; sdl-text-editing-event-text-set!
        sdl-text-editing-event-start
        sdl-text-editing-event-start-set!
        sdl-text-editing-event-length
        sdl-text-editing-event-length-set!

        make-sdl-text-input-event
        sdl-text-input-event?
        ;; SDL_TEXTINPUTEVENT_TEXT_SIZE
        sdl-text-input-event-window-id
        sdl-text-input-event-window-id-set!
        ;; sdl-text-input-event-text
        ;; sdl-text-input-event-text-set!
        )

(define-sdl-event-type "SDL_KeyboardEvent"
  types: (SDL_KEYDOWN
          SDL_KEYUP)
  make: make-sdl-keyboard-event
  predicate: sdl-keyboard-event?
  fields: (((Uint32 windowID)
            guard: (Uint32-guard "sdl-keyboard-event field windowID")
            get: sdl-keyboard-event-window-id
            set: sdl-keyboard-event-window-id-set!)
           ((Uint8 state)
            guard: (Uint8-guard "sdl-keyboard-event field state")
            get: sdl-keyboard-event-state
            set: sdl-keyboard-event-state-set!)
           ((Uint8 repeat)
            guard: (Uint8-guard "sdl-keyboard-event field repeat")
            get: sdl-keyboard-event-repeat
            set: sdl-keyboard-event-repeat-set!)
           ;; ((SDL_Keysym keysym)
           ;;  guard: noop-guard
           ;;  get: sdl-keyboard-event-keysym
           ;;  set: sdl-keyboard-event-keysym-set!)
           ))

(define (sdl-keyboard-event-keysym event)
  (let ((keysym (%allocate-sdl-keysym)))
    ((foreign-lambda*
      void ((SDL_Event* ev) (blob data))
      "*((SDL_Keysym*)data) = ((SDL_KeyboardEvent*)ev)->keysym;")
     event (%sdl-keysym-data keysym))
    keysym))

(define (sdl-keyboard-event-keysym-set! event keysym)
  (if (%sdl-keysym-data keysym)
      ((foreign-lambda*
        void ((SDL_Event* ev) (blob data))
        "((SDL_KeyboardEvent*)ev)->keysym = *((SDL_Keysym*)data);")
       event (%sdl-keysym-data keysym))
      ((foreign-lambda*
        void ((SDL_Event* ev) ((c-pointer "SDL_Keysym") ptr))
        "((SDL_KeyboardEvent*)ev)->keysym = *ptr;")
       event (%sdl-keysym-pointer keysym))))

;; #define SDL_TEXTEDITINGEVENT_TEXT_SIZE (32)

(define-sdl-event-type "SDL_TextEditingEvent"
  types: (SDL_TEXTEDITING)
  make: make-sdl-text-editing-event
  predicate: sdl-text-editing-event?
  fields: (((Uint32 windowID)
            guard: (Uint32-guard "sdl-text-editing-event field windowID")
            get: sdl-text-editing-event-window-id
            set: sdl-text-editing-event-window-id-set!)
           ;; ((c-string text)
           ;;  guard: noop-guard
           ;;  get: sdl-text-editing-event-text
           ;;  set: sdl-text-editing-event-text-set!)
           ((Sint32 start)
            guard: (Sint32-guard "sdl-text-editing-event field start")
            get: sdl-text-editing-event-start
            set: sdl-text-editing-event-start-set!)
           ((Sint32 length)
            guard: (Sint32-guard "sdl-text-editing-event field length")
            get: sdl-text-editing-event-length
            set: sdl-text-editing-event-length-set!)))

;; #define SDL_TEXTINPUTEVENT_TEXT_SIZE (32)

(define-sdl-event-type "SDL_TextInputEvent"
  types: (SDL_TEXTINPUT)
  make: make-sdl-text-input-event
  predicate: sdl-text-input-event?
  fields: (((Uint32 windowID)
            guard: (Uint32-guard "sdl-text-input-event field windowID")
            get: sdl-text-input-event-window-id
            set: sdl-text-input-event-window-id-set!)
           ;; ((c-string text)
           ;;  guard: noop-guard
           ;;  get: sdl-text-input-event-text
           ;;  set: sdl-text-input-event-text-set!)
           ))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; MOUSE

(export make-sdl-mouse-button-event
        sdl-mouse-button-event?
        sdl-mouse-button-event-window-id
        sdl-mouse-button-event-window-id-set!
        sdl-mouse-button-event-which
        sdl-mouse-button-event-which-set!
        sdl-mouse-button-event-button
        sdl-mouse-button-event-button-set!
        sdl-mouse-button-event-state
        sdl-mouse-button-event-state-set!
        sdl-mouse-button-event-x
        sdl-mouse-button-event-x-set!
        sdl-mouse-button-event-y
        sdl-mouse-button-event-y-set!

        make-sdl-mouse-motion-event
        sdl-mouse-motion-event?
        sdl-mouse-motion-event-window-id
        sdl-mouse-motion-event-window-id-set!
        sdl-mouse-motion-event-which
        sdl-mouse-motion-event-which-set!
        sdl-mouse-motion-event-state
        sdl-mouse-motion-event-state-set!
        sdl-mouse-motion-event-x
        sdl-mouse-motion-event-x-set!
        sdl-mouse-motion-event-y
        sdl-mouse-motion-event-y-set!
        sdl-mouse-motion-event-xrel
        sdl-mouse-motion-event-xrel-set!
        sdl-mouse-motion-event-yrel
        sdl-mouse-motion-event-yrel-set!

        make-sdl-mouse-wheel-event
        sdl-mouse-wheel-event?
        sdl-mouse-wheel-event-window-id
        sdl-mouse-wheel-event-window-id-set!
        sdl-mouse-wheel-event-which
        sdl-mouse-wheel-event-which-set!
        sdl-mouse-wheel-event-x
        sdl-mouse-wheel-event-x-set!
        sdl-mouse-wheel-event-y
        sdl-mouse-wheel-event-y-set!)

(define-sdl-event-type "SDL_MouseButtonEvent"
  types: (SDL_MOUSEBUTTONDOWN
          SDL_MOUSEBUTTONUP)
  make: make-sdl-mouse-button-event
  predicate: sdl-mouse-button-event?
  fields: (((Uint32 windowID)
            guard: (Uint32-guard "sdl-mouse-button-event field windowID")
            get: sdl-mouse-button-event-window-id
            set: sdl-mouse-button-event-window-id-set!)
           ((Uint32 which)
            guard: (Uint32-guard "sdl-mouse-button-event field which")
            get: sdl-mouse-button-event-which
            set: sdl-mouse-button-event-which-set!)
           ((Uint8 button)
            guard: (Uint8-guard "sdl-mouse-button-event field button")
            get: sdl-mouse-button-event-button
            set: sdl-mouse-button-event-button-set!)
           ((Uint8 state)
            guard: (Uint8-guard "sdl-mouse-button-event field state")
            get: sdl-mouse-button-event-state
            set: sdl-mouse-button-event-state-set!)
           ((Sint32 x)
            guard: (Sint32-guard "sdl-mouse-button-event field x")
            get: sdl-mouse-button-event-x
            set: sdl-mouse-button-event-x-set!)
           ((Sint32 y)
            guard: (Sint32-guard "sdl-mouse-button-event field y")
            get: sdl-mouse-button-event-y
            set: sdl-mouse-button-event-y-set!)))

(define-sdl-event-type "SDL_MouseMotionEvent"
  types: (SDL_MOUSEMOTION)
  make: make-sdl-mouse-motion-event
  predicate: sdl-mouse-motion-event?
  fields: (((Uint32 windowID)
            guard: (Uint32-guard "sdl-mouse-motion-event field windowID")
            get: sdl-mouse-motion-event-window-id
            set: sdl-mouse-motion-event-window-id-set!)
           ((Uint32 which)
            guard: (Uint32-guard "sdl-mouse-motion-event field which")
            get: sdl-mouse-motion-event-which
            set: sdl-mouse-motion-event-which-set!)
           ((Uint32 state)
            guard: (Uint32-guard "sdl-mouse-motion-event field state")
            get: sdl-mouse-motion-event-state
            set: sdl-mouse-motion-event-state-set!)
           ((Sint32 x)
            guard: (Sint32-guard "sdl-mouse-motion-event field x")
            get: sdl-mouse-motion-event-x
            set: sdl-mouse-motion-event-x-set!)
           ((Sint32 y)
            guard: (Sint32-guard "sdl-mouse-motion-event field y")
            get: sdl-mouse-motion-event-y
            set: sdl-mouse-motion-event-y-set!)
           ((Sint32 xrel)
            guard: (Sint32-guard "sdl-mouse-motion-event field xrel")
            get: sdl-mouse-motion-event-xrel
            set: sdl-mouse-motion-event-xrel-set!)
           ((Sint32 yrel)
            guard: (Sint32-guard "sdl-mouse-motion-event field yrel")
            get: sdl-mouse-motion-event-yrel
            set: sdl-mouse-motion-event-yrel-set!)))

(define-sdl-event-type "SDL_MouseWheelEvent"
  types: (SDL_MOUSEWHEEL)
  make: make-sdl-mouse-wheel-event
  predicate: sdl-mouse-wheel-event?
  fields: (((Uint32 windowID)
            guard: (Uint32-guard "sdl-mouse-wheel-event field windowID")
            get: sdl-mouse-wheel-event-window-id
            set: sdl-mouse-wheel-event-window-id-set!)
           ((Uint32 which)
            guard: (Uint32-guard "sdl-mouse-wheel-event field which")
            get: sdl-mouse-wheel-event-which
            set: sdl-mouse-wheel-event-which-set!)
           ((Sint32 x)
            guard: (Sint32-guard "sdl-mouse-wheel-event field x")
            get: sdl-mouse-wheel-event-x
            set: sdl-mouse-wheel-event-x-set!)
           ((Sint32 y)
            guard: (Sint32-guard "sdl-mouse-wheel-event field y")
            get: sdl-mouse-wheel-event-y
            set: sdl-mouse-wheel-event-y-set!)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; JOYSTICK

(export make-sdl-joy-axis-event
        sdl-joy-axis-event?
        sdl-joy-axis-event-which
        sdl-joy-axis-event-which-set!
        sdl-joy-axis-event-axis
        sdl-joy-axis-event-axis-set!
        sdl-joy-axis-event-value
        sdl-joy-axis-event-value-set!

        make-sdl-joy-ball-event
        sdl-joy-ball-event?
        sdl-joy-ball-event-which
        sdl-joy-ball-event-which-set!
        sdl-joy-ball-event-ball
        sdl-joy-ball-event-ball-set!
        sdl-joy-ball-event-xrel
        sdl-joy-ball-event-xrel-set!
        sdl-joy-ball-event-yrel
        sdl-joy-ball-event-yrel-set!

        make-sdl-joy-hat-event
        sdl-joy-hat-event?
        sdl-joy-hat-event-which
        sdl-joy-hat-event-which-set!
        sdl-joy-hat-event-hat
        sdl-joy-hat-event-hat-set!
        sdl-joy-hat-event-value
        sdl-joy-hat-event-value-set!

        make-sdl-joy-button-event
        sdl-joy-button-event?
        sdl-joy-button-event-which
        sdl-joy-button-event-which-set!
        sdl-joy-button-event-button
        sdl-joy-button-event-button-set!
        sdl-joy-button-event-state
        sdl-joy-button-event-state-set!

        make-sdl-joy-device-event
        sdl-joy-device-event?
        sdl-joy-device-event-which
        sdl-joy-device-event-which-set!)

(define-sdl-event-type "SDL_JoyAxisEvent"
  types: (SDL_JOYAXISMOTION)
  make: make-sdl-joy-axis-event
  predicate: sdl-joy-axis-event?
  fields: (((SDL_JoystickID which)
            guard: noop-guard
            get: sdl-joy-axis-event-which
            set: sdl-joy-axis-event-which-set!)
           ((Uint8 axis)
            guard: (Uint8-guard "sdl-joy-axis-event field axis")
            get: sdl-joy-axis-event-axis
            set: sdl-joy-axis-event-axis-set!)
           ((Sint16 value)
            guard: (Sint16-guard "sdl-joy-axis-event field value")
            get: sdl-joy-axis-event-value
            set: sdl-joy-axis-event-value-set!)))

(define-sdl-event-type "SDL_JoyBallEvent"
  types: (SDL_JOYBALLMOTION)
  make: make-sdl-joy-ball-event
  predicate: sdl-joy-ball-event?
  fields: (((SDL_JoystickID which)
            guard: noop-guard
            get: sdl-joy-ball-event-which
            set: sdl-joy-ball-event-which-set!)
           ((Uint8 ball)
            guard: (Uint8-guard "sdl-joy-ball-event field ball")
            get: sdl-joy-ball-event-ball
            set: sdl-joy-ball-event-ball-set!)
           ((Sint16 xrel)
            guard: (Sint16-guard "sdl-joy-ball-event field xrel")
            get: sdl-joy-ball-event-xrel
            set: sdl-joy-ball-event-xrel-set!)
           ((Sint16 yrel)
            guard: (Sint16-guard "sdl-joy-ball-event field yrel")
            get: sdl-joy-ball-event-yrel
            set: sdl-joy-ball-event-yrel-set!)))

(define-sdl-event-type "SDL_JoyButtonEvent"
  types: (SDL_JOYBUTTONDOWN
          SDL_JOYBUTTONUP)
  make: make-sdl-joy-button-event
  predicate: sdl-joy-button-event?
  fields: (((SDL_JoystickID which)
            guard: noop-guard
            get: sdl-joy-button-event-which
            set: sdl-joy-button-event-which-set!)
           ((Uint8 button)
            guard: (Uint8-guard "sdl-joy-button-event field button")
            get: sdl-joy-button-event-button
            set: sdl-joy-button-event-button-set!)
           ((Uint8 state)
            guard: (Uint8-guard "sdl-joy-button-event field state")
            get: sdl-joy-button-event-state
            set: sdl-joy-button-event-state-set!)))

(define-sdl-event-type "SDL_JoyHatEvent"
  types: (SDL_JOYHATMOTION)
  make: make-sdl-joy-hat-event
  predicate: sdl-joy-hat-event?
  fields: (((SDL_JoystickID which)
            guard: noop-guard
            get: sdl-joy-hat-event-which
            set: sdl-joy-hat-event-which-set!)
           ((Uint8 hat)
            guard: (Uint8-guard "sdl-joy-hat-event field hat")
            get: sdl-joy-hat-event-hat
            set: sdl-joy-hat-event-hat-set!)
           ((Uint8 value)
            guard: (Uint8-guard "sdl-joy-hat-event field value")
            get: sdl-joy-hat-event-value
            set: sdl-joy-hat-event-value-set!)))

(define-sdl-event-type "SDL_JoyDeviceEvent"
  types: (SDL_JOYDEVICEADDED
          SDL_JOYDEVICEREMOVED)
  make: make-sdl-joy-device-event
  predicate: sdl-joy-device-event?
  fields: (((Sint32 which)
            guard: (Sint32-guard "sdl-joy-device-event field which")
            get: sdl-joy-device-event-which
            set: sdl-joy-device-event-which-set!)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; CONTROLLER

(export make-sdl-controller-axis-event
        sdl-controller-axis-event?
        sdl-controller-axis-event-which
        sdl-controller-axis-event-which-set!
        sdl-controller-axis-event-axis
        sdl-controller-axis-event-axis-set!
        sdl-controller-axis-event-value
        sdl-controller-axis-event-value-set!

        make-sdl-controller-button-event
        sdl-controller-button-event?
        sdl-controller-button-event-which
        sdl-controller-button-event-which-set!
        sdl-controller-button-event-button
        sdl-controller-button-event-button-set!
        sdl-controller-button-event-state
        sdl-controller-button-event-state-set!

        make-sdl-controller-device-event
        sdl-controller-device-event?
        sdl-controller-device-event-which
        sdl-controller-device-event-which-set!)

(define-sdl-event-type "SDL_ControllerAxisEvent"
  types: (SDL_CONTROLLERAXISMOTION)
  make: make-sdl-controller-axis-event
  predicate: sdl-controller-axis-event?
  fields: (((SDL_JoystickID which)
            guard: noop-guard
            get: sdl-controller-axis-event-which
            set: sdl-controller-axis-event-which-set!)
           ((Uint8 axis)
            guard: (Uint8-guard "sdl-controller-axis-event field axis")
            get: sdl-controller-axis-event-axis
            set: sdl-controller-axis-event-axis-set!)
           ((Sint16 value)
            guard: (Sint16-guard "sdl-controller-axis-event field value")
            get: sdl-controller-axis-event-value
            set: sdl-controller-axis-event-value-set!)))

(define-sdl-event-type "SDL_ControllerButtonEvent"
  types: (SDL_CONTROLLERBUTTONDOWN
          SDL_CONTROLLERBUTTONUP)
  make: make-sdl-controller-button-event
  predicate: sdl-controller-button-event?
  fields: (((SDL_JoystickID which)
            guard: noop-guard
            get: sdl-controller-button-event-which
            set: sdl-controller-button-event-which-set!)
           ((Uint8 button)
            guard: (Uint8-guard "sdl-controller-button-event field button")
            get: sdl-controller-button-event-button
            set: sdl-controller-button-event-button-set!)
           ((Uint8 state)
            guard: (Uint8-guard "sdl-controller-button-event field state")
            get: sdl-controller-button-event-state
            set: sdl-controller-button-event-state-set!)))

(define-sdl-event-type "SDL_ControllerDeviceEvent"
  types: (SDL_CONTROLLERDEVICEADDED
          SDL_CONTROLLERDEVICEREMOVED
          SDL_CONTROLLERDEVICEREMAPPED)
  make: make-sdl-controller-device-event
  predicate: sdl-controller-device-event?
  fields: (((Sint32 which)
            guard: (Sint32-guard "sdl-controller-device-event field which")
            get: sdl-controller-device-event-which
            set: sdl-controller-device-event-which-set!)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; TOUCH / GESTURE

(export make-sdl-touch-finger-event
        sdl-touch-finger-event?
        sdl-touch-finger-event-touch-id
        sdl-touch-finger-event-touch-id-set!
        sdl-touch-finger-event-finger-id
        sdl-touch-finger-event-finger-id-set!
        sdl-touch-finger-event-x
        sdl-touch-finger-event-x-set!
        sdl-touch-finger-event-y
        sdl-touch-finger-event-y-set!
        sdl-touch-finger-event-dx
        sdl-touch-finger-event-dx-set!
        sdl-touch-finger-event-dy
        sdl-touch-finger-event-dy-set!
        sdl-touch-finger-event-pressure
        sdl-touch-finger-event-pressure-set!

        make-sdl-multi-gesture-event
        sdl-multi-gesture-event?
        sdl-multi-gesture-event-touch-id
        sdl-multi-gesture-event-touch-id-set!
        sdl-multi-gesture-event-dtheta
        sdl-multi-gesture-event-dtheta-set!
        sdl-multi-gesture-event-ddist
        sdl-multi-gesture-event-ddist-set!
        sdl-multi-gesture-event-x
        sdl-multi-gesture-event-x-set!
        sdl-multi-gesture-event-y
        sdl-multi-gesture-event-y-set!
        sdl-multi-gesture-event-num-fingers
        sdl-multi-gesture-event-num-fingers-set!

        make-sdl-dollar-gesture-event
        sdl-dollar-gesture-event?
        sdl-dollar-gesture-event-touch-id
        sdl-dollar-gesture-event-touch-id-set!
        sdl-dollar-gesture-event-gesture-id
        sdl-dollar-gesture-event-gesture-id-set!
        sdl-dollar-gesture-event-num-fingers
        sdl-dollar-gesture-event-num-fingers-set!
        sdl-dollar-gesture-event-error
        sdl-dollar-gesture-event-error-set!
        sdl-dollar-gesture-event-x
        sdl-dollar-gesture-event-x-set!
        sdl-dollar-gesture-event-y
        sdl-dollar-gesture-event-y-set!)

(define-sdl-event-type "SDL_TouchFingerEvent"
  types: (SDL_FINGERDOWN
          SDL_FINGERUP
          SDL_FINGERMOTION)
  make: make-sdl-touch-finger-event
  predicate: sdl-touch-finger-event?
  fields: (((SDL_TouchID touchId)
            guard: noop-guard
            get: sdl-touch-finger-event-touch-id
            set: sdl-touch-finger-event-touch-id-set!)
           ((SDL_FingerID fingerId)
            guard: noop-guard
            get: sdl-touch-finger-event-finger-id
            set: sdl-touch-finger-event-finger-id-set!)
           ((float x)
            guard: noop-guard
            get: sdl-touch-finger-event-x
            set: sdl-touch-finger-event-x-set!)
           ((float y)
            guard: noop-guard
            get: sdl-touch-finger-event-y
            set: sdl-touch-finger-event-y-set!)
           ((float dx)
            guard: noop-guard
            get: sdl-touch-finger-event-dx
            set: sdl-touch-finger-event-dx-set!)
           ((float dy)
            guard: noop-guard
            get: sdl-touch-finger-event-dy
            set: sdl-touch-finger-event-dy-set!)
           ((float pressure)
            guard: noop-guard
            get: sdl-touch-finger-event-pressure
            set: sdl-touch-finger-event-pressure-set!)))

(define-sdl-event-type "SDL_MultiGestureEvent"
  types: (SDL_MULTIGESTURE)
  make: make-sdl-multi-gesture-event
  predicate: sdl-multi-gesture-event?
  fields: (((SDL_TouchID touchId)
            guard: noop-guard
            get: sdl-multi-gesture-event-touch-id
            set: sdl-multi-gesture-event-touch-id-set!)
           ((float dTheta)
            guard: noop-guard
            get: sdl-multi-gesture-event-dtheta
            set: sdl-multi-gesture-event-dtheta-set!)
           ((float dDist)
            guard: noop-guard
            get: sdl-multi-gesture-event-ddist
            set: sdl-multi-gesture-event-ddist-set!)
           ((float x)
            guard: noop-guard
            get: sdl-multi-gesture-event-x
            set: sdl-multi-gesture-event-x-set!)
           ((float y)
            guard: noop-guard
            get: sdl-multi-gesture-event-y
            set: sdl-multi-gesture-event-y-set!)
           ((Uint16 numFingers)
            guard: (Uint16-guard "sdl-multi-gesture-event field numFingers")
            get: sdl-multi-gesture-event-num-fingers
            set: sdl-multi-gesture-event-num-fingers-set!)))

(define-sdl-event-type "SDL_DollarGestureEvent"
  types: (SDL_DOLLARGESTURE
          SDL_DOLLARRECORD)
  make: make-sdl-dollar-gesture-event
  predicate: sdl-dollar-gesture-event?
  fields: (((SDL_TouchID touchId)
            guard: noop-guard
            get: sdl-dollar-gesture-event-touch-id
            set: sdl-dollar-gesture-event-touch-id-set!)
           ((SDL_GestureID gestureId)
            guard: noop-guard
            get: sdl-dollar-gesture-event-gesture-id
            set: sdl-dollar-gesture-event-gesture-id-set!)
           ((Uint32 numFingers)
            guard: (Uint32-guard "sdl-dollar-gesture-event field numFingers")
            get: sdl-dollar-gesture-event-num-fingers
            set: sdl-dollar-gesture-event-num-fingers-set!)
           ;; See below.
           ;; ((float error)
           ;;  guard: noop-guard
           ;;  get: sdl-dollar-gesture-event-error
           ;;  set: sdl-dollar-gesture-event-error-set!)
           ((float x)
            guard: noop-guard
            get: sdl-dollar-gesture-event-x
            set: sdl-dollar-gesture-event-x-set!)
           ((float y)
            guard: noop-guard
            get: sdl-dollar-gesture-event-y
            set: sdl-dollar-gesture-event-y-set!)))

;; The field name "error" messes up the macro. Maybe the macro could
;; be fixed, but for now I'm just going to define these accessors
;; manually, below.

(define (sdl-dollar-gesture-event-error-set! event value)
  (assert (sdl-dollar-gesture-event? event))
  (let ((guarded-value (noop-guard value)))
    ((foreign-lambda*
      void ((SDL_Event* ev) (float val))
      "((SDL_DollarGestureEvent*)ev)->error = val;")
     event guarded-value)))

(define sdl-dollar-gesture-event-error
  (getter-with-setter
   (lambda (event)
     (assert (sdl-dollar-gesture-event? event))
     ((foreign-lambda*
       float ((SDL_Event* ev))
       "C_return(((SDL_DollarGestureEvent*)ev)->error);")
      event))
   sdl-dollar-gesture-event-error-set!))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; MISC

(export make-sdl-window-event
        sdl-window-event?
        sdl-window-event-window-id
        sdl-window-event-window-id-set!
        sdl-window-event-event
        sdl-window-event-event-set!
        sdl-window-event-data1
        sdl-window-event-data1-set!
        sdl-window-event-data2
        sdl-window-event-data2-set!

        make-sdl-drop-event
        sdl-drop-event?
        sdl-drop-event-file
        sdl-drop-event-file-set!

        make-sdl-quit-event
        sdl-quit-event?

        make-sdl-user-event
        sdl-user-event?
        sdl-user-event-window-id
        sdl-user-event-window-id-set!
        sdl-user-event-code
        sdl-user-event-code-set!
        sdl-user-event-data1
        sdl-user-event-data1-set!
        sdl-user-event-data2
        sdl-user-event-data2-set!

        make-sdl-sys-wm-event
        sdl-sys-wm-event?
        sdl-sys-wm-event-msg
        sdl-sys-wm-event-msg-set!)

(define-sdl-event-type "SDL_WindowEvent"
  types: (SDL_WINDOWEVENT)
  make: make-sdl-window-event
  predicate: sdl-window-event?
  fields: (((Uint32 windowID)
            guard: (Uint32-guard "sdl-window-event field windowID")
            get: sdl-window-event-window-id
            set: sdl-window-event-window-id-set!)
           ((Uint8 event)
            guard: (Uint8-guard "sdl-window-event field event")
            get: sdl-window-event-event
            set: sdl-window-event-event-set!)
           ((Sint32 data1)
            guard: (Sint32-guard "sdl-window-event field data1")
            get: sdl-window-event-data1
            set: sdl-window-event-data1-set!)
           ((Sint32 data2)
            guard: (Sint32-guard "sdl-window-event field data2")
            get: sdl-window-event-data2
            set: sdl-window-event-data2-set!)))

(define-sdl-event-type "SDL_DropEvent"
  types: (SDL_DROPFILE)
  make: make-sdl-drop-event
  predicate: sdl-drop-event?
  fields: (((c-string file)
            guard: noop-guard
            get: sdl-drop-event-file
            set: sdl-drop-event-file-set!)))

(define-sdl-event-type "SDL_QuitEvent"
  types: (SDL_QUIT)
  make: make-sdl-quit-event
  predicate: sdl-quit-event?
  fields: ())

(define-sdl-event-type "SDL_UserEvent"
  types: (SDL_USEREVENT)
  make: make-sdl-user-event
  predicate: sdl-user-event?
  fields: (((Uint32 windowID)
            guard: (Uint32-guard "sdl-user-event field windowID")
            get: sdl-user-event-window-id
            set: sdl-user-event-window-id-set!)
           ((Sint32 code)
            guard: (Sint32-guard "sdl-user-event field code")
            get: sdl-user-event-code
            set: sdl-user-event-code-set!)
           ((c-pointer data1)
            guard: noop-guard
            get: sdl-user-event-data1
            set: sdl-user-event-data1-set!)
           ((c-pointer data2)
            guard: noop-guard
            get: sdl-user-event-data2
            set: sdl-user-event-data2-set!)))

(define-sdl-event-type "SDL_SysWMEvent"
  types: (SDL_SYSWMEVENT)
  make: make-sdl-sys-wm-event
  predicate: sdl-sys-wm-event?
  fields: (((SDL_SysWMmsg* msg)
            guard: noop-guard
            get: sdl-sys-wm-event-msg
            set: sdl-sys-wm-event-msg-set!)))
