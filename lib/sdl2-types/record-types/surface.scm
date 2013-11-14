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


(export sdl-surface?
        %wrap-sdl-surface
        %sdl-surface-pointer
        %sdl-surface-pointer-set!
        %sdl-surface-data
        %sdl-surface-data-set!

        allocate-sdl-surface
        %SDL_Surface*->sdl-surface
        %sdl-surface->SDL_Surface*
        %->SDL_Surface*)

(define-record-type sdl-surface
  (%wrap-sdl-surface pointer data)
  sdl-surface?
  (pointer %sdl-surface-pointer %sdl-surface-pointer-set!)
  (data %sdl-surface-data %sdl-surface-data-set!))

(define-nonuniform-struct-constructors
  for: ("SDL_Surface"
        sdl-surface  sdl-surface?  %wrap-sdl-surface
        %sdl-surface-pointer  %sdl-surface-pointer-set!
        %sdl-surface-data     %sdl-surface-data-set!)
  allocate: allocate-sdl-surface
  converters: (%SDL_Surface*->sdl-surface
               %sdl-surface->SDL_Surface*
               %->SDL_Surface*))
