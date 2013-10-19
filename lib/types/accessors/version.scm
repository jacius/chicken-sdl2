
(export make-sdl-version
        sdl-version-major
        sdl-version-minor
        sdl-version-patch
        sdl-version->list)

(define-record-printer (sdl-version v out)
  (%displayify out "#<sdl-version " (sdl-version->list v) ">"))

(define (make-sdl-version #!optional (major 0) (minor 0) (patch 0))
  (assert (<= 0 major 255))
  (assert (<= 0 minor 255))
  (assert (<= 0 patch 255))
  (%wrap-sdl-version (u8vector major minor patch)))

(define-foreign-struct SDL_version*
  (unsigned-int8 major sdl-version-major)
  (unsigned-int8 minor sdl-version-minor)
  (unsigned-int8 patch sdl-version-patch))

(define (sdl-version->list v)
  (u8vector->list (%sdl-version-data v)))
