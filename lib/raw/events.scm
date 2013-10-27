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


(export SDL_AddEventWatch
        SDL_DelEventWatch
        SDL_EventState
        SDL_FilterEvents
        SDL_FlushEvent
        SDL_FlushEvents
        SDL_GetEventFilter
        ;; TODO: SDL_GetTouchFinger
        SDL_HasEvent
        SDL_HasEvents
        SDL_PeepEvents
        SDL_PollEvent
        SDL_PumpEvents
        SDL_PushEvent
        SDL_QuitRequested
        SDL_RegisterEvents
        ;; TODO: SDL_RecordGesture
        SDL_SetEventFilter
        SDL_WaitEvent
        SDL_WaitEventTimeout)


(define-function-binding SDL_AddEventWatch
  args: ((SDL_EventFilter filter) (c-pointer userdata)))

(define-function-binding SDL_DelEventWatch
  args: ((SDL_EventFilter filter) (c-pointer userdata)))

(define-function-binding SDL_EventState
  return: (Uint8 previous-state)
  args: ((SDL_EventType type) (int state)))

(define-function-binding SDL_FilterEvents
  args: ((SDL_EventFilter filter) (c-pointer userdata)))

(define-function-binding SDL_FlushEvent
  args: ((SDL_EventType type)))

(define-function-binding SDL_FlushEvents
  args: ((SDL_EventType minType) (SDL_EventType maxType)))

(define-function-binding SDL_GetEventFilter
  return: (bool success?)
  args: ((SDL_EventFilter* filter-out) (c-pointer userdata-out)))

;; TODO: SDL_GetTouchFinger

(define-function-binding SDL_HasEvent
  return: (bool found?)
  args: ((SDL_EventType type)))

(define-function-binding SDL_HasEvents
  return: (bool found?)
  args: ((SDL_EventType minType) (SDL_EventType maxType)))

(define-function-binding SDL_PeepEvents
  return: (int num-events-added)
  args: ((c-pointer events)
         (int numevents)
         (SDL_eventaction action)
         (SDL_EventType minType)
         (SDL_EventType maxType)))

(define-function-binding SDL_PollEvent
  return: (bool found-pending?)
  args: ((SDL_Event* event-out)))

(define-function-binding SDL_PumpEvents)

(define-function-binding SDL_PushEvent
  return: (int one-if-success)
  args: ((SDL_Event* event)))

(define-function-binding SDL_QuitRequested
  return: (bool quit-queued?))

(define-function-binding SDL_RegisterEvents
  return: (Uint32 beginning-event-number)
  args: ((int numevents)))

;; TODO: SDL_RecordGesture

(define-function-binding SDL_SetEventFilter
  args: ((SDL_EventFilter filter) (c-pointer userdata)))

(define-function-binding SDL_WaitEvent
  return: (bool success?)
  args: ((SDL_Event* event-out)))

(define-function-binding SDL_WaitEventTimeout
  return: (bool success?)
  args: ((SDL_Event* event-out) (int timeout)))
