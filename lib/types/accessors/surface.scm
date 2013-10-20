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
