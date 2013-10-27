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


(export ;; TODO: make-sdl-pallete
        %sdl-palette-ncolors %sdl-palette-ncolors-set!
        %sdl-palette-colors %sdl-palette-colors-set!
        sdl-palette-version
        sdl-palette-refcount
        ;; TODO: sdl-palette-colors
        ;; TODO: sdl-palette-colors-set!
        ;; TODO: sdl-palette-ref
        ;; TODO: sdl-palette-ref-set!
        )

;;; TODO: make-sdl-palette that takes a vector of sdl-color instances.

(define-foreign-struct SDL_Palette*
  (int ncolors %sdl-palette-ncolors %sdl-palette-ncolors-set!)
  (c-pointer colors %sdl-palette-colors %sdl-palette-colors-set!)
  (Uint32 version sdl-palette-version)
  (int refcount sdl-palette-refcount))

;;; TODO: sdl-palette-colors and sdl-palette-colors-set! that
;;; return/take a vector of sdl-color instances.

;;; TODO: sdl-palette-ref and sdl-palette-ref-set! that access
;;; individual colors.
