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


(export sdl-keysym-scancode
        %sdl-keysym-scancode-set!
        sdl-keysym-sym
        %sdl-keysym-sym-set!
        sdl-keysym-mod
        %sdl-keysym-mod-set!
        sdl-keysym-mod->list)

(define-nonuniform-struct-accessors
  type: SDL_Keysym*
  fields: (((SDL_Scancode scancode)
            get: sdl-keysym-scancode
            set: %sdl-keysym-scancode-set!)
           ((SDL_Keycode sym)
            get: sdl-keysym-sym
            set: %sdl-keysym-sym-set!)
           ((Uint16 mod)
            get: sdl-keysym-mod
            set: %sdl-keysym-mod-set!)))

(define (sdl-keysym-mod->list keysym)
  (masks->list (sdl-keysym-mod keysym)
               (list KMOD_SHIFT  KMOD_LSHIFT  KMOD_RSHIFT
                     KMOD_CTRL   KMOD_LCTRL   KMOD_RCTRL
                     KMOD_ALT    KMOD_LALT    KMOD_RALT
                     KMOD_GUI    KMOD_LGUI    KMOD_RGUI
                     KMOD_NUM    KMOD_CAPS    KMOD_MODE)))

(define-record-printer (sdl-keysym keysym out)
  (%displayify out
               "#<sdl-keysym "
               "scancode: " (sdl-scancode-name (sdl-keysym-scancode keysym))
               " sym: " (sdl-keycode-name (sdl-keysym-sym keysym))
               " mod: " (map sdl-keymod-name (sdl-keysym-mod->list keysym))
               ">"))
