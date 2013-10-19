
(export sdl-version?
        %wrap-sdl-version
        %sdl-version-data
        %sdl-version-data-set!
        %sdl-version->SDL_version*
        %SDL_version*->sdl-version)

(define-record-type sdl-version
  (%wrap-sdl-version data)
  sdl-version?
  (data %sdl-version-data %sdl-version-data-set!))

(define (%sdl-version->SDL_version* version)
  ((foreign-lambda* (c-pointer "SDL_version") ((u8vector data))
                    "C_return((SDL_version*)data);")
   (%sdl-version-data version)))

(define (%SDL_version*->sdl-version ptr)
  (let ((new-version (%wrap-sdl-version (make-u8vector 3))))
    ((foreign-lambda* void (((c-pointer "SDL_version") v) (u8vector data))
                      "*((SDL_version*)data) = *v;")
     ptr (%sdl-version-data new-version))
    new-version))
