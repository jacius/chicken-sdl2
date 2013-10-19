
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; INITIALIZATION AND SHUTDOWN

(export SDL_Init
        SDL_InitSubSystem
        SDL_Quit
        SDL_QuitSubSystem
        SDL_WasInit)

(define-function-binding SDL_Init
  return: (int zero-if-success)
  args: ((unsigned-int32 flags)))

(define-function-binding SDL_InitSubSystem
  return: (int zero-if-success)
  args: ((unsigned-int32 flags)))

(define-function-binding SDL_Quit)

(define-function-binding SDL_QuitSubSystem
  args: ((unsigned-int32 flags)))

(define-function-binding SDL_WasInit
  return: (unsigned-int32 initialized-subsystems-mask)
  args: ((unsigned-int32 flags)))


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
