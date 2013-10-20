
(module sdl2-types ()

(import scheme chicken foreign)
(use srfi-4)

(foreign-declare "#include \"SDL.h\"")
(foreign-declare "#include \"SDL_syswm.h\"")

(include "lib/helpers.scm")

;;; NOTE: The ordering of these includes is important!

;;; 1. We declare the record types so that we have the pointer
;;; wrappers/accessors.
(include "lib/types/record-types.scm")

;;; 2. We declare foreign types, which depend on the pointer wrappers.
(include "lib/types/enums.scm")
(include "lib/types/foreign-types.scm")

;;; 3. We define struct field pseudo-accessors, which depend on the
;;; foreign type definitions.
(include "lib/types/accessors.scm")

)
