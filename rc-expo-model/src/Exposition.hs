{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE TypeFamilies          #-}

module Exposition where

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

newtype Organization =
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

-- data ImageMediaType
--   = Svg
--   | Image
-- --   | Pdf
-- -- data TimeBasedSettings =
-- --   TimeBasedSettings
-- --     { loop     :: Bool
-- --     , autoplay :: Bool
-- --     }
-- data TimeBasedMediaType
--   = Video
--   | Audio
--   | Control
-- data SerialMediaType
--   = Text
--   | Html
-- data DataMediaType =
--   DataMedia
-- data WithMediaType a b c d
--   = Spatial a
--   | TimeBased b
--   | Serial c
--   | Data d
data MediaType
  = SVG
  | PDF
  | Image
  | Video
  | Audio
  | Text
  | Html

-- data ClassSVG =
--   ClassSVG
-- class WithPointer p where
--   type Pointer p :: *
--   type Options p :: *
--   withPointer :: p -> Pointer p -> (p, Pointer p)
--   getPointer :: (p, Pointer p) -> Pointer p
--   withOptions :: p -> Options p -> (p, Options p)
--   getOptions :: (p, Options p) -> Options p
--   withPointer = (,)
--   getPointer = snd
--   withOptions = (,)
--   getOptions = snd
-- instance WithPointer ClassSVG where
--   type Pointer ClassSVG = PercPointer
--   type Options ClassSVG = SvgOptions
-- data MyAnno mediaType =
--   {
--     media :: mediaType
--   ,
--   }
-- POINTERS
data TimePointer =
  TimePointer
    { hours        :: Int
    , minutes      :: Int
    , seconds      :: Int
    , milliseconds :: Int
    }

data PixelPointer =
  PixelPointer
    { x :: Int
    , y :: Int
    }

data PercPointer =
  PercPointer
  -- 0 to 1
    { x :: Float
    , y :: Float
    }
  deriving (Show)

data MmPointer =
  MmPointer
    { x :: Int
    , y :: Int
    }

type CharacterPointer = Int

type BytePointer = Int

type PagePointer = Int

data ChannelPointer =
  Channel
    { channel       :: Float
    , totalChannels :: Int
    }

data MediaPointer
  = SVGPointer PercPointer
  | ImagePointer PixelPointer
  | PDFPointer PagePointer (Maybe MmPointer)
  | VideoPointer TimePointer PixelPointer
  | AudioPointer TimePointer (Maybe ChannelPointer)
  | TextPointer ChannelPointer
  | HtmlPointer ChannelPointer
  | DataPointer BytePointer
  | NonSpecificPointer -- points at the whole object

--
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
    , tags        :: [Tag]
    , sets        :: [MediaSet]
    }

data Tag =
  Tag
    { title       :: T.Text
    , id          :: URL -- e.g. http://researchcatalogue.net/tag/123
    , description :: T.Text
    , vocabulary  :: URL
    }

data MediaSet =
  MediaSet
    { title       :: T.Text
    , id          :: URL -- e.g. http://researchcatalogue.net/set/123
    , description :: T.Text
    }

data MediaAnnotationType
  = Reference
  | Description
  | Comment
  | Realization
  | Representation

data ToolAnnotationType
  = After
  | Before
  | Contains
  | LeftOf
  | RightOf
  | Link
  | OnHover

data WithAnnotation objectType annoType =
  Annotation
    { subject   :: (objectType, MediaPointer)
    , predicate :: annoType
    , object    :: (objectType, MediaPointer)
    }

data MediaAnnotation =
  MediaAnnotation Object MediaAnnotationType

data ToolAnnotation =
  ToolAnnotation Tool ToolAnnotationType

data DataSize
  = Bytes Int
  | Stream

data Citation =
  Citation CSL.Cite CSL.Reference

data Object
  = MediaObject
      { metaData  :: CoreMetaData
      , mediaType :: MediaType
      , mediaSize :: DataSize
      }
  | CitationObject Citation

data Rectangle =
  Rectangle
    { x      :: Int
    , y      :: Int
    , width  :: Int
    , height :: Int
    }

--
data Options =
    { keepAscpectRation :: Bool
    , 
    }

data DisplayProperties
  = CSSClass T.Text
  | Dimensions Rectangle
  | GridCell Rectangle

data Tool =
  ObjectTool
    { mediaObject :: Object
    , display     :: [DisplayProperties]
    }
  -- TODO list of tool, appearances of objects on page
-- belong to tools
--   | Shape
--  | Dependency
-- record everything
-- data Shape =
-- Containers
