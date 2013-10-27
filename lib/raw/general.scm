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
;;; INITIALIZATION AND SHUTDOWN

(export SDL_Init
        SDL_InitSubSystem
        SDL_Quit
        SDL_QuitSubSystem
        SDL_WasInit)

(define-function-binding SDL_Init
  return: (int zero-if-success)
  args: ((Uint32 flags)))

(define-function-binding SDL_InitSubSystem
  return: (int zero-if-success)
  args: ((Uint32 flags)))

(define-function-binding SDL_Quit)

(define-function-binding SDL_QuitSubSystem
  args: ((Uint32 flags)))

(define-function-binding SDL_WasInit
  return: (Uint32 initialized-subsystems-mask)
  args: ((Uint32 flags)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ERROR HANDLING

(export SDL_ClearError
        SDL_GetError
        SDL_SetError)

(define-function-binding SDL_ClearError)

(define-function-binding SDL_GetError
  return: (c-string error-message))

(define-function-binding SDL_SetError
  args: ((c-string fmt))
  ;; SDL_SetError takes printf-style varargs, but I don't know how to
  ;; declare that, so the string by itself will have to suffice.
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; VERSION

(export SDL_VERSION
        SDL_GetVersion)

;; TODO?: SDL_COMPILEDVERSION
;; TODO?: SDL_GetRevision
;; TODO?: SDL_GetRevisionNumber

(define-function-binding SDL_GetVersion
  args: ((SDL_version* version)))

;; TODO?: SDL_REVISION

(define-function-binding* SDL_VERSION
  args: ((SDL_version* version))
  body: "SDL_VERSION(version);")

;; TODO?: SDL_VERSIONNUM
;; TODO?: SDL_VERSION_ATLEAST
