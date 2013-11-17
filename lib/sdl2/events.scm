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


(export sdl-event-state

        sdl-flush-event
        sdl-flush-events
        sdl-has-event
        sdl-has-events
        sdl-quit-requested

        sdl-peep-events
        sdl-add-events
        sdl-peek-events
        sdl-get-events

        sdl-poll-event
        sdl-pump-events
        sdl-push-event
        sdl-wait-event
        sdl-wait-event-timeout

        sdl-register-events

        ;; TODO: sdl-add-event-watch
        ;; TODO: sdl-del-event-watch
        ;; TODO: sdl-filter-events
        ;; TODO: sdl-get-event-filter
        ;; TODO: sdl-set-event-filter
        
        sdl-get-num-touch-devices
        sdl-get-num-touch-fingers
        sdl-get-touch-device
        sdl-get-touch-finger

        sdl-record-gesture
        sdl-save-dollar-template
        sdl-save-all-dollar-templates
        sdl-load-dollar-templates)


(define (%event-type->keyword type)
  (select type
    ((SDL_FIRSTEVENT)               #:first)
    ((SDL_QUIT)                     #:quit)
    ((SDL_APP_TERMINATING)          #:app-terminating)
    ((SDL_APP_LOWMEMORY)            #:app-low-memory)
    ((SDL_APP_WILLENTERBACKGROUND)  #:app-will-enter-background)
    ((SDL_APP_DIDENTERBACKGROUND)   #:app-did-enter-background)
    ((SDL_APP_WILLENTERFOREGROUND)  #:app-will-enter-foreground)
    ((SDL_APP_DIDENTERFOREGROUND)   #:app-did-enter-foreground)
    ((SDL_WINDOWEVENT)              #:window)
    ((SDL_SYSWMEVENT)               #:sys-wm)
    ((SDL_KEYDOWN)                  #:key-down)
    ((SDL_KEYUP)                    #:key-up)
    ((SDL_TEXTEDITING)              #:text-editing)
    ((SDL_TEXTINPUT)                #:text-input)
    ((SDL_MOUSEMOTION)              #:mouse-motion)
    ((SDL_MOUSEBUTTONDOWN)          #:mouse-button-down)
    ((SDL_MOUSEBUTTONUP)            #:mouse-button-up)
    ((SDL_MOUSEWHEEL)               #:mouse-wheel)
    ((SDL_JOYAXISMOTION)            #:joy-axis-motion)
    ((SDL_JOYBALLMOTION)            #:joy-ball-motion)
    ((SDL_JOYHATMOTION)             #:joy-hat-motion)
    ((SDL_JOYBUTTONDOWN)            #:joy-button-down)
    ((SDL_JOYBUTTONUP)              #:joy-button-up)
    ((SDL_JOYDEVICEADDED)           #:joy-device-added)
    ((SDL_JOYDEVICEREMOVED)         #:joy-device-removed)
    ((SDL_CONTROLLERAXISMOTION)     #:controller-axis-motion)
    ((SDL_CONTROLLERBUTTONDOWN)     #:controller-button-down)
    ((SDL_CONTROLLERBUTTONUP)       #:controller-button-up)
    ((SDL_CONTROLLERDEVICEADDED)    #:controller-device-added)
    ((SDL_CONTROLLERDEVICEREMOVED)  #:controller-device-removed)
    ((SDL_CONTROLLERDEVICEREMAPPED) #:controller-device-remapped)
    ((SDL_FINGERDOWN)               #:finger-down)
    ((SDL_FINGERUP)                 #:finger-up)
    ((SDL_FINGERMOTION)             #:finger-motion)
    ((SDL_DOLLARGESTURE)            #:dollar-gesture)
    ((SDL_DOLLARRECORD)             #:dollar-record)
    ((SDL_MULTIGESTURE)             #:multigesture)
    ((SDL_CLIPBOARDUPDATE)          #:clipboard-update)
    ((SDL_DROPFILE)                 #:drop-file)
    ((SDL_USEREVENT)                #:user-event)
    ((SDL_LASTEVENT)                #:last)
    (else #:unknown)))

(define (%keyword->event-type key)
  (case key
    ((#:first)                      SDL_FIRSTEVENT)
    ((#:quit)                       SDL_QUIT)
    ((#:app-terminating)            SDL_APP_TERMINATING)
    ((#:app-low-memory)             SDL_APP_LOWMEMORY)
    ((#:app-will-enter-background)  SDL_APP_WILLENTERBACKGROUND)
    ((#:app-did-enter-background)   SDL_APP_DIDENTERBACKGROUND)
    ((#:app-will-enter-foreground)  SDL_APP_WILLENTERFOREGROUND)
    ((#:app-did-enter-foreground)   SDL_APP_DIDENTERFOREGROUND)
    ((#:window)                     SDL_WINDOWEVENT)
    ((#:sys-wm)                     SDL_SYSWMEVENT)
    ((#:key-down)                   SDL_KEYDOWN)
    ((#:key-up)                     SDL_KEYUP)
    ((#:text-editing)               SDL_TEXTEDITING)
    ((#:text-input)                 SDL_TEXTINPUT)
    ((#:mouse-motion)               SDL_MOUSEMOTION)
    ((#:mouse-button-down)          SDL_MOUSEBUTTONDOWN)
    ((#:mouse-button-up)            SDL_MOUSEBUTTONUP)
    ((#:mouse-wheel)                SDL_MOUSEWHEEL)
    ((#:joy-axis-motion)            SDL_JOYAXISMOTION)
    ((#:joy-ball-motion)            SDL_JOYBALLMOTION)
    ((#:joy-hat-motion)             SDL_JOYHATMOTION)
    ((#:joy-button-down)            SDL_JOYBUTTONDOWN)
    ((#:joy-button-up)              SDL_JOYBUTTONUP)
    ((#:joy-device-added)           SDL_JOYDEVICEADDED)
    ((#:joy-device-removed)         SDL_JOYDEVICEREMOVED)
    ((#:controller-axis-motion)     SDL_CONTROLLERAXISMOTION)
    ((#:controller-button-down)     SDL_CONTROLLERBUTTONDOWN)
    ((#:controller-button-up)       SDL_CONTROLLERBUTTONUP)
    ((#:controller-device-added)    SDL_CONTROLLERDEVICEADDED)
    ((#:controller-device-removed)  SDL_CONTROLLERDEVICEREMOVED)
    ((#:controller-device-remapped) SDL_CONTROLLERDEVICEREMAPPED)
    ((#:finger-down)                SDL_FINGERDOWN)
    ((#:finger-up)                  SDL_FINGERUP)
    ((#:finger-motion)              SDL_FINGERMOTION)
    ((#:dollar-gesture)             SDL_DOLLARGESTURE)
    ((#:dollar-record)              SDL_DOLLARRECORD)
    ((#:multigesture)               SDL_MULTIGESTURE)
    ((#:clipboard-update)           SDL_CLIPBOARDUPDATE)
    ((#:drop-file)                  SDL_DROPFILE)
    ((#:user-event)                 SDL_USEREVENT)
    ((#:last)                       SDL_LASTEVENT)
    (else (if (integer? key)
              key
              0))))


(define (sdl-event-state type state)
  (= 1 (SDL_EventState
        (%keyword->event-type type)
        (case state
          ((#t) SDL_ENABLE)
          ((#f) SDL_DISABLE)
          (else SDL_QUERY)))))


(define (sdl-flush-event type)
  (SDL_FlushEvent (%keyword->event-type type)))

(define (sdl-flush-events min-type max-type)
  (SDL_FlushEvents (%keyword->event-type min-type)
                   (%keyword->event-type max-type)))

(define (sdl-has-event type)
  (SDL_HasEvent (%keyword->event-type type)))

(define (sdl-has-events min-type max-type)
  (SDL_HasEvents (%keyword->event-type min-type)
                 (%keyword->event-type max-type)))

(define (sdl-quit-requested)
  (SDL_QuitRequested))


;;; Three behaviors in one function. We are not amused.
(define (sdl-peep-events events/num action #!optional
                         (min-type #:first)
                         (max-type #:last))
  (let ((act (%keyword->event-action action))
        (min (%keyword->event-type min-type))
        (max (%keyword->event-type max-type)))
   (select act
     ((SDL_ADDEVENT)
      (%sdl-peep-events/add events/num act min max))
     ((SDL_PEEKEVENT SDL_GETEVENT)
      (%sdl-peep-events/peek-get events/num act min max)))))

(define (%keyword->event-action action)
  (case action
    ((#:add)  SDL_ADDEVENT)
    ((#:peek) SDL_PEEKEVENT)
    ((#:get)  SDL_GETEVENT)
    (else (if (integer? action)
              action
              0))))

(define (%sdl-peep-events/add events act min max)
  (assert (every sdl-event? events))
  (let ((events-vector
         (apply pointer-vector
           (map %sdl-event->SDL_Event* events))))
    (SDL_PeepEvents events-vector (length events) act min max)))

(define (%sdl-peep-events/peek-get num action min max)
  (let* ((out-buf (make-locative
                   (make-blob
                    (* num (foreign-type-size "SDL_Event")))))
         (result (SDL_PeepEvents out-buf num action min max)))
    (map (lambda (index)
           (let ((out-event (allocate-sdl-event)))
             ((foreign-lambda*
               void ((SDL_Event* ev) (int i) (c-pointer data))
               "*ev = ((SDL_Event*)data)[i];")
              out-event index out-buf)
             out-event))
         (iota result))))

(define (sdl-add-events events #!optional
                        (min-type #:first)
                        (max-type #:last))
  (sdl-peep-events events #:add min-type max-type))

(define (sdl-peek-events num #!optional
                         (min-type #:first)
                         (max-type #:last))
  (sdl-peep-events num #:peek min-type max-type))

(define (sdl-get-events num #!optional
                        (min-type #:first)
                        (max-type #:last))
  (sdl-peep-events num #:get min-type max-type))



(define (sdl-poll-event)
  (let ((ev (allocate-sdl-event)))
    (if (SDL_PollEvent ev)
        ev
        #f)))

(define (sdl-pump-events)
  (SDL_PumpEvents))

;;; TODO?: Should we give some indication that the event was filtered
;;; (return value = 0), versus an error occured (return value < 0)?
(define (sdl-push-event event)
  (= 1 (SDL_PushEvent event)))

(define (sdl-wait-event)
  (let ((ev (allocate-sdl-event)))
    (if (SDL_WaitEvent ev)
        ev
        #f)))

(define (sdl-wait-event-timeout timeout-ms)
  (let ((ev (allocate-sdl-event)))
    (if (SDL_WaitEventTimeout ev timeout-ms)
        ev
        #f)))


(define (sdl-register-events numevents)
  (let ((result (SDL_RegisterEvents numevents)))
    (if (= result (foreign-value "(Uint32)-1" Uint32))
        #f
        result)))


;; TODO: sdl-add-event-watch
;; TODO: sdl-del-event-watch
;; TODO: sdl-filter-events
;; TODO: sdl-get-event-filter
;; TODO: sdl-set-event-filter


(define (sdl-get-num-touch-devices)
  (SDL_GetNumTouchDevices))

(define (sdl-get-num-touch-fingers touch-id)
  (SDL_GetNumTouchFingers touch-id))

(define (sdl-get-touch-device device-id)
  (SDL_GetTouchDevice device-id))

(define (sdl-get-touch-finger touch-id index)
  (SDL_GetTouchFinger touch-id index))


(define (sdl-record-gesture touch-id)
  (SDL_RecordGesture touch-id))

(define (sdl-save-dollar-template gesture-id dst)
  (SDL_SaveDollarTemplate gesture-id dst))

(define (sdl-save-all-dollar-templates dst)
  (SDL_SaveAllDollarTemplates dst))

(define (sdl-load-dollar-templates touch-id src)
  (SDL_LoadDollarTemplates touch-id src))
