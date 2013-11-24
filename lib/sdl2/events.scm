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


(define (sdl-event-state type state)
  (= SDL_ENABLE
     (SDL_EventState
      (keyword->sdl-event-type type)
      (case state
        ((#t) SDL_ENABLE)
        ((#f) SDL_DISABLE)
        (else SDL_QUERY)))))


(define (sdl-flush-event type)
  (SDL_FlushEvent (keyword->sdl-event-type type)))

(define (sdl-flush-events min-type max-type)
  (SDL_FlushEvents
   (if (integer? min-type)
       min-type
       (keyword->sdl-event-type min-type default: SDL_FIRSTEVENT))
   (if (integer? max-type)
       max-type
       (keyword->sdl-event-type max-type default: SDL_LASTEVENT))))

(define (sdl-has-event type)
  (SDL_HasEvent (keyword->sdl-event-type type)))

(define (sdl-has-events min-type max-type)
  (SDL_HasEvents
   (if (integer? min-type)
       min-type
       (keyword->sdl-event-type min-type default: SDL_FIRSTEVENT))
   (if (integer? max-type)
       max-type
       (keyword->sdl-event-type max-type default: SDL_LASTEVENT))))

(define (sdl-quit-requested)
  (SDL_QuitRequested))


;;; Three behaviors in one function. We are not amused.
(define (sdl-peep-events events/num action #!optional
                         (min-type #:first)
                         (max-type #:last))
  (let ((act (if (integer? action)
                 action
                 (keyword->sdl-event-action action default: 0)))
        (min (if (integer? min-type)
                 min-type
                 (keyword->sdl-event-type min-type default: SDL_FIRSTEVENT)))
        (max (if (integer? max-type)
                 max-type
                 (keyword->sdl-event-type max-type default: SDL_LASTEVENT))))
    (select act
      ((SDL_ADDEVENT)
       (%sdl-peep-events/add
        events/num act min max))
      ((SDL_PEEKEVENT SDL_GETEVENT)
       (%sdl-peep-events/peek-get
        events/num act min max)))))

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
