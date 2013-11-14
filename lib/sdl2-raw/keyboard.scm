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


(export SDL_GetKeyFromName
        SDL_GetKeyFromScancode
        SDL_GetKeyName

        SDL_GetScancodeFromKey
        SDL_GetScancodeFromName
        SDL_GetScancodeName

        SDL_GetKeyboardFocus
        SDL_GetKeyboardState

        SDL_GetModState
        SDL_SetModState

        SDL_SetTextInputRect
        SDL_StartTextInput
        SDL_StopTextInput)


(define-function-binding SDL_GetKeyFromName
  return: (SDL_Keycode key)
  args: ((c-string name)))

(define-function-binding SDL_GetKeyFromScancode
  return: (SDL_Keycode key)
  args: ((SDL_Scancode name)))

(define-function-binding SDL_GetKeyName
  return: (c-string name)
  args: ((SDL_Keycode key)))


(define-function-binding SDL_GetScancodeFromKey
  return: (SDL_Scancode scancode)
  args: ((SDL_Keycode key)))

(define-function-binding SDL_GetScancodeFromName
  return: (SDL_Scancode scancode)
  args: ((c-string name)))

(define-function-binding SDL_GetScancodeName
  return: (c-string name)
  args: ((SDL_Scancode scancode)))


(define-function-binding SDL_GetKeyboardFocus
  return: (SDL_Window* window-with-focus))

(define-function-binding SDL_GetKeyboardState
  return: (Uint8* key-states-array)
  args: ((int* numkeys-out)))


(define-function-binding SDL_GetModState
  return: (SDL_Keymod modstate))

(define-function-binding SDL_SetModState
  args: ((SDL_Keymod modstate)))


(define-function-binding SDL_SetTextInputRect
  args: ((SDL_Rect* rect-or-null)))

(define-function-binding SDL_StartTextInput)

(define-function-binding SDL_StopTextInput)
