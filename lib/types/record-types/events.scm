
(export %sdl-event?
        %wrap-sdl-event
        %sdl-event-pointer
        %sdl-event-pointer-set!)

(define-record-type sdl-event
  (%wrap-sdl-event pointer)
  %sdl-event?
  (pointer %sdl-event-pointer %sdl-event-pointer-set!))


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
