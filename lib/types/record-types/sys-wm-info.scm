
(export sdl-sys-wm-info?
        %wrap-sdl-sys-wm-info
        %sdl-sys-wm-info-pointer
        %sdl-sys-wm-info-pointer-set!)

(define-record-type sdl-sys-wm-info
  (%wrap-sdl-sys-wm-info pointer)
  sdl-sys-wm-info?
  (pointer %sdl-sys-wm-info-pointer %sdl-sys-wm-info-pointer-set!))
