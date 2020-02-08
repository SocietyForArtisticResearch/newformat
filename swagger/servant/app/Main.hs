{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}

import           MediaRepository.API
import           MediaRepository.Types
import           Network.Wai.Handler.Warp
import           Servant

-- required dependency: wai
import           Network.Wai

-- required dependency: wai-extra
import           Network.Wai.Middleware.RequestLogger (logStdout)

-- A module you wrote yourself, containing all handlers needed for the MediaRepositoryBackend type.
-- import MediaRepository.Handlers
-- If you would like to not use any middlewares you could use runMediaRepositoryServer instead
-- Combined middlewares
requestMiddlewares :: Middleware
requestMiddlewares = logStdout

-- Run a MediaRepository server on localhost:8080
main :: IO ()
main = do
  let server = MediaRepositoryBackend {..}
      config = Config "http://localhost:8080"
  putStrLn "Running RC repo server on http://localhost:8080"
  runMediaRepositoryMiddlewareServer config requestMiddlewares server
  where
    getLicenses = return [License "id" "http:.." (Just "name")]
    postKeywordsClosed k = return $ k {vocabularyTermId = (Just "assigned-id")}
    postKeywordsOpen k = return $ OpenVocabularyTerm (Just "assigned-id") k
