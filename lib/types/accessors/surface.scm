;;
;; chicken-sdl2: Chicken bindings to SDL 2 (Simple DirectMedia Layer 2)
;;
;; Copyright © 2013  John Croisant.
;; All rights reserved.
;;
;; Redistribution and use in source and binary forms, with or without
;; modification, are permitted provided that the following conditions
;; are met:
;;
;; - Redistributions of source code must retain the above copyright
;;   notice, this list of conditions and the following disclaimer.
;;
;; - Redistributions in binary form must reproduce the above copyright
;;   notice, this list of conditions and the following disclaimer in
;;   the documentation and/or other materials provided with the
;;   distribution.
;;
;; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
;; "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
;; LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
;; FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
;; COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
;; INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
;; (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
;; SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
;; HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
;; STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
;; ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
;; OF THE POSSIBILITY OF SUCH DAMAGE.


(export sdl-surface-flags
        sdl-surface-format
        sdl-surface-w
        sdl-surface-h
        sdl-surface-pitch
        %sdl-surface-pixels    %sdl-surface-pixels-set!
        %sdl-surface-userdata  %sdl-surface-userdata-set!
        sdl-surface-locked
        %sdl-surface-lock-data)

(define-nonuniform-struct-accessors
  type: SDL_Surface*
  fields: (((Uint32 flags)            get: sdl-surface-flags)
           ((SDL_PixelFormat* format) get: sdl-surface-format)
           ((int w)                   get: sdl-surface-w)
           ((int h)                   get: sdl-surface-h)
           ((int pitch)               get: sdl-surface-pitch)
           ((c-pointer pixels)        get: %sdl-surface-pixels
                                      set: %sdl-surface-pixels-set!)
           ((c-pointer userdata)      get: %sdl-surface-userdata
                                      set: %sdl-surface-userdata-set!)
           ((int locked)              get: sdl-surface-locked)
           ((c-pointer lock_data)     get: %sdl-surface-lock-data)))

;;; TODO: nice accessors for pixels and userdata?
