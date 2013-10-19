
(export sdl-surface-flags
        sdl-surface-format
        sdl-surface-w
        sdl-surface-h
        sdl-surface-pitch
        %sdl-surface-pixels    %sdl-surface-pixels-set!
        %sdl-surface-userdata  %sdl-surface-userdata-set!
        sdl-surface-locked
        %sdl-surface-lock-data)

(define-foreign-struct SDL_Surface*
  (unsigned-int32 flags sdl-surface-flags)  ; read-only
  (SDL_PixelFormat* format sdl-surface-format)  ; read-only
  (int w sdl-surface-w)                     ; read-only
  (int h sdl-surface-h)                     ; read-only
  (int pitch sdl-surface-pitch)             ; read-only
  (c-pointer pixels %sdl-surface-pixels         ; read-write
             %sdl-surface-pixels-set!)
  (c-pointer userdata %sdl-surface-userdata     ; read-write
             %sdl-surface-userdata-set!)
  (int locked sdl-surface-locked)           ; read-only
  (c-pointer lock_data %sdl-surface-lock-data)) ; read-only

;;; TODO: nice accessors for pixels and userdata?
