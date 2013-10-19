
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; VIDEO / DISPLAY MODE

(export SDL_VideoInit
        SDL_VideoQuit
        SDL_DisableScreenSaver
        SDL_EnableScreenSaver
        SDL_IsScreenSaverEnabled
        SDL_GetClosestDisplayMode
        SDL_GetCurrentDisplayMode
        SDL_GetCurrentVideoDriver
        SDL_GetDesktopDisplayMode
        SDL_GetDisplayBounds
        SDL_GetDisplayMode
        SDL_GetNumDisplayModes
        SDL_GetNumVideoDisplays
        SDL_GetNumVideoDrivers
        SDL_GetVideoDriver)


(define-function-binding SDL_VideoInit
  args: ((c-string driver-name)))

(define-function-binding SDL_VideoQuit)

(define-function-binding SDL_DisableScreenSaver)

(define-function-binding SDL_EnableScreenSaver)

(define-function-binding SDL_IsScreenSaverEnabled
  return: (bool enabled?))

(define-function-binding SDL_GetClosestDisplayMode
  return: (SDL_DisplayMode* closest)
  args: ((int display-index)
         ((const SDL_DisplayMode*) mode)
         (SDL_DisplayMode* closest-out)))

(define-function-binding SDL_GetCurrentDisplayMode
  return: (int zero-if-success)
  args: ((int display-index) (SDL_DisplayMode* mode-out)))

(define-function-binding SDL_GetCurrentVideoDriver
  return: (c-string driver-name))

(define-function-binding SDL_GetDesktopDisplayMode
  return: (int zero-if-success)
  args: ((int display-index) (SDL_DisplayMode* mode-out)))

(define-function-binding SDL_GetDisplayBounds
  return: (int zero-if-success)
  args: ((int display-index) (SDL_Rect* rect-out)))

(define-function-binding SDL_GetDisplayMode
  return: (int zero-if-success)
  args: ((int display-index)
         (int mode-index)
         (SDL_DisplayMode* mode-out)))

(define-function-binding SDL_GetNumDisplayModes
  return: (int num-modes)
  args: ((int display-index)))

(define-function-binding SDL_GetNumVideoDisplays
  return: (int num-displays))

(define-function-binding SDL_GetNumVideoDrivers
  return: (int num-drivers))

(define-function-binding SDL_GetVideoDriver
  return: ((const c-string) driver-name)
  args: ((int index)))
