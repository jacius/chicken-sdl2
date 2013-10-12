
;;; This module contains raw bindings to a subset of SDL2. These are
;;; not really meant to be used directly. Instead they should be
;;; wrapped in a nicer, more idiomatic interface in the sdl2 module.

(module sdl2-raw ()

(import scheme chicken foreign)

(foreign-declare "#include \"SDL.h\"")
(include "lib/types.scm")

(include "lib/raw/helpers.scm")
(include "lib/raw/general.scm")
(include "lib/raw/video-display-mode.scm")
(include "lib/raw/window.scm")

)
