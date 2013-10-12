
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; WINDOW

(export SDL_CreateWindow
        SDL_DestroyWindow)

(define-function-binding SDL_CreateWindow
  return: (SDL_Window* new-window)
  args: ((c-string title)
         (integer x) (integer y)
         (integer w) (integer h)
         (unsigned-integer32 flags)))

;;; TODO?: SDL_CreateWindowAndRenderer
;;; TODO?: SDL_CreateWindowFrom

(define-function-binding SDL_DestroyWindow
  args: ((SDL_Window* window)))

;; TODO?: SDL_GetWindowBrightness
;; TODO?: SDL_GetWindowData
;; TODO?: SDL_GetWindowDisplayIndex
;; TODO?: SDL_GetWindowDisplayMode
;; TODO?: SDL_GetWindowFlags
;; TODO?: SDL_GetWindowFromID
;; TODO?: SDL_GetWindowGammaRamp
;; TODO?: SDL_GetWindowGrab
;; TODO?: SDL_GetWindowID
;; TODO?: SDL_GetWindowMaximumSize
;; TODO?: SDL_GetWindowMinimumSize
;; TODO?: SDL_GetWindowPixelFormat
;; TODO?: SDL_GetWindowPosition
;; TODO?: SDL_GetWindowSize
;; TODO?: SDL_GetWindowSurface
;; TODO?: SDL_GetWindowTitle
;; TODO?: SDL_GetWindowWMInfo

;; TODO?: SDL_SetWindowBrightness
;; TODO?: SDL_SetWindowData
;; TODO?: SDL_SetWindowDisplayMode
;; TODO?: SDL_SetWindowFullscreen
;; TODO?: SDL_SetWindowGammaRamp
;; TODO?: SDL_SetWindowGrab
;; TODO?: SDL_SetWindowIcon
;; TODO?: SDL_SetWindowMaximumSize
;; TODO?: SDL_SetWindowMinimumSize
;; TODO?: SDL_SetWindowPosition
;; TODO?: SDL_SetWindowSize
;; TODO?: SDL_SetWindowTitle

;; TODO?: SDL_ShowWindow
;; TODO?: SDL_HideWindow
;; TODO?: SDL_MaximizeWindow
;; TODO?: SDL_MinimizeWindow
;; TODO?: SDL_RaiseWindow
;; TODO?: SDL_RestoreWindow

;; TODO?: SDL_UpdateWindowSurface
;; TODO?: SDL_UpdateWindowSurfaceRects
