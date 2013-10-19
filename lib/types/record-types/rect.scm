
(export sdl-rect?
        %wrap-sdl-rect
        %sdl-rect-data
        %sdl-rect-data-set!
        %sdl-rect->SDL_Rect*
        %SDL_Rect*->sdl-rect)

(define-record-type sdl-rect
  (%wrap-sdl-rect data)
  sdl-rect?
  (data %sdl-rect-data %sdl-rect-data-set!))

(define (%sdl-rect->SDL_Rect* rect)
  ((foreign-lambda* (c-pointer "SDL_Rect") ((s32vector data))
                    "C_return((SDL_Rect*)data);")
   (%sdl-rect-data rect)))

(define (%SDL_Rect*->sdl-rect ptr)
  (let ((new-rect (%wrap-sdl-rect (make-s32vector 4))))
    ((foreign-lambda* void (((c-pointer "SDL_Rect") r) (s32vector data))
                      "*((SDL_Rect*)data) = *r;")
     ptr (%sdl-rect-data new-rect))
    new-rect))
