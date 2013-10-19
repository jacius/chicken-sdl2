
(export make-sdl-rect
        sdl-rect-x sdl-rect-x-set!
        sdl-rect-y sdl-rect-y-set!
        sdl-rect-w sdl-rect-w-set!
        sdl-rect-h sdl-rect-h-set!
        sdl-rect-set!
        sdl-rect->list)

(define-record-printer (sdl-rect c out)
  (%displayify out "#<sdl-rect " (sdl-rect->list c) ">"))

(define (make-sdl-rect x y w h)
  (%wrap-sdl-rect (s32vector x y w h)))

(define-foreign-struct SDL_Rect*
  (int x sdl-rect-x sdl-rect-x-set!)
  (int y sdl-rect-y sdl-rect-y-set!)
  (int w sdl-rect-w sdl-rect-w-set!)
  (int h sdl-rect-h sdl-rect-h-set!))

(define (sdl-rect-set! r #!key x y w h)
  (assert (sdl-rect? r))
  (when x (sdl-rect-x-set! r x))
  (when y (sdl-rect-y-set! r y))
  (when w (sdl-rect-w-set! r w))
  (when h (sdl-rect-h-set! r h)))

(define (sdl-rect->list c)
  (s32vector->list (%sdl-rect-data c)))
