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


(export sdl-audio-spec-freq
        sdl-audio-spec-format
        sdl-audio-spec-channels
        sdl-audio-spec-silence
        sdl-audio-spec-samples
        sdl-audio-spec-padding
        sdl-audio-spec-size
        sdl-audio-spec-callback
        sdl-audio-spec-userdata

        sdl-audio-cvt-needed
        sdl-audio-cvt-src-format
        sdl-audio-cvt-dst-format
        sdl-audio-cvt-rate-incr
        sdl-audio-cvt-buf
        sdl-audio-cvt-len
        sdl-audio-cvt-len-cvt
        sdl-audio-cvt-len-mult
        sdl-audio-cvt-len-ratio
        ;; sdl-audio-cvt-filters
        sdl-audio-cvt-filter-index)

(define-nonuniform-struct-accessors
  type: SDL_AudioSpec*
  fields: (((int freq)                   get: sdl-audio-spec-freq)
           ((SDL_AudioFormat format)     get: sdl-audio-spec-format)
           ((Uint8 channels)             get: sdl-audio-spec-channels)
           ((Uint8 silence)              get: sdl-audio-spec-silence)
           ((Uint16 samples)             get: sdl-audio-spec-samples)
           ((Uint16 padding)             get: sdl-audio-spec-padding)
           ((Uint32 size)                get: sdl-audio-spec-size)
           ((SDL_AudioCallback callback) get: sdl-audio-spec-callback)
           ((c-pointer userdata)         get: sdl-audio-spec-userdata)))


(define-nonuniform-struct-accessors
  type: SDL_AudioCVT*
  fields: (((int needed)                  get: sdl-audio-cvt-needed)
           ((SDL_AudioFormat src_format)  get: sdl-audio-cvt-src-format)
           ((SDL_AudioFormat dst_format)  get: sdl-audio-cvt-dst-format)
           ((double rate_incr)            get: sdl-audio-cvt-rate-incr)
           ((Uint8* buf)                  get: sdl-audio-cvt-buf)
           ((int len)                     get: sdl-audio-cvt-len)
           ((int len_cvt)                 get: sdl-audio-cvt-len-cvt)
           ((int len_mult)                get: sdl-audio-cvt-len-mult)
           ((double len_ratio)            get: sdl-audio-cvt-len-ratio)
           ;; ((SDL_AudioFilter filters[10]) get: sdl-audio-cvt-filters)
           ((int filter_index)            get: sdl-audio-cvt-filter-index)))
