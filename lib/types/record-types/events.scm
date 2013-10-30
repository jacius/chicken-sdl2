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


(export %sdl-event?
        %wrap-sdl-event
        %sdl-event-pointer
        %sdl-event-pointer-set!
        %sdl-event-data
        %sdl-event-data-set!)

(define-record-type sdl-event
  (%wrap-sdl-event pointer data)
  %sdl-event?
  (pointer %sdl-event-pointer %sdl-event-pointer-set!)
  (data %sdl-event-data %sdl-event-data-set!))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; KEYBOARD / TEXT

(export sdl-keyboard-event?
        %wrap-sdl-keyboard-event
        %sdl-keyboard-event-pointer
        %sdl-keyboard-event-pointer-set!

        sdl-text-editing-event?
        %wrap-sdl-text-editing-event
        %sdl-text-editing-event-pointer
        %sdl-text-editing-event-pointer-set!

        sdl-text-input-event?
        %wrap-sdl-text-input-event
        %sdl-text-input-event-pointer
        %sdl-text-input-event-pointer-set!)

(define-record-type sdl-keyboard-event
  (%wrap-sdl-keyboard-event pointer)
  sdl-keyboard-event?
  (pointer %sdl-keyboard-event-pointer %sdl-keyboard-event-pointer-set!))

(define-record-type sdl-text-editing-event
  (%wrap-sdl-text-editing-event pointer)
  sdl-text-editing-event?
  (pointer %sdl-text-editing-event-pointer %sdl-text-editing-event-pointer-set!))

(define-record-type sdl-text-input-event
  (%wrap-sdl-text-input-event pointer)
  sdl-text-input-event?
  (pointer %sdl-text-input-event-pointer %sdl-text-input-event-pointer-set!))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; MOUSE

(export sdl-mouse-motion-event?
        %wrap-sdl-mouse-motion-event
        %sdl-mouse-motion-event-pointer
        %sdl-mouse-motion-event-pointer-set!

        sdl-mouse-button-event?
        %wrap-sdl-mouse-button-event
        %sdl-mouse-button-event-pointer
        %sdl-mouse-button-event-pointer-set!

        sdl-mouse-wheel-event?
        %wrap-sdl-mouse-wheel-event
        %sdl-mouse-wheel-event-pointer
        %sdl-mouse-wheel-event-pointer-set!)

(define-record-type sdl-mouse-motion-event
  (%wrap-sdl-mouse-motion-event pointer)
  sdl-mouse-motion-event?
  (pointer %sdl-mouse-motion-event-pointer %sdl-mouse-motion-event-pointer-set!))

(define-record-type sdl-mouse-button-event
  (%wrap-sdl-mouse-button-event pointer)
  sdl-mouse-button-event?
  (pointer %sdl-mouse-button-event-pointer %sdl-mouse-button-event-pointer-set!))

(define-record-type sdl-mouse-wheel-event
  (%wrap-sdl-mouse-wheel-event pointer)
  sdl-mouse-wheel-event?
  (pointer %sdl-mouse-wheel-event-pointer %sdl-mouse-wheel-event-pointer-set!))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; JOYSTICK

(export sdl-joy-axis-event?
        %wrap-sdl-joy-axis-event
        %sdl-joy-axis-event-pointer
        %sdl-joy-axis-event-pointer-set!

        sdl-joy-ball-event?
        %wrap-sdl-joy-ball-event
        %sdl-joy-ball-event-pointer
        %sdl-joy-ball-event-pointer-set!

        sdl-joy-button-event?
        %wrap-sdl-joy-button-event
        %sdl-joy-button-event-pointer
        %sdl-joy-button-event-pointer-set!

        sdl-joy-hat-event?
        %wrap-sdl-joy-hat-event
        %sdl-joy-hat-event-pointer
        %sdl-joy-hat-event-pointer-set!

        ;; sdl-joy-device-event?
        ;; %wrap-sdl-joy-device-event
        ;; %sdl-joy-device-event-pointer
        ;; %sdl-joy-device-event-pointer-set!
        )

(define-record-type sdl-joy-axis-event
  (%wrap-sdl-joy-axis-event pointer)
  sdl-joy-axis-event?
  (pointer %sdl-joy-axis-event-pointer %sdl-joy-axis-event-pointer-set!))

(define-record-type sdl-joy-ball-event
  (%wrap-sdl-joy-ball-event pointer)
  sdl-joy-ball-event?
  (pointer %sdl-joy-ball-event-pointer %sdl-joy-ball-event-pointer-set!))

(define-record-type sdl-joy-button-event
  (%wrap-sdl-joy-button-event pointer)
  sdl-joy-button-event?
  (pointer %sdl-joy-button-event-pointer %sdl-joy-button-event-pointer-set!))

(define-record-type sdl-joy-hat-event
  (%wrap-sdl-joy-hat-event pointer)
  sdl-joy-hat-event?
  (pointer %sdl-joy-hat-event-pointer %sdl-joy-hat-event-pointer-set!))

;; (define-record-type sdl-joy-device-event
;;   (%wrap-sdl-joy-device-event pointer)
;;   sdl-joy-device-event?
;;   (pointer %sdl-joy-device-event-pointer %sdl-joy-device-event-pointer-set!))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; CONTROLLER

;; (export sdl-controller-axis-event?
;;         %wrap-sdl-controller-axis-event
;;         %sdl-controller-axis-event-pointer
;;         %sdl-controller-axis-event-pointer-set!
;;
;;         sdl-controller-button-event?
;;         %wrap-sdl-controller-button-event
;;         %sdl-controller-button-event-pointer
;;         %sdl-controller-button-event-pointer-set!
;;
;;         sdl-controller-device-event?
;;         %wrap-sdl-controller-device-event
;;         %sdl-controller-device-event-pointer
;;         %sdl-controller-device-event-pointer-set!)

;; (define-record-type sdl-controller-axis-event
;;   (%wrap-sdl-controller-axis-event pointer)
;;   sdl-controller-axis-event?
;;   (pointer %sdl-controller-axis-event-pointer %sdl-controller-axis-event-pointer-set!))

;; (define-record-type sdl-controller-button-event
;;   (%wrap-sdl-controller-button-event pointer)
;;   sdl-controller-button-event?
;;   (pointer %sdl-controller-button-event-pointer %sdl-controller-button-event-pointer-set!))

;; (define-record-type sdl-controller-device-event
;;   (%wrap-sdl-controller-device-event pointer)
;;   sdl-controller-device-event?
;;   (pointer %sdl-controller-device-event-pointer %sdl-controller-device-event-pointer-set!))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; TOUCH / GESTURES

;; (export sdl-touch-finger-event?
;;         %wrap-sdl-touch-finger-event
;;         %sdl-touch-finger-event-pointer
;;         %sdl-touch-finger-event-pointer-set!
;;
;;         sdl-multi-gesture-event?
;;         %wrap-sdl-multi-gesture-event
;;         %sdl-multi-gesture-event-pointer
;;         %sdl-multi-gesture-event-pointer-set!
;;
;;         sdl-dollar-gesture-event?
;;         %wrap-sdl-dollar-gesture-event
;;         %sdl-dollar-gesture-event-pointer
;;         %sdl-dollar-gesture-event-pointer-set!)

;; (define-record-type sdl-touch-finger-event
;;   (%wrap-sdl-touch-finger-event pointer)
;;   sdl-touch-finger-event?
;;   (pointer %sdl-touch-finger-event-pointer %sdl-touch-finger-event-pointer-set!))

;; (define-record-type sdl-multi-gesture-event
;;   (%wrap-sdl-multi-gesture-event pointer)
;;   sdl-multi-gesture-event?
;;   (pointer %sdl-multi-gesture-event-pointer %sdl-multi-gesture-event-pointer-set!))

;; (define-record-type sdl-dollar-gesture-event
;;   (%wrap-sdl-dollar-gesture-event pointer)
;;   sdl-dollar-gesture-event?
;;   (pointer %sdl-dollar-gesture-event-pointer %sdl-dollar-gesture-event-pointer-set!))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; MISC

(export sdl-window-event?
        %wrap-sdl-window-event
        %sdl-window-event-pointer
        %sdl-window-event-pointer-set!

        sdl-drop-event?
        %wrap-sdl-drop-event
        %sdl-drop-event-pointer
        %sdl-drop-event-pointer-set!

        sdl-quit-event?
        %wrap-sdl-quit-event
        %sdl-quit-event-pointer
        %sdl-quit-event-pointer-set!

        sdl-os-event?
        %wrap-sdl-os-event
        %sdl-os-event-pointer
        %sdl-os-event-pointer-set!

        sdl-user-event?
        %wrap-sdl-user-event
        %sdl-user-event-pointer
        %sdl-user-event-pointer-set!

        sdl-sys-wm-event?
        %wrap-sdl-sys-wm-event
        %sdl-sys-wm-event-pointer
        %sdl-sys-wm-event-pointer-set!)

(define-record-type sdl-window-event
  (%wrap-sdl-window-event pointer)
  sdl-window-event?
  (pointer %sdl-window-event-pointer %sdl-window-event-pointer-set!))

(define-record-type sdl-drop-event
  (%wrap-sdl-drop-event pointer)
  sdl-drop-event?
  (pointer %sdl-drop-event-pointer %sdl-drop-event-pointer-set!))

(define-record-type sdl-quit-event
  (%wrap-sdl-quit-event pointer)
  sdl-quit-event?
  (pointer %sdl-quit-event-pointer %sdl-quit-event-pointer-set!))

(define-record-type sdl-os-event
  (%wrap-sdl-os-event pointer)
  sdl-os-event?
  (pointer %sdl-os-event-pointer %sdl-os-event-pointer-set!))

(define-record-type sdl-user-event
  (%wrap-sdl-user-event pointer)
  sdl-user-event?
  (pointer %sdl-user-event-pointer %sdl-user-event-pointer-set!))

(define-record-type sdl-sys-wm-event
  (%wrap-sdl-sys-wm-event pointer)
  sdl-sys-wm-event?
  (pointer %sdl-sys-wm-event-pointer %sdl-sys-wm-event-pointer-set!))
