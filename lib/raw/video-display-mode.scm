
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; VIDEO / DISPLAY MODE

(export SDL_VideoInit
        SDL_VideoQuit
        SDL_DisableScreenSaver
        SDL_EnableScreenSaver
        SDL_IsScreenSaverEnabled)

(define-function-binding SDL_VideoInit
  args: ((c-string driver-name)))

(define-function-binding SDL_VideoQuit)

(define-function-binding SDL_DisableScreenSaver)

(define-function-binding SDL_EnableScreenSaver)

(define-function-binding SDL_IsScreenSaverEnabled
  return: (bool enabled?))

;; TODO?: SDL_GetClosestDisplayMode
;; TODO?: SDL_GetCurrentDisplayMode
;; TODO?: SDL_GetCurrentVideoDriver
;; TODO?: SDL_GetDesktopDisplayMode
;; TODO?: SDL_GetDisplayBounds
;; TODO?: SDL_GetDisplayMode
;; TODO?: SDL_GetNumDisplayModes
;; TODO?: SDL_GetNumVideoDisplays
;; TODO?: SDL_GetNumVideoDrivers
;; TODO?: SDL_GetVideoDriver
