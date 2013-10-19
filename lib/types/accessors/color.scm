
(export make-sdl-color
        sdl-color-r sdl-color-r-set!
        sdl-color-g sdl-color-g-set!
        sdl-color-b sdl-color-b-set!
        sdl-color-a sdl-color-a-set!
        sdl-color-set!
        sdl-color->list
        make-sdl-colour
        sdl-colour?
        sdl-colour-r sdl-colour-r-set!
        sdl-colour-g sdl-colour-g-set!
        sdl-colour-b sdl-colour-b-set!
        sdl-colour-a sdl-colour-a-set!
        sdl-colour-set!)

(define-record-printer (sdl-color c out)
  (%displayify out "#<sdl-color " (sdl-color->list c) ">"))

(define (make-sdl-color r g b a)
  (assert (<= 0 r 255)) (assert (<= 0 g 255))
  (assert (<= 0 b 255)) (assert (<= 0 a 255))
  (%wrap-sdl-color (u8vector r g b a)))

(define-foreign-struct SDL_Color*
  (unsigned-int8 r sdl-color-r sdl-color-r-set!)
  (unsigned-int8 g sdl-color-g sdl-color-g-set!)
  (unsigned-int8 b sdl-color-b sdl-color-b-set!)
  (unsigned-int8 a sdl-color-a sdl-color-a-set!))

(define (sdl-color-set! c #!key r g b a)
  (assert (sdl-color? c))
  (when r (assert (<= 0 r 255)) (sdl-color-r-set! c r))
  (when g (assert (<= 0 g 255)) (sdl-color-g-set! c g))
  (when b (assert (<= 0 b 255)) (sdl-color-b-set! c b))
  (when a (assert (<= 0 a 255)) (sdl-color-a-set! c a)))

(define (sdl-color->list c)
  (u8vector->list (%sdl-color-data c)))

(define make-sdl-colour   make-sdl-color)
(define sdl-colour?       sdl-color?)
(define sdl-colour-r      sdl-color-r)
(define sdl-colour-g      sdl-color-g)
(define sdl-colour-b      sdl-color-b)
(define sdl-colour-a      sdl-color-a)
(define sdl-colour-r-set! sdl-color-r-set!)
(define sdl-colour-g-set! sdl-color-g-set!)
(define sdl-colour-b-set! sdl-color-b-set!)
(define sdl-colour-a-set! sdl-color-a-set!)
(define sdl-colour-set!   sdl-color-set!)
