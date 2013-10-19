
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; WINDOW

(export SDL_CreateWindow
        SDL_DestroyWindow

        SDL_UpdateWindowSurface
        SDL_UpdateWindowSurfaceRects

        SDL_ShowWindow
        SDL_HideWindow
        SDL_MaximizeWindow
        SDL_MinimizeWindow
        SDL_RaiseWindow
        SDL_RestoreWindow

        SDL_GetWindowBrightness
        SDL_GetWindowData
        SDL_GetWindowDisplayIndex
        SDL_GetWindowDisplayMode
        SDL_GetWindowFlags
        SDL_GetWindowFromID
        SDL_GetWindowGammaRamp
        SDL_GetWindowGrab
        SDL_GetWindowID
        SDL_GetWindowMaximumSize
        SDL_GetWindowMinimumSize
        SDL_GetWindowPixelFormat
        SDL_GetWindowPosition
        SDL_GetWindowSize
        SDL_GetWindowSurface
        SDL_GetWindowTitle
        SDL_GetWindowWMInfo

        SDL_SetWindowBrightness
        SDL_SetWindowData
        SDL_SetWindowDisplayMode
        SDL_SetWindowFullscreen
        SDL_SetWindowGammaRamp
        SDL_SetWindowGrab
        SDL_SetWindowIcon
        SDL_SetWindowMaximumSize
        SDL_SetWindowMinimumSize
        SDL_SetWindowPosition
        SDL_SetWindowSize
        SDL_SetWindowTitle)

(define-and-export-enum SDL_WindowFlags
  SDL_WINDOW_FULLSCREEN
  SDL_WINDOW_FULLSCREEN_DESKTOP
  SDL_WINDOW_OPENGL
  SDL_WINDOW_SHOWN
  SDL_WINDOW_HIDDEN
  SDL_WINDOW_BORDERLESS
  SDL_WINDOW_RESIZABLE
  SDL_WINDOW_MINIMIZED
  SDL_WINDOW_MAXIMIZED
  SDL_WINDOW_INPUT_GRABBED
  SDL_WINDOW_INPUT_FOCUS
  SDL_WINDOW_MOUSE_FOCUS
  SDL_WINDOW_FOREIGN)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; CREATE / DESTROY WINDOW

(define-function-binding SDL_CreateWindow
  return: (SDL_Window* new-window)
  args: (((const c-string) title)
         (int x) (int y)
         (int w) (int h)
         (unsigned-int32 flags)))

;;; TODO?: SDL_CreateWindowAndRenderer
;;; TODO?: SDL_CreateWindowFrom

(define-function-binding SDL_DestroyWindow
  args: ((SDL_Window* window)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; UPDATE WINDOW SURFACE

(define-function-binding SDL_UpdateWindowSurface
  return: (int zero-if-success)
  args: ((SDL_Window* window)))

(define-function-binding SDL_UpdateWindowSurfaceRects
  return: (int zero-if-success)
  args: ((SDL_Window* window)
         ((const c-pointer) rects)
         (int numrects)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; WINDOW MANAGEMENT

(define-function-binding SDL_ShowWindow
  args: ((SDL_Window* window)))

(define-function-binding SDL_HideWindow
  args: ((SDL_Window* window)))

(define-function-binding SDL_MaximizeWindow
  args: ((SDL_Window* window)))

(define-function-binding SDL_MinimizeWindow
  args: ((SDL_Window* window)))

(define-function-binding SDL_RaiseWindow
  args: ((SDL_Window* window)))

(define-function-binding SDL_RestoreWindow
  args: ((SDL_Window* window)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; GET WINDOW PROPERTIES

(define-function-binding SDL_GetWindowBrightness
  return: (float brightness)
  args: ((SDL_Window* window)))

(define-function-binding SDL_GetWindowData
  return: (c-pointer data-value)
  args: ((SDL_Window* window)
         ((const c-string) data-key)))

(define-function-binding SDL_GetWindowDisplayIndex
  return: (int display-index)
  args: ((SDL_Window* window)))

(define-function-binding SDL_GetWindowDisplayMode
  return: (int zero-if-success)
  args: ((SDL_Window* window)
         (SDL_DisplayMode* mode-out)))

(define-function-binding SDL_GetWindowFlags
  return: (unsigned-int32 flags)
  args: ((SDL_Window* window)))

(define-function-binding SDL_GetWindowFromID
  return: (SDL_Window* window-or-null)
  args: ((unsigned-int32 id)))

(define-function-binding SDL_GetWindowGammaRamp
  return: (int zero-if-success)
  args: ((SDL_Window* window)
         ((c-pointer unsigned-int16) red-array-out)
         ((c-pointer unsigned-int16) green-array-out)
         ((c-pointer unsigned-int16) blue-array-out)))

(define-function-binding SDL_GetWindowGrab
  return: (bool grabbed?)
  args: ((SDL_Window* window)))

(define-function-binding SDL_GetWindowID
  return: (unsigned-int32 id)
  args: ((SDL_Window* window)))

(define-function-binding SDL_GetWindowMaximumSize
  args: ((SDL_Window* window)
         ((c-pointer int) w-out)
         ((c-pointer int) h-out)))

(define-function-binding SDL_GetWindowMinimumSize
  args: ((SDL_Window* window)
         ((c-pointer int) w-out)
         ((c-pointer int) h-out)))

(define-function-binding SDL_GetWindowPixelFormat
  return: (unsigned-int32 format)
  args: ((SDL_Window* window)))

(define-function-binding SDL_GetWindowPosition
  args: ((SDL_Window* window)
         ((c-pointer int) x-out)
         ((c-pointer int) y-out)))

(define-function-binding SDL_GetWindowSize
  args: ((SDL_Window* window)
         ((c-pointer int) w-out)
         ((c-pointer int) h-out)))

(define-function-binding SDL_GetWindowSurface
  return: (SDL_Surface* surface-or-null)
  args: ((SDL_Window* window)))

(define-function-binding SDL_GetWindowTitle
  return: ((const c-string) title)
  args: ((SDL_Window* window)))

(define-function-binding SDL_GetWindowWMInfo
  return: (bool success?)
  args: ((SDL_Window* window)
         (SDL_SysWMinfo* info-out)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; SET WINDOW PROPERTIES

(define-function-binding SDL_SetWindowBrightness
  return: (int zero-if-success)
  args: ((SDL_Window* window)
         (float brightness)))

(define-function-binding SDL_SetWindowData
  return: (c-pointer previous-data-value)
  args: ((SDL_Window* window)
         ((const c-string) data-key)
         (c-pointer data-value)))

(define-function-binding SDL_SetWindowDisplayMode
  return: (int zero-if-success)
  args: ((SDL_Window* window)
         ((const SDL_DisplayMode*) mode)))

(define-function-binding SDL_SetWindowFullscreen
  return: (int zero-if-success)
  args: ((SDL_Window* window)
         (unsigned-int32 fullscreen-flags)))

(define-function-binding SDL_SetWindowGammaRamp
  return: (int zero-if-success)
  args: ((SDL_Window* window)
         ((const (c-pointer unsigned-int16)) red-array)
         ((const (c-pointer unsigned-int16)) green-array)
         ((const (c-pointer unsigned-int16)) blue-array)))

(define-function-binding SDL_SetWindowGrab
  args: ((SDL_Window* window)
         (bool grabbed?)))

(define-function-binding SDL_SetWindowIcon
  args: ((SDL_Window* window)
         (SDL_Surface* surface)))

(define-function-binding SDL_SetWindowMaximumSize
  args: ((SDL_Window* window)
         (int max_w)
         (int max_h)))

(define-function-binding SDL_SetWindowMinimumSize
  args: ((SDL_Window* window)
         (int min_w)
         (int min_h)))

(define-function-binding SDL_SetWindowPosition
  args: ((SDL_Window* window)
         (int x)
         (int y)))

(define-function-binding SDL_SetWindowSize
  args: ((SDL_Window* window)
         (int w)
         (int h)))

(define-function-binding SDL_SetWindowTitle
  args: ((SDL_Window* window)
         ((const c-string) title)))