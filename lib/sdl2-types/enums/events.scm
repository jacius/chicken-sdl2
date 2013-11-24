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


(define-foreign-constants+ SDL_EventType
  (sdl-event-type-name
   %symbol->sdl-event-type
   sdl-event-type->keyword
   keyword->sdl-event-type)

  ((SDL_FIRSTEVENT                #:first)
   (SDL_QUIT                      #:quit)
   (SDL_APP_TERMINATING           #:app-terminating)
   (SDL_APP_LOWMEMORY             #:app-low-memory)
   (SDL_APP_WILLENTERBACKGROUND   #:app-will-enter-background)
   (SDL_APP_DIDENTERBACKGROUND    #:app-did-enter-background)
   (SDL_APP_WILLENTERFOREGROUND   #:app-will-enter-foreground)
   (SDL_APP_DIDENTERFOREGROUND    #:app-did-enter-foreground)
   (SDL_WINDOWEVENT               #:window)
   (SDL_SYSWMEVENT                #:sys-wm)
   (SDL_KEYDOWN                   #:key-down)
   (SDL_KEYUP                     #:key-up)
   (SDL_TEXTEDITING               #:text-editing)
   (SDL_TEXTINPUT                 #:text-input)
   (SDL_MOUSEMOTION               #:mouse-motion)
   (SDL_MOUSEBUTTONDOWN           #:mouse-button-down)
   (SDL_MOUSEBUTTONUP             #:mouse-button-up)
   (SDL_MOUSEWHEEL                #:mouse-wheel)
   (SDL_JOYAXISMOTION             #:joy-axis-motion)
   (SDL_JOYBALLMOTION             #:joy-ball-motion)
   (SDL_JOYHATMOTION              #:joy-hat-motion)
   (SDL_JOYBUTTONDOWN             #:joy-button-down)
   (SDL_JOYBUTTONUP               #:joy-button-up)
   (SDL_JOYDEVICEADDED            #:joy-device-added)
   (SDL_JOYDEVICEREMOVED          #:joy-device-removed)
   (SDL_CONTROLLERAXISMOTION      #:controller-axis-motion)
   (SDL_CONTROLLERBUTTONDOWN      #:controller-button-down)
   (SDL_CONTROLLERBUTTONUP        #:controller-button-up)
   (SDL_CONTROLLERDEVICEADDED     #:controller-device-added)
   (SDL_CONTROLLERDEVICEREMOVED   #:controller-device-removed)
   (SDL_CONTROLLERDEVICEREMAPPED  #:controller-device-remapped)
   (SDL_FINGERDOWN                #:finger-down)
   (SDL_FINGERUP                  #:finger-up)
   (SDL_FINGERMOTION              #:finger-motion)
   (SDL_DOLLARGESTURE             #:dollar-gesture)
   (SDL_DOLLARRECORD              #:dollar-record)
   (SDL_MULTIGESTURE              #:multigesture)
   (SDL_CLIPBOARDUPDATE           #:clipboard-update)
   (SDL_DROPFILE                  #:drop-file)
   (SDL_USEREVENT                 #:user-event)
   (SDL_LASTEVENT                 #:last)))


(define-foreign-constants+ SDL_eventaction
  (%sdl-event-action->symbol
   %symbol->sdl-event-action
   sdl-event-action->keyword
   keyword->sdl-event-action)
  ((SDL_ADDEVENT   #:add)
   (SDL_PEEKEVENT  #:peek)
   (SDL_GETEVENT   #:get)))


(define-foreign-constants int
  SDL_TEXTEDITINGEVENT_TEXT_SIZE
  SDL_TEXTINPUTEVENT_TEXT_SIZE)
