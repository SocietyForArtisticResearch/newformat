{-# LANGUAGE DataKinds                  #-}
{-# LANGUAGE DeriveDataTypeable         #-}
{-# LANGUAGE DeriveGeneric              #-}
{-# LANGUAGE DeriveTraversable          #-}
{-# LANGUAGE FlexibleContexts           #-}
{-# LANGUAGE FlexibleInstances          #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE RecordWildCards            #-}
{-# LANGUAGE TypeFamilies               #-}
{-# LANGUAGE TypeOperators              #-}
{-# LANGUAGE ViewPatterns               #-}
{-# OPTIONS_GHC
-fno-warn-unused-binds -fno-warn-unused-imports -freduction-depth=328 #-}

module MediaRepository.API
  -- * Client and Server
  ( Config(..)
  , MediaRepositoryBackend(..)
  , createMediaRepositoryClient
  , runMediaRepositoryServer
  , runMediaRepositoryMiddlewareServer
  , runMediaRepositoryClient
  , runMediaRepositoryClientWithManager
  , callMediaRepository
  , MediaRepositoryClient
  , MediaRepositoryClientError(..)
  -- ** Servant
  , MediaRepositoryAPI
  ) where

import           MediaRepository.Types

import           Control.Monad.Catch                (Exception, MonadThrow, throwM)
import           Control.Monad.Except               (ExceptT, runExceptT)
import           Control.Monad.IO.Class
import           Control.Monad.Trans.Reader         (ReaderT (..))
import           Data.Aeson                         (Value)
import           Data.Coerce                        (coerce)
import           Data.Data                          (Data)
import           Data.Function                      ((&))
import qualified Data.Map                           as Map
import           Data.Monoid                        ((<>))
import           Data.Proxy                         (Proxy (..))
import           Data.Set                           (Set)
import           Data.Text                          (Text)
import qualified Data.Text                          as T
import           Data.Time
import           Data.UUID                          (UUID)
import           GHC.Exts                           (IsString (..))
import           GHC.Generics                       (Generic)
import           Network.HTTP.Client                (Manager, newManager)
import           Network.HTTP.Client.TLS            (tlsManagerSettings)
import           Network.HTTP.Types.Method          (methodOptions)
import           Network.Wai                        (Middleware)
import qualified Network.Wai.Handler.Warp           as Warp
import           Servant                            (ServerError, serve)
import           Servant.API
import           Servant.API.Verbs                  (StdMethod (..), Verb)
import           Servant.Client                     (ClientEnv, Scheme (Http), ClientError, client,
                                                     mkClientEnv, parseBaseUrl)
import           Servant.Client.Core                (baseUrlPort, baseUrlHost)
import           Servant.Client.Internal.HttpClient (ClientM (..))
import           Servant.Server                     (Handler (..), Application)
import           Servant.Server.StaticFiles         (serveDirectoryFileServer)
import           Web.FormUrlEncoded
import           Web.HttpApiData



data FormPutMediaFile = FormPutMediaFile
  { putMediaFileFile :: FilePath
  } deriving (Show, Eq, Generic, Data)

instance FromForm FormPutMediaFile
instance ToForm FormPutMediaFile

data FormPutMediaImportDoc = FormPutMediaImportDoc
  { putMediaImportDocFile :: FilePath
  } deriving (Show, Eq, Generic, Data)

instance FromForm FormPutMediaImportDoc
instance ToForm FormPutMediaImportDoc

data FormPutMediaImportFolder = FormPutMediaImportFolder
  { putMediaImportFolderFilename :: [FilePath]
  } deriving (Show, Eq, Generic, Data)

instance FromForm FormPutMediaImportFolder
instance ToForm FormPutMediaImportFolder


-- | List of elements parsed from a query.
newtype QueryList (p :: CollectionFormat) a = QueryList
  { fromQueryList :: [a]
  } deriving (Functor, Applicative, Monad, Foldable, Traversable)

-- | Formats in which a list can be encoded into a HTTP path.
data CollectionFormat
  = CommaSeparated -- ^ CSV format for multiple parameters.
  | SpaceSeparated -- ^ Also called "SSV"
  | TabSeparated -- ^ Also called "TSV"
  | PipeSeparated -- ^ `value1|value2|value2`
  | MultiParamArray -- ^ Using multiple GET parameters, e.g. `foo=bar&foo=baz`. Only for GET params.

instance FromHttpApiData a => FromHttpApiData (QueryList 'CommaSeparated a) where
  parseQueryParam = parseSeparatedQueryList ','

instance FromHttpApiData a => FromHttpApiData (QueryList 'TabSeparated a) where
  parseQueryParam = parseSeparatedQueryList '\t'

instance FromHttpApiData a => FromHttpApiData (QueryList 'SpaceSeparated a) where
  parseQueryParam = parseSeparatedQueryList ' '

instance FromHttpApiData a => FromHttpApiData (QueryList 'PipeSeparated a) where
  parseQueryParam = parseSeparatedQueryList '|'

instance FromHttpApiData a => FromHttpApiData (QueryList 'MultiParamArray a) where
  parseQueryParam = error "unimplemented FromHttpApiData for MultiParamArray collection format"

parseSeparatedQueryList :: FromHttpApiData a => Char -> Text -> Either Text (QueryList p a)
parseSeparatedQueryList char = fmap QueryList . mapM parseQueryParam . T.split (== char)

instance ToHttpApiData a => ToHttpApiData (QueryList 'CommaSeparated a) where
  toQueryParam = formatSeparatedQueryList ','

instance ToHttpApiData a => ToHttpApiData (QueryList 'TabSeparated a) where
  toQueryParam = formatSeparatedQueryList '\t'

instance ToHttpApiData a => ToHttpApiData (QueryList 'SpaceSeparated a) where
  toQueryParam = formatSeparatedQueryList ' '

instance ToHttpApiData a => ToHttpApiData (QueryList 'PipeSeparated a) where
  toQueryParam = formatSeparatedQueryList '|'

instance ToHttpApiData a => ToHttpApiData (QueryList 'MultiParamArray a) where
  toQueryParam = error "unimplemented ToHttpApiData for MultiParamArray collection format"

formatSeparatedQueryList :: ToHttpApiData a => Char ->  QueryList p a -> Text
formatSeparatedQueryList char = T.intercalate (T.singleton char) . map toQueryParam . fromQueryList


-- | Servant type-level API, generated from the OpenAPI spec for MediaRepository.
type MediaRepositoryAPI
    =    "keywords" :> "closed" :> Capture "keywordId" Text :> Verb 'DELETE 200 '[JSON] () -- 'deleteKeywordsClosed' route
    :<|> "predicates" :> Capture "predicateId" Text :> Verb 'DELETE 200 '[JSON] () -- 'deletePredicate' route
    :<|> "keywords" :> "closed" :> ReqBody '[JSON] VocabularyTerm :> Verb 'POST 200 '[JSON] VocabularyTerm -- 'postKeywordsClosed' route
    :<|> "predicates" :> ReqBody '[JSON] Predicate :> Verb 'POST 200 '[JSON] Predicate -- 'postPredicate' route
    :<|> "keywords" :> "closed" :> Capture "keywordId" Text :> ReqBody '[JSON] VocabularyTerm :> Verb 'PUT 200 '[JSON] () -- 'putKeywordsClosed' route
    :<|> "predicates" :> Capture "predicateId" Text :> ReqBody '[JSON] Predicate :> Verb 'PUT 200 '[JSON] () -- 'putPredicate' route
    :<|> "text-editor" :> "export" :> Capture "expositionId" Text :> QueryParam "type" Text :> Verb 'POST 200 '[JSON] FilePath -- 'postTextExpositionExport' route
    :<|> "text-editor" :> "page" :> Capture "expositionId" Text :> Verb 'POST 200 '[JSON] TextExpositionPage -- 'postTextPage' route
    :<|> "media" :> "index" :> "public" :> Verb 'GET 200 '[JSON] [MediaRecord] -- 'getPublicMediaIndex' route
    :<|> "connection" :> Capture "connectionId" Text :> Verb 'DELETE 200 '[JSON] () -- 'deleteConnection' route
    :<|> "keywords" :> "open" :> Capture "openKeywordId" Text :> Verb 'DELETE 200 '[JSON] () -- 'deleteKeywordsOpen' route
    :<|> "tags" :> Capture "tagId" Text :> Verb 'DELETE 200 '[JSON] () -- 'deleteTag' route
    :<|> "media" :> Capture "mediaId" Text :> "connections" :> Verb 'GET 200 '[JSON] [Connection] -- 'getConnections' route
    :<|> "keywords" :> "closed" :> Verb 'GET 200 '[JSON] [VocabularyTerm] -- 'getKeywordsClosed' route
    :<|> "keywords" :> "open" :> QueryParam "startingWith" Text :> QueryParam "limit" Int :> Verb 'GET 200 '[JSON] [OpenVocabularyTerm] -- 'getKeywordsOpen' route
    :<|> "licenses" :> Verb 'GET 200 '[JSON] [License] -- 'getLicenses' route
    :<|> "media" :> Capture "mediaId" Text :> Verb 'GET 200 '[JSON] MediaRecord -- 'getMedia' route
    :<|> "media" :> Capture "mediaId" Text :> "children" :> Verb 'GET 200 '[JSON] [MediaRecord] -- 'getMediaChildren' route
    :<|> "media" :> Capture "mediaId" Text :> "file" :> Verb 'GET 200 '[JSON] Text -- 'getMediaFile' route
    :<|> "media" :> "index" :> Verb 'GET 200 '[JSON] [MediaRecord] -- 'getMediaIndex' route
    :<|> "media" :> Capture "mediaId" Text :> "thumb" :> Verb 'GET 200 '[JSON] FilePath -- 'getMediaThumb' route
    :<|> "predicates" :> Verb 'GET 200 '[JSON] [Predicate] -- 'getPredicates' route
    :<|> "media" :> Capture "mediaId" Text :> "shareStatus" :> Verb 'GET 200 '[JSON] ShareStatus -- 'getShareStatus' route
    :<|> "storage" :> "usage" :> Verb 'GET 200 '[JSON] StorageUsage -- 'getStorageUsage' route
    :<|> "tags" :> Verb 'GET 200 '[JSON] [OpenVocabularyTerm] -- 'getTags' route
    :<|> "text-editor" :> Capture "expositionId" Text :> Verb 'GET 200 '[JSON] TextExposition -- 'getTextExposition' route
    :<|> "types" :> Verb 'GET 200 '[JSON] [Text] -- 'getTypes' route
    :<|> "types" :> "schema" :> Capture "schemaId" Text :> Verb 'GET 200 '[JSON] Value -- 'getTypesSchema' route
    :<|> "media" :> Capture "mediaId" Text :> Verb 'DELETE 200 '[JSON] () -- 'mediaMediaIdDelete' route
    :<|> "media" :> "search" :> ReqBody '[JSON] SearchRequest :> Verb 'POST 200 '[JSON] [MediaRecord] -- 'mediaSearchPost' route
    :<|> "connection" :> ReqBody '[JSON] Connection :> Verb 'POST 200 '[JSON] () -- 'postConnection' route
    :<|> "keywords" :> "open" :> ReqBody '[JSON] Text :> Verb 'POST 200 '[JSON] OpenVocabularyTerm -- 'postKeywordsOpen' route
    :<|> "media" :> ReqBody '[JSON] MediaRecord :> Verb 'POST 200 '[JSON] MediaRecord -- 'postMedia' route
    :<|> "tags" :> ReqBody '[JSON] Text :> Verb 'POST 200 '[JSON] OpenVocabularyTerm -- 'postTag' route
    :<|> "connection" :> Capture "connectionId" Text :> ReqBody '[JSON] Connection :> Verb 'PUT 200 '[JSON] () -- 'putConnection' route
    :<|> "media" :> Capture "mediaId" Text :> ReqBody '[JSON] MediaRecord :> Verb 'PUT 200 '[JSON] MediaRecord -- 'putMedia' route
    :<|> "media" :> Capture "mediaId" Text :> "file" :> ReqBody '[FormUrlEncoded] FormPutMediaFile :> Verb 'PUT 200 '[JSON] () -- 'putMediaFile' route
    :<|> "media" :> Capture "mediaId" Text :> "import" :> "doc" :> ReqBody '[FormUrlEncoded] FormPutMediaImportDoc :> Verb 'PUT 200 '[JSON] MediaRecord -- 'putMediaImportDoc' route
    :<|> "media" :> Capture "mediaId" Text :> "import" :> "folder" :> ReqBody '[FormUrlEncoded] FormPutMediaImportFolder :> Verb 'PUT 200 '[JSON] MediaRecord -- 'putMediaImportFolder' route
    :<|> "media" :> Capture "mediaId" Text :> "thumb" :> ReqBody '[JSON] FilePath :> Verb 'PUT 200 '[JSON] () -- 'putMediaThumb' route
    :<|> "media" :> Capture "mediaId" Text :> "shareStatus" :> ReqBody '[JSON] ShareStatus :> Verb 'PUT 200 '[JSON] ShareStatus -- 'putShareStatus' route
    :<|> "text-editor" :> Capture "expositionId" Text :> ReqBody '[JSON] TextExposition :> Verb 'PUT 200 '[JSON] TextExposition -- 'putTextExposition' route
    :<|> Raw 


-- | Server or client configuration, specifying the host and port to query or serve on.
data Config = Config
  { configUrl :: String  -- ^ scheme://hostname:port/path, e.g. "http://localhost:8080/"
  } deriving (Eq, Ord, Show, Read)


-- | Custom exception type for our errors.
newtype MediaRepositoryClientError = MediaRepositoryClientError ClientError
  deriving (Show, Exception)
-- | Configuration, specifying the full url of the service.


-- | Backend for MediaRepository.
-- The backend can be used both for the client and the server. The client generated from the MediaRepository OpenAPI spec
-- is a backend that executes actions by sending HTTP requests (see @createMediaRepositoryClient@). Alternatively, provided
-- a backend, the API can be served using @runMediaRepositoryMiddlewareServer@.
data MediaRepositoryBackend m = MediaRepositoryBackend
  { deleteKeywordsClosed :: Text -> m (){- ^  -}
  , deletePredicate :: Text -> m (){- ^  -}
  , postKeywordsClosed :: VocabularyTerm -> m VocabularyTerm{- ^  -}
  , postPredicate :: Predicate -> m Predicate{- ^  -}
  , putKeywordsClosed :: Text -> VocabularyTerm -> m (){- ^  -}
  , putPredicate :: Text -> Predicate -> m (){- ^  -}
  , postTextExpositionExport :: Text -> Maybe Text -> m FilePath{- ^  -}
  , postTextPage :: Text -> m TextExpositionPage{- ^  -}
  , getPublicMediaIndex :: m [MediaRecord]{- ^  -}
  , deleteConnection :: Text -> m (){- ^  -}
  , deleteKeywordsOpen :: Text -> m (){- ^  -}
  , deleteTag :: Text -> m (){- ^  -}
  , getConnections :: Text -> m [Connection]{- ^  -}
  , getKeywordsClosed :: m [VocabularyTerm]{- ^  -}
  , getKeywordsOpen :: Maybe Text -> Maybe Int -> m [OpenVocabularyTerm]{- ^  -}
  , getLicenses :: m [License]{- ^ Licenses are retrieved from 'https://voc.uni-ak.ac.at/skosmos/licenses/en/page/?uri=http://base.uni-ak.ac.at/portfolio/licenses/CC-BY-NC-SA-4.0' -}
  , getMedia :: Text -> m MediaRecord{- ^  -}
  , getMediaChildren :: Text -> m [MediaRecord]{- ^  -}
  , getMediaFile :: Text -> m Text{- ^  -}
  , getMediaIndex :: m [MediaRecord]{- ^ Get all media accessible to user based on id. User is is derived from token.  -}
  , getMediaThumb :: Text -> m FilePath{- ^  -}
  , getPredicates :: m [Predicate]{- ^  -}
  , getShareStatus :: Text -> m ShareStatus{- ^  -}
  , getStorageUsage :: m StorageUsage{- ^  -}
  , getTags :: m [OpenVocabularyTerm]{- ^  -}
  , getTextExposition :: Text -> m TextExposition{- ^  -}
  , getTypes :: m [Text]{- ^  -}
  , getTypesSchema :: Text -> m Value{- ^  -}
  , mediaMediaIdDelete :: Text -> m (){- ^ Deletes a media record and also the respective share status object. It cannot be deleted if media record is used in exposition. Connections to other entities should be removed. -}
  , mediaSearchPost :: SearchRequest -> m [MediaRecord]{- ^  -}
  , postConnection :: Connection -> m (){- ^  -}
  , postKeywordsOpen :: Text -> m OpenVocabularyTerm{- ^  -}
  , postMedia :: MediaRecord -> m MediaRecord{- ^ Upload a media file, providing the required fields returns the id of the media. A ShareStatus object is created automatically for this media record. -}
  , postTag :: Text -> m OpenVocabularyTerm{- ^  -}
  , putConnection :: Text -> Connection -> m (){- ^  -}
  , putMedia :: Text -> MediaRecord -> m MediaRecord{- ^ Every time the text of a media record is edited or created, the markdown has to be parsed to recompute relationships between that markdown and the media records it references through !{} notation.  -}
  , putMediaFile :: Text -> FormPutMediaFile -> m (){- ^  -}
  , putMediaImportDoc :: Text -> FormPutMediaImportDoc -> m MediaRecord{- ^  -}
  , putMediaImportFolder :: Text -> FormPutMediaImportFolder -> m MediaRecord{- ^  -}
  , putMediaThumb :: Text -> FilePath -> m (){- ^  -}
  , putShareStatus :: Text -> ShareStatus -> m ShareStatus{- ^  -}
  , putTextExposition :: Text -> TextExposition -> m TextExposition{- ^  -}
  }

newtype MediaRepositoryClient a = MediaRepositoryClient
  { runClient :: ClientEnv -> ExceptT ClientError IO a
  } deriving Functor

instance Applicative MediaRepositoryClient where
  pure x = MediaRepositoryClient (\_ -> pure x)
  (MediaRepositoryClient f) <*> (MediaRepositoryClient x) =
    MediaRepositoryClient (\env -> f env <*> x env)

instance Monad MediaRepositoryClient where
  (MediaRepositoryClient a) >>= f =
    MediaRepositoryClient (\env -> do
      value <- a env
      runClient (f value) env)

instance MonadIO MediaRepositoryClient where
  liftIO io = MediaRepositoryClient (\_ -> liftIO io)

createMediaRepositoryClient :: MediaRepositoryBackend MediaRepositoryClient
createMediaRepositoryClient = MediaRepositoryBackend{..}
  where
    ((coerce -> deleteKeywordsClosed) :<|>
     (coerce -> deletePredicate) :<|>
     (coerce -> postKeywordsClosed) :<|>
     (coerce -> postPredicate) :<|>
     (coerce -> putKeywordsClosed) :<|>
     (coerce -> putPredicate) :<|>
     (coerce -> postTextExpositionExport) :<|>
     (coerce -> postTextPage) :<|>
     (coerce -> getPublicMediaIndex) :<|>
     (coerce -> deleteConnection) :<|>
     (coerce -> deleteKeywordsOpen) :<|>
     (coerce -> deleteTag) :<|>
     (coerce -> getConnections) :<|>
     (coerce -> getKeywordsClosed) :<|>
     (coerce -> getKeywordsOpen) :<|>
     (coerce -> getLicenses) :<|>
     (coerce -> getMedia) :<|>
     (coerce -> getMediaChildren) :<|>
     (coerce -> getMediaFile) :<|>
     (coerce -> getMediaIndex) :<|>
     (coerce -> getMediaThumb) :<|>
     (coerce -> getPredicates) :<|>
     (coerce -> getShareStatus) :<|>
     (coerce -> getStorageUsage) :<|>
     (coerce -> getTags) :<|>
     (coerce -> getTextExposition) :<|>
     (coerce -> getTypes) :<|>
     (coerce -> getTypesSchema) :<|>
     (coerce -> mediaMediaIdDelete) :<|>
     (coerce -> mediaSearchPost) :<|>
     (coerce -> postConnection) :<|>
     (coerce -> postKeywordsOpen) :<|>
     (coerce -> postMedia) :<|>
     (coerce -> postTag) :<|>
     (coerce -> putConnection) :<|>
     (coerce -> putMedia) :<|>
     (coerce -> putMediaFile) :<|>
     (coerce -> putMediaImportDoc) :<|>
     (coerce -> putMediaImportFolder) :<|>
     (coerce -> putMediaThumb) :<|>
     (coerce -> putShareStatus) :<|>
     (coerce -> putTextExposition) :<|>
     _) = client (Proxy :: Proxy MediaRepositoryAPI)

-- | Run requests in the MediaRepositoryClient monad.
runMediaRepositoryClient :: Config -> MediaRepositoryClient a -> ExceptT ClientError IO a
runMediaRepositoryClient clientConfig cl = do
  manager <- liftIO $ newManager tlsManagerSettings
  runMediaRepositoryClientWithManager manager clientConfig cl

-- | Run requests in the MediaRepositoryClient monad using a custom manager.
runMediaRepositoryClientWithManager :: Manager -> Config -> MediaRepositoryClient a -> ExceptT ClientError IO a
runMediaRepositoryClientWithManager manager Config{..} cl = do
  url <- parseBaseUrl configUrl
  runClient cl $ mkClientEnv manager url

-- | Like @runClient@, but returns the response or throws
--   a MediaRepositoryClientError
callMediaRepository
  :: (MonadIO m, MonadThrow m)
  => ClientEnv -> MediaRepositoryClient a -> m a
callMediaRepository env f = do
  res <- liftIO $ runExceptT $ runClient f env
  case res of
    Left err       -> throwM (MediaRepositoryClientError err)
    Right response -> pure response


requestMiddlewareId :: Application -> Application
requestMiddlewareId a = a

-- | Run the MediaRepository server at the provided host and port.
runMediaRepositoryServer
  :: (MonadIO m, MonadThrow m)
  => Config -> MediaRepositoryBackend (ExceptT ServerError IO) -> m ()
runMediaRepositoryServer config backend = runMediaRepositoryMiddlewareServer config requestMiddlewareId backend

-- | Run the MediaRepository server at the provided host and port.
runMediaRepositoryMiddlewareServer
  :: (MonadIO m, MonadThrow m)
  => Config -> Middleware -> MediaRepositoryBackend (ExceptT ServerError IO) -> m ()
runMediaRepositoryMiddlewareServer Config{..} middleware backend = do
  url <- parseBaseUrl configUrl
  let warpSettings = Warp.defaultSettings
        & Warp.setPort (baseUrlPort url)
        & Warp.setHost (fromString $ baseUrlHost url)
  liftIO $ Warp.runSettings warpSettings $ middleware $ serve (Proxy :: Proxy MediaRepositoryAPI) (serverFromBackend backend)
  where
    serverFromBackend MediaRepositoryBackend{..} =
      (coerce deleteKeywordsClosed :<|>
       coerce deletePredicate :<|>
       coerce postKeywordsClosed :<|>
       coerce postPredicate :<|>
       coerce putKeywordsClosed :<|>
       coerce putPredicate :<|>
       coerce postTextExpositionExport :<|>
       coerce postTextPage :<|>
       coerce getPublicMediaIndex :<|>
       coerce deleteConnection :<|>
       coerce deleteKeywordsOpen :<|>
       coerce deleteTag :<|>
       coerce getConnections :<|>
       coerce getKeywordsClosed :<|>
       coerce getKeywordsOpen :<|>
       coerce getLicenses :<|>
       coerce getMedia :<|>
       coerce getMediaChildren :<|>
       coerce getMediaFile :<|>
       coerce getMediaIndex :<|>
       coerce getMediaThumb :<|>
       coerce getPredicates :<|>
       coerce getShareStatus :<|>
       coerce getStorageUsage :<|>
       coerce getTags :<|>
       coerce getTextExposition :<|>
       coerce getTypes :<|>
       coerce getTypesSchema :<|>
       coerce mediaMediaIdDelete :<|>
       coerce mediaSearchPost :<|>
       coerce postConnection :<|>
       coerce postKeywordsOpen :<|>
       coerce postMedia :<|>
       coerce postTag :<|>
       coerce putConnection :<|>
       coerce putMedia :<|>
       coerce putMediaFile :<|>
       coerce putMediaImportDoc :<|>
       coerce putMediaImportFolder :<|>
       coerce putMediaThumb :<|>
       coerce putShareStatus :<|>
       coerce putTextExposition :<|>
       serveDirectoryFileServer "static")
