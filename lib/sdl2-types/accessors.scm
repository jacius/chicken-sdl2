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


(include "lib/sdl2-types/accessors/audio.scm")

(include "lib/sdl2-types/accessors/color.scm")

(include "lib/sdl2-types/accessors/input.scm")
(include "lib/sdl2-types/accessors/events.scm")

(include "lib/sdl2-types/accessors/display-mode.scm")

;;; GL-CONTEXT is an opaque pointer, so there's nothing else to define here.

(include "lib/sdl2-types/accessors/palette.scm")

(include "lib/sdl2-types/accessors/pixel-format.scm")

(include "lib/sdl2-types/accessors/rect.scm")

(include "lib/sdl2-types/accessors/surface.scm")

;;; SYS-WM-INFO is weird and I don't feel like dealing with it.

;;; TEXTURE is an opaque pointer, so there's nothing else to define here.

(include "lib/sdl2-types/accessors/version.scm")

;;; WINDOW is an opaque pointer, so there's nothing else to define here.
