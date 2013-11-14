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


(module sdl2 ()

(import scheme chicken foreign)
(use srfi-1 srfi-4 extras lolevel)
(require-extension sdl2-types sdl2-raw)

(foreign-declare "#include \"SDL.h\"")
(foreign-declare "#include \"SDL_syswm.h\"")

(include "lib/util.scm")

;;; Foreign type definitions aren't exported from modules, so we need
;;; to define the same foreign types in each module that uses them.
(include "lib/sdl2-types/foreign-types.scm")

(include "lib/sdl2/general.scm")
(include "lib/sdl2/window.scm")

)
