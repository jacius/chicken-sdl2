
;;; This module contains raw bindings to a subset of SDL2. These are
;;; not really meant to be used directly. Instead they should be
;;; wrapped in a nicer, more idiomatic interface in the sdl2 module.

(module sdl2-raw ()

(import scheme chicken foreign)
(require-extension sdl2-record-types)

(foreign-declare "#include \"SDL.h\"")
(foreign-declare "#include \"SDL_syswm.h\"")

(include "lib/raw/foreign-types.scm")

(include "lib/raw/helpers.scm")
(include "lib/raw/general.scm")
(include "lib/raw/video-display-mode.scm")
(include "lib/raw/window.scm")
(include "lib/raw/gl.scm")

)
