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


(export make-sdl-version
        sdl-version->list
        sdl-version-set!
        sdl-version-major  sdl-version-major-set!
        sdl-version-minor  sdl-version-minor-set!
        sdl-version-patch  sdl-version-patch-set!)

(define-uniform-struct-accessors
  procs: (make-sdl-version sdl-version->list sdl-version-set!)
  fields: ((major index: 0 default: 0
                  guard: (Uint8-guard "sdl-version field major")
                  get: sdl-version-major set: sdl-version-major-set!)
           (minor index: 1 default: 0
                  guard: (Uint8-guard "sdl-version field minor")
                  get: sdl-version-minor set: sdl-version-minor-set!)
           (patch index: 2 default: 0
                  guard: (Uint8-guard "sdl-version field patch")
                  get: sdl-version-patch set: sdl-version-patch-set!))
  using: (sdl-version sdl-version?
          %wrap-sdl-version %sdl-version-data
          u8vector u8vector-ref u8vector->list))
