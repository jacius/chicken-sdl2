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
;;; CURSOR

(export SDL_CreateColorCursor
        SDL_CreateCursor
        SDL_FreeCursor
        SDL_GetCursor
        SDL_SetCursor
        SDL_ShowCursor)

(define-function-binding SDL_CreateColorCursor
  return: (SDL_Cursor* cursor)
  args: ((SDL_Surface* surface)
         (int hot-x)
         (int hot-y)))

(define-function-binding SDL_CreateCursor
  return: (SDL_Cursor* cursor)
  args: (((c-pointer unsigned-int8) data)
         ((c-pointer unsigned-int8) mask)
         (int w)
         (int h)
         (int hot-x)
         (int hot-y)))

(define-function-binding SDL_FreeCursor
  args: ((SDL_Cursor* cursor)))

(define-function-binding SDL_GetCursor
  return: (SDL_Cursor* active-cursor))

(define-function-binding SDL_SetCursor
  args: ((SDL_Cursor* cursor)))

(define-function-binding SDL_ShowCursor
  return: (int status)
  args: ((int toggle)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; MOUSE STATE

(export SDL_GetMouseFocus
        SDL_GetMouseState
        SDL_GetRelativeMouseState
        SDL_GetRelativeMouseMode
        SDL_SetRelativeMouseMode
        SDL_WarpMouseInWindow)

(define-function-binding SDL_GetMouseFocus
  return: (SDL_Window* window-with-focus))

(define-function-binding SDL_GetMouseState
  return: (unsigned-int32 buttons-mask)
  args: (((c-pointer int) x-out)
         ((c-pointer int) y-out)))

(define-function-binding SDL_GetRelativeMouseState
  return: (unsigned-int32 buttons-mask)
  args: (((c-pointer int) x-out)
         ((c-pointer int) y-out)))

(define-function-binding SDL_GetRelativeMouseMode
  return: (bool relative-mode?))

(define-function-binding SDL_SetRelativeMouseMode
  return: (int zero-if-success)
  args: ((bool relative-mode?)))

(define-function-binding SDL_WarpMouseInWindow
  args: ((SDL_Window* target-window-or-null)
         (int x)
         (int y)))
