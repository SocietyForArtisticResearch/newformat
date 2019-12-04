module Exposition
  ( Person(..)
  ) where

import qualified Data.LanguageCodes as Lang
import qualified Data.List.NonEmpty as NonEmpty
import qualified Data.Text          as T
import           Data.Time
import qualified Network.URI        as URI
import qualified Text.CSL           as CSL

data Person =
  Person
    { firstname :: T.Text
    , lastname  :: T.Text
    }

data Organization =
  Organization
    { name :: T.Text
    }

data Entity
  = EntityOrg Organization
  | EntityPerson Person

newtype URL =
  URL URI.URI

data MediaResource
  = MediaRC Int
  | MediaURL URL

data SpatialMediaType
  = Svg
  | Pdf
  | Image

-- data TimeBasedSettings =
--   TimeBasedSettings
--     { loop     :: Bool
--     , autoplay :: Bool
--     }
data TimeBasedMediaType
  = Video
  | Audio
  | Control

data SerialMediaType
  = Text
  | Html

data DataMediaType =
  DataMedia

data MediaType
  = Spatial SpatialMediaType
  | TimeBased TimeBasedMediaType
  | Serial SerialMediaType
  | Data DataMediaType

data HeldLicense
  = AllRightsReserved
  | CC_BY
  | CC_BY_SA
  | CC_BY_NC
  | CC_BY_NC_SA
  | CC_BY_NC_ND

data License
  = PublicDomain
  | HeldLicense Entity

data CoreMetaData =
  CoreMetaData
    { creator     :: NonEmpty.NonEmpty Person
    , contributor :: [Person]
    , date        :: UTCTime
    , description :: T.Text
    , language    :: Lang.ISO639_1
    , license     :: License
    , tag         :: [URL] -- e.g. http://researchcatalogue.net/tag/123
    }

data AnnotationType
  = Caption
  | Reference
  | Description
  | Comment
  | Realization
  | Representation

data DataSize
  = Bytes Int
  | Stream

data Citation =
  Citation CSL.Cite CSL.Reference

data MediaObject =
  MediaObject
    { metaData  :: CoreMetaData
    , mediaType :: MediaType
    , mediaSize :: DataSize
    }
-- TODO
-- list of tool, appearances of objects on page
