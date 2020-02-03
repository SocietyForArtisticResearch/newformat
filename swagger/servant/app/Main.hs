{-# LANGUAGE RecordWildCards #-}

import MediaRepository.API
-- required dependency: wai
import Network.Wai (Middleware)
-- required dependency: wai-extra
import Network.Wai.Middleware.RequestLogger (logStdout)

-- A module you wrote yourself, containing all handlers needed for the MediaRepositoryBackend type.
-- import MediaRepository.Handlers

-- If you would like to not use any middlewares you could use runMediaRepositoryServer instead

-- Combined middlewares
requestMiddlewares :: Middleware
requestMiddlewares = logStdout

-- Run a MediaRepository server on localhost:8080
main :: IO ()
main = do
  let server = MediaRepositoryBackend{..}
      config = Config "http://localhost:8080/"
  runMediaRepositoryMiddlewareServer config requestMiddlewares server
