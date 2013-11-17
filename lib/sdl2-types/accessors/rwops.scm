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


(export %sdl-rwops-size
        %sdl-rwops-seek
        %sdl-rwops-read
        %sdl-rwops-write
        %sdl-rwops-close
        sdl-rwops-type)

(define-nonuniform-struct-accessors
  type: SDL_RWops*
  fields: ((((function Sint64 (SDL_RWops*)) size)
            get: %sdl-rwops-size)
           (((function Sint64 (SDL_RWops* Sint64 int)) seek)
            get: %sdl-rwops-seek)
           (((function size_t (SDL_RWops* c-pointer size_t size_t)) read)
            get: %sdl-rwops-read)
           (((function size_t (SDL_RWops* c-pointer size_t size_t)) write)
            get: %sdl-rwops-write)
           (((function int (SDL_RWops*)) close)
            get: %sdl-rwops-close)
           ((Uint32 type)
            get: sdl-rwops-type)))
