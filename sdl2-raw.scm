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


;;; This module contains raw bindings to a subset of SDL2. These are
;;; not really meant to be used directly. Instead they should be
;;; wrapped in a nicer, more idiomatic interface in the sdl2 module.

(module sdl2-raw ()

(import scheme chicken foreign)
(require-extension sdl2-types)

(foreign-declare "#include \"SDL.h\"")
(foreign-declare "#include \"SDL_syswm.h\"")

(include "lib/util.scm")

;;; Foreign type definitions aren't exported from modules, so we need
;;; to define the same foreign types in each module that uses them.
(include "lib/types/foreign-types.scm")

(include "lib/raw/general.scm")
(include "lib/raw/audio.scm")
(include "lib/raw/events.scm")
(include "lib/raw/gl.scm")
(include "lib/raw/joystick.scm")
(include "lib/raw/keyboard.scm")
(include "lib/raw/mouse.scm")
(include "lib/raw/pixel-format.scm")
(include "lib/raw/rect.scm")
(include "lib/raw/surface.scm")
(include "lib/raw/timer.scm")
(include "lib/raw/video-display-mode.scm")
(include "lib/raw/window.scm")

)
