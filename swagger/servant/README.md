# Auto-Generated OpenAPI Bindings to `MediaRepository`

The library in `lib` provides auto-generated-from-OpenAPI bindings to the MediaRepository API.

## Installation

Installation follows the standard approach to installing Stack-based projects.

1. Install the [Haskell `stack` tool](http://docs.haskellstack.org/en/stable/README).
2. Run `stack install` to install this package.

Otherwise, if you already have a Stack project, you can include this package under the `packages` key in your `stack.yaml`:
```yaml
packages:
- location:
    git: https://github.com/yourGitOrg/yourGitRepo
    commit: somecommit
```

## Main Interface

The main interface to this library is in the `MediaRepository.API` module, which exports the MediaRepositoryBackend type. The MediaRepositoryBackend
type can be used to create and define servers and clients for the API.

## Creating a Client

A client can be created via the `createMediaRepositoryClient` function, which will generate a function for every endpoint of the API.
Then these functions can be invoked with `runMediaRepositoryClientWithManager` or more conveniently with `callMediaRepositoryClient`
(depending if you want an `Either` back or you want to catch) to access the API endpoint they refer to, if the API is served
at the `url` you specified.

For example, if `localhost:8080` is serving the MediaRepository API, you can write:

```haskell
{-# LANGUAGE RecordWildCards #-}

import MediaRepository.API as API

import           Network.HTTP.Client     (newManager)
import           Network.HTTP.Client.TLS (tlsManagerSettings)
import           Servant.Client          (ClientEnv, mkClientEnv, parseBaseUrl)


main :: IO ()
main = do
  -- Configure the BaseUrl for the client
  url <- parseBaseUrl "http://localhost:8080/"

  -- You probably want to reuse the Manager across calls, for performance reasons
  manager <- newManager tlsManagerSettings

  -- Create the client (all endpoint functions will be available)
  MediaRepositoryBackend{..} <- API.createMediaRepositoryClient

  -- Any MediaRepository API call can go here, e.g. here we call `getSomeEndpoint`
  API.callMediaRepository (mkClientEnv manager url) getSomeEndpoint
```

## Creating a Server

In order to create a server, you must use the `runMediaRepositoryMiddlewareServer` function. However, you unlike the client, in which case you *got* a `MediaRepositoryBackend`
from the library, you must instead *provide* a `MediaRepositoryBackend`. For example, if you have defined handler functions for all the
functions in `MediaRepository.Handlers`, you can write:

```haskell
{-# LANGUAGE RecordWildCards #-}

import MediaRepository.API
-- required dependency: wai
import Network.Wai (Middleware)
-- required dependency: wai-extra
import Network.Wai.Middleware.RequestLogger (logStdout)

-- A module you wrote yourself, containing all handlers needed for the MediaRepositoryBackend type.
import MediaRepository.Handlers

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
```
