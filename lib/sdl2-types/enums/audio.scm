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


(export SDL_AUDIO_BITSIZE
        SDL_AUDIO_ISFLOAT
        SDL_AUDIO_ISINT
        SDL_AUDIO_ISBIGENDIAN
        SDL_AUDIO_ISLITTLEENDIAN
        SDL_AUDIO_ISSIGNED
        SDL_AUDIO_ISUNSIGNED

        SDL_AUDIO_MASK_BITSIZE
        SDL_AUDIO_MASK_DATATYPE
        SDL_AUDIO_MASK_ENDIAN
        SDL_AUDIO_MASK_SIGNED

        SDL_MIX_MAXVOLUME

        SDL_AUDIO_ALLOW_FREQUENCY_CHANGE
        SDL_AUDIO_ALLOW_FORMAT_CHANGE
        SDL_AUDIO_ALLOW_CHANNELS_CHANGE
        SDL_AUDIO_ALLOW_ANY_CHANGE)

(define SDL_AUDIO_MASK_BITSIZE  (foreign-value "SDL_AUDIO_MASK_BITSIZE"  int))
(define SDL_AUDIO_MASK_DATATYPE (foreign-value "SDL_AUDIO_MASK_DATATYPE" int))
(define SDL_AUDIO_MASK_ENDIAN   (foreign-value "SDL_AUDIO_MASK_ENDIAN"   int))
(define SDL_AUDIO_MASK_SIGNED   (foreign-value "SDL_AUDIO_MASK_SIGNED"   int))

(define-function-binding* SDL_AUDIO_BITSIZE
  return: (Uint32 bitsize)
  args: ((Uint32 value))
  body: "C_return(SDL_AUDIO_BITSIZE(value));")

(define-function-binding* SDL_AUDIO_ISFLOAT
  return: (Uint32 isfloat)
  args: ((Uint32 value))
  body: "C_return(SDL_AUDIO_ISFLOAT(value));")

(define-function-binding* SDL_AUDIO_ISINT
  return: (Uint32 isint)
  args: ((Uint32 value))
  body: "C_return(SDL_AUDIO_ISINT(value));")

(define-function-binding* SDL_AUDIO_ISBIGENDIAN
  return: (Uint32 isbigendian)
  args: ((Uint32 value))
  body: "C_return(SDL_AUDIO_ISBIGENDIAN(value));")

(define-function-binding* SDL_AUDIO_ISLITTLEENDIAN
  return: (Uint32 islittleendian)
  args: ((Uint32 value))
  body: "C_return(SDL_AUDIO_ISLITTLEENDIAN(value));")

(define-function-binding* SDL_AUDIO_ISSIGNED
  return: (Uint32 issigned)
  args: ((Uint32 value))
  body: "C_return(SDL_AUDIO_ISSIGNED(value));")

(define-function-binding* SDL_AUDIO_ISUNSIGNED
  return: (Uint32 isunsigned)
  args: ((Uint32 value))
  body: "C_return(SDL_AUDIO_ISUNSIGNED(value));")

(define SDL_MIX_MAXVOLUME (foreign-value "SDL_MIX_MAXVOLUME" int))

(define SDL_AUDIO_ALLOW_FREQUENCY_CHANGE
  (foreign-value "SDL_AUDIO_ALLOW_FREQUENCY_CHANGE" int))
(define SDL_AUDIO_ALLOW_FORMAT_CHANGE
  (foreign-value "SDL_AUDIO_ALLOW_FORMAT_CHANGE"    int))
(define SDL_AUDIO_ALLOW_CHANNELS_CHANGE
  (foreign-value "SDL_AUDIO_ALLOW_CHANNELS_CHANGE"  int))
(define SDL_AUDIO_ALLOW_ANY_CHANGE
  (foreign-value "SDL_AUDIO_ALLOW_ANY_CHANGE"       int))


(define-and-export-enum SDL_AudioFormatEnum
  AUDIO_U8
  AUDIO_S8
  AUDIO_U16LSB
  AUDIO_S16LSB
  AUDIO_U16MSB
  AUDIO_S16MSB
  AUDIO_U16
  AUDIO_S16
  AUDIO_S32LSB
  AUDIO_S32MSB
  AUDIO_S32
  AUDIO_F32LSB
  AUDIO_F32MSB
  AUDIO_F32
  AUDIO_U16SYS
  AUDIO_S16SYS
  AUDIO_S32SYS
  AUDIO_F32SYS)


(define-and-export-enum SDL_AudioStatus
  SDL_AUDIO_STOPPED
  SDL_AUDIO_PLAYING
  SDL_AUDIO_PAUSED)
