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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; CURSOR

(export sdl-cursor?
        %wrap-sdl-cursor
        %sdl-cursor-pointer
        %sdl-cursor-pointer-set!)

(define-record-type sdl-cursor
  (%wrap-sdl-cursor pointer)
  sdl-cursor?
  (pointer %sdl-cursor-pointer %sdl-cursor-pointer-set!))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; JOYSTICK

(export sdl-joystick?
        %wrap-sdl-joystick
        %sdl-joystick-pointer
        %sdl-joystick-pointer-set!)

(define-record-type sdl-joystick
  (%wrap-sdl-joystick pointer)
  sdl-joystick?
  (pointer %sdl-joystick-pointer %sdl-joystick-pointer-set!))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; JOYSTICK GUID

(export sdl-joystick-guid?
        %wrap-sdl-joystick-guid
        %sdl-joystick-guid-data
        %sdl-joystick-guid-data-set!
        %alloc-sdl-joystick-guid
        %sdl-joystick-guid->SDL_JoystickGUID*
        %SDL_JoystickGUID*->sdl-joystick-guid)

(define-record-type sdl-joystick-guid
  (%wrap-sdl-joystick-guid data)
  sdl-joystick-guid?
  (data %sdl-joystick-guid-data %sdl-joystick-guid-data-set!))

(define (%alloc-sdl-joystick-guid)
  (%wrap-sdl-joystick-guid (make-u8vector 16)))

(define (%sdl-joystick-guid->SDL_JoystickGUID* joystick-guid)
  ((foreign-lambda* (c-pointer "SDL_JoystickGUID") ((u8vector data))
                    "C_return((SDL_JoystickGUID*)data);")
   (%sdl-joystick-guid-data joystick-guid)))

(define (%SDL_JoystickGUID*->sdl-joystick-guid ptr)
  (let ((new-joystick-guid (%alloc-sdl-joystick-guid)))
    ((foreign-lambda* void (((c-pointer "SDL_JoystickGUID") g) (u8vector data))
                      "*((SDL_JoystickGUID*)data) = *g;")
     ptr (%sdl-joystick-guid-data new-joystick-guid))
    new-joystick-guid))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; KEYSYM

(export sdl-keysym?
        %wrap-sdl-keysym
        %sdl-keysym-pointer
        %sdl-keysym-pointer-set!
        %sdl-keysym-data
        %sdl-keysym-data-set!

        %allocate-sdl-keysym
        %SDL_Keysym*->sdl-keysym
        %sdl-keysym->SDL_Keysym*
        %->SDL_Keysym*)

(define-record-type sdl-keysym
  (%wrap-sdl-keysym pointer data)
  sdl-keysym?
  (pointer %sdl-keysym-pointer %sdl-keysym-pointer-set!)
  (data %sdl-keysym-data %sdl-keysym-data-set!))

(define-nonuniform-struct-constructors
  for: ("SDL_Keysym"
        sdl-keysym  sdl-keysym?  %wrap-sdl-keysym
        %sdl-keysym-pointer  %sdl-keysym-pointer-set!
        %sdl-keysym-data     %sdl-keysym-data-set!)
  allocate: %allocate-sdl-keysym
  converters: (%SDL_Keysym*->sdl-keysym
               %sdl-keysym->SDL_Keysym*
               %->SDL_Keysym*))
