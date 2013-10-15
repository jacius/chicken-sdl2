
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; OPENGL SUPPORT

(export SDL_GL_CreateContext
        SDL_GL_DeleteContext
        SDL_GL_MakeCurrent
        SDL_GL_GetAttribute
        SDL_GL_SetAttribute
        SDL_GL_SwapWindow
        SDL_GL_GetSwapInterval
        SDL_GL_SetSwapInterval
        SDL_GL_ExtensionSupported
        SDL_GL_GetProcAddress
        SDL_GL_LoadLibrary
        SDL_GL_UnloadLibrary
        SDL_GL_BindTexture
        SDL_GL_UnbindTexture)


(define-and-export-enum SDL_GLattr
  SDL_GL_RED_SIZE
  SDL_GL_GREEN_SIZE
  SDL_GL_BLUE_SIZE
  SDL_GL_ALPHA_SIZE
  SDL_GL_BUFFER_SIZE
  SDL_GL_DOUBLEBUFFER
  SDL_GL_DEPTH_SIZE
  SDL_GL_STENCIL_SIZE
  SDL_GL_ACCUM_RED_SIZE
  SDL_GL_ACCUM_GREEN_SIZE
  SDL_GL_ACCUM_BLUE_SIZE
  SDL_GL_ACCUM_ALPHA_SIZE
  SDL_GL_STEREO
  SDL_GL_MULTISAMPLEBUFFERS
  SDL_GL_MULTISAMPLESAMPLES
  SDL_GL_ACCELERATED_VISUAL
  SDL_GL_RETAINED_BACKING
  SDL_GL_CONTEXT_MAJOR_VERSION
  SDL_GL_CONTEXT_MINOR_VERSION
  SDL_GL_CONTEXT_EGL
  SDL_GL_CONTEXT_FLAGS
  SDL_GL_CONTEXT_PROFILE_MASK
  SDL_GL_SHARE_WITH_CURRENT_CONTEXT)


(define-function-binding SDL_GL_CreateContext
  return: (SDL_GLContext* new-context)
  args: ((SDL_Window* window)))

(define-function-binding SDL_GL_DeleteContext
  args: ((SDL_GLContext* context)))

(define-function-binding SDL_GL_MakeCurrent
  return: (int zero-if-success)
  args: ((SDL_Window* window)
         (SDL_GLContext* context)))


(define-function-binding SDL_GL_GetAttribute
  return: (int zero-if-success)
  args: ((SDL_GLattr attr_id)
         ((c-pointer int) value)))

(define-function-binding SDL_GL_SetAttribute
  return: (int zero-if-success)
  args: ((SDL_GLattr attr_id)
         (int value)))


(define-function-binding SDL_GL_SwapWindow
  args: ((SDL_Window* window)))

(define-function-binding SDL_GL_GetSwapInterval
  return: (int interval))

(define-function-binding SDL_GL_SetSwapInterval
  return: (int zero-if-success)
  args: ((int interval)))


(define-function-binding SDL_GL_ExtensionSupported
  return: (bool supported?)
  args: ((c-string extension)))


(define-function-binding SDL_GL_GetProcAddress
  return: (c-pointer address)
  args: ((c-string proc)))

(define-function-binding SDL_GL_LoadLibrary
  return: (int zero-if-success)
  args: ((c-string path)))

(define-function-binding SDL_GL_UnloadLibrary)


(define-function-binding SDL_GL_BindTexture
  return: (int zero-if-success)
  args: ((SDL_Texture* texture)
         ((c-pointer float) texw)
         ((c-pointer float) texh)))

(define-function-binding SDL_GL_UnbindTexture
  return: (int zero-if-success)
  args: ((SDL_Texture* texture)))

