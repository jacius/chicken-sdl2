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


(export SDL_AudioInit
        SDL_AudioQuit

        SDL_GetAudioDeviceName
        SDL_GetAudioDeviceStatus
        SDL_GetAudioDriver
        SDL_GetAudioStatus
        SDL_GetCurrentAudioDriver
        SDL_GetNumAudioDevices
        SDL_GetNumAudioDrivers

        SDL_OpenAudioDevice
        SDL_CloseAudioDevice
        SDL_PauseAudioDevice
        SDL_LockAudioDevice
        SDL_UnlockAudioDevice

        SDL_BuildAudioCVT
        SDL_ConvertAudio

        SDL_LoadWAV
        ;; SDL_LoadWAV_RW
        SDL_FreeWAV

        SDL_MixAudio
        SDL_MixAudioFormat

        ;; legacy
        SDL_OpenAudio
        SDL_CloseAudio
        SDL_PauseAudio
        SDL_LockAudio
        SDL_UnlockAudio)


(define-function-binding SDL_AudioInit
  return: (int zero-if-success)
  args: ((c-string driver-name)))

(define-function-binding SDL_AudioQuit)


(define-function-binding SDL_GetAudioDeviceName
  return: (c-string device-name-or-null)
  args: ((int index)
         (int iscapture)))

(define-function-binding SDL_GetAudioDeviceStatus
  return: (SDL_AudioStatus status)
  args: ((SDL_AudioDeviceID dev)))

(define-function-binding SDL_GetAudioDriver
  return: (c-string driver-name-or-null)
  args: ((int index)))

(define-function-binding SDL_GetAudioStatus
  return: (SDL_AudioStatus status))

(define-function-binding SDL_GetCurrentAudioDriver
  return: (c-string driver-name-or-null))

(define-function-binding SDL_GetNumAudioDevices
  return: (int num-devices)
  args: ((int iscapture)))

(define-function-binding SDL_GetNumAudioDrivers
  return: (int num-drivers))


(define-function-binding SDL_OpenAudioDevice
  return: (SDL_AudioDeviceID device-id)
  args: ((c-string device)
         (int iscapture)
         (SDL_AudioSpec* desired-in-out)
         (SDL_AudioSpec* obtained-out)
         (int allowed-changes)))

(define-function-binding SDL_CloseAudioDevice
  args: ((SDL_AudioDeviceID dev)))

(define-function-binding SDL_PauseAudioDevice
  args: ((SDL_AudioDeviceID dev)
         (int pause-on)))

(define-function-binding SDL_LockAudioDevice
  args: ((SDL_AudioDeviceID dev)))

(define-function-binding SDL_UnlockAudioDevice
  args: ((SDL_AudioDeviceID dev)))


(define-function-binding SDL_BuildAudioCVT
  return: (int status)
  args: ((SDL_AudioCVT* cvt-out)
         (SDL_AudioFormat src-format)
         (Uint8 src-channels)
         (int src-rate)
         (SDL_AudioFormat dst-format)
         (Uint8 dst-channels)
         (int dst-rate)))

(define-function-binding SDL_ConvertAudio
  return: (int zero-if-success)
  args: ((SDL_AudioCVT* cvt)))


(define-function-binding SDL_LoadWAV
  return: (SDL_AudioSpec* actual-spec-or-null)
  args: ((c-string file)
         (SDL_AudioSpec* desired-spec)
         ((c-pointer Uint8*) audio-buf-out)
         (Uint32* audio-len-out)))

;; (define-function-binding SDL_LoadWAV_RW
;;   return: (SDL_AudioSpec* actual-spec-or-null)
;;   args: ((SDL_RWops* file)
;;          (int freesrc)
;;          (SDL_AudioSpec* desired-spec)
;;          ((c-pointer Uint8*) audio-buf-out)
;;          (Uint32* audio-len-out)))

(define-function-binding SDL_FreeWAV
  args: ((Uint8* audio-buf)))


(define-function-binding SDL_MixAudio
  args: ((Uint8* dst-out)
         (Uint8* src)
         (Uint32 len)
         (int volume)))

(define-function-binding SDL_MixAudioFormat
  args: ((Uint8* dst-out)
         (Uint8* src)
         (SDL_AudioFormat desired-format)
         (Uint32 len)
         (int volume)))


(define-function-binding SDL_OpenAudio
  return: (int zero-if-success)
  args: ((SDL_AudioSpec* desired-in-out)
         (SDL_AudioSpec* obtained-out)))

(define-function-binding SDL_CloseAudio)

(define-function-binding SDL_PauseAudio
  args: ((int pause-on)))

(define-function-binding SDL_LockAudio)

(define-function-binding SDL_UnlockAudio)
