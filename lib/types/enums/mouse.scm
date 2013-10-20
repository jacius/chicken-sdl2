
;;; Technically not an enum, but close enough.
(define-and-export-enum SDL_MouseButton
  SDL_BUTTON_LEFT
  SDL_BUTTON_MIDDLE
  SDL_BUTTON_RIGHT
  SDL_BUTTON_X1
  SDL_BUTTON_X2)

;;; Technically not an enum, but close enough.
(define-and-export-enum SDL_MouseButtonMask
  SDL_BUTTON_LMASK
  SDL_BUTTON_MMASK
  SDL_BUTTON_RMASK
  SDL_BUTTON_X1MASK
  SDL_BUTTON_X2MASK)

(define-and-export-enum SDL_SystemCursor
  SDL_SYSTEM_CURSOR_ARROW
  SDL_SYSTEM_CURSOR_IBEAM
  SDL_SYSTEM_CURSOR_WAIT
  SDL_SYSTEM_CURSOR_CROSSHAIR
  SDL_SYSTEM_CURSOR_WAITARROW
  SDL_SYSTEM_CURSOR_SIZENWSE
  SDL_SYSTEM_CURSOR_SIZENESW
  SDL_SYSTEM_CURSOR_SIZEWE
  SDL_SYSTEM_CURSOR_SIZENS
  SDL_SYSTEM_CURSOR_SIZEALL
  SDL_SYSTEM_CURSOR_NO
  SDL_SYSTEM_CURSOR_HAND
  SDL_NUM_SYSTEM_CURSORS)