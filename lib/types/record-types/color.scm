
(export sdl-color?
        %wrap-sdl-color
        %sdl-color-data
        %sdl-color-data-set!
        %sdl-color->SDL_Color*
        %SDL_Color*->sdl-color)

(define-record-type sdl-color
  (%wrap-sdl-color data)
  sdl-color?
  (data %sdl-color-data %sdl-color-data-set!))

(define (%sdl-color->SDL_Color* color)
  ((foreign-lambda* (c-pointer "SDL_Color") ((u8vector data))
                    "C_return((SDL_Color*)data);")
   (%sdl-color-data color)))

(define (%SDL_Color*->sdl-color ptr)
  (let ((new-color (%wrap-sdl-color (make-u8vector 4))))
    ((foreign-lambda* void (((c-pointer "SDL_Color") c) (u8vector data))
                      "*((SDL_Color*)data) = *c;")
     ptr (%sdl-color-data new-color))
    new-color))
