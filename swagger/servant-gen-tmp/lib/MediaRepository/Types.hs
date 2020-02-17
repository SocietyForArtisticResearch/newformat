{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE DeriveDataTypeable         #-}
{-# LANGUAGE DeriveGeneric              #-}
{-# OPTIONS_GHC -fno-warn-unused-binds -fno-warn-unused-imports #-}

module MediaRepository.Types (
  ChannelPointer (..),
  Connection (..),
  CounterPointer (..),
  DateRange (..),
  InlineObject (..),
  InlineObject1 (..),
  InlineObject2 (..),
  License (..),
  MediaRecord (..),
  MediaRecordRecordType (..),
  MediaRecordText (..),
  MultiLangString (..),
  ObjectPointer (..),
  ObjectPointerPointer (..),
  OpenVocabularyTerm (..),
  Predicate (..),
  ProblemWithRCObject (..),
  SearchRequest (..),
  ShareStatus (..),
  ShareStatusRead (..),
  ShareStatusWrite (..),
  StorageUsage (..),
  TextExposition (..),
  TextExpositionPage (..),
  TextExpositionTocEntry (..),
  TextExpositionToolMeta (..),
  TimePointer (..),
  TwoDPointer (..),
  VocabularyTerm (..),
  ) where

import Data.Data (Data)
import Data.UUID (UUID)
import Data.List (stripPrefix)
import Data.Maybe (fromMaybe)
import Data.Aeson (Value, FromJSON(..), ToJSON(..), genericToJSON, genericParseJSON)
import Data.Aeson.Types (Options(..), defaultOptions)
import Data.Set (Set)
import Data.Text (Text)
import Data.Time
import Data.Swagger (ToSchema, declareNamedSchema)
import qualified Data.Swagger as Swagger
import qualified Data.Char as Char
import qualified Data.Text as T
import qualified Data.Map as Map
import GHC.Generics (Generic)
import Data.Function ((&))


-- | 
data ChannelPointer = ChannelPointer
  { channelPointerChannel :: Float -- ^ 
  , channelPointerTotalChannels :: Int -- ^ 
  } deriving (Show, Eq, Generic, Data)

instance FromJSON ChannelPointer where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "channelPointer")
instance ToJSON ChannelPointer where
  toJSON = genericToJSON (removeFieldLabelPrefix False "channelPointer")


-- | 
data Connection = Connection
  { connectionId :: Maybe Text -- ^ The id of the connection
  , connectionSubject :: ObjectPointer -- ^ 
  , connectionPredicate :: Text -- ^ Id of a predicate. Predicates can be retrieved from /predicates
  , connectionObject :: ObjectPointer -- ^ 
  } deriving (Show, Eq, Generic, Data)

instance FromJSON Connection where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "connection")
instance ToJSON Connection where
  toJSON = genericToJSON (removeFieldLabelPrefix False "connection")


-- | 
data CounterPointer = CounterPointer
  { counterPointerCounterType :: Text -- ^ 
  , counterPointerCounter :: Int -- ^ 
  } deriving (Show, Eq, Generic, Data)

instance FromJSON CounterPointer where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "counterPointer")
instance ToJSON CounterPointer where
  toJSON = genericToJSON (removeFieldLabelPrefix False "counterPointer")


-- | A temporal range between included but optional start and end points
data DateRange = DateRange
  { dateRangeStart :: Maybe Day -- ^ 
  , dateRangeEnd :: Maybe Day -- ^ 
  } deriving (Show, Eq, Generic, Data)

instance FromJSON DateRange where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "dateRange")
instance ToJSON DateRange where
  toJSON = genericToJSON (removeFieldLabelPrefix False "dateRange")


-- | 
data InlineObject = InlineObject
  { inlineObjectFile :: Maybe FilePath -- ^ 
  } deriving (Show, Eq, Generic, Data)

instance FromJSON InlineObject where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "inlineObject")
instance ToJSON InlineObject where
  toJSON = genericToJSON (removeFieldLabelPrefix False "inlineObject")


-- | 
data InlineObject1 = InlineObject1
  { inlineObject1File :: Maybe FilePath -- ^ 
  } deriving (Show, Eq, Generic, Data)

instance FromJSON InlineObject1 where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "inlineObject1")
instance ToJSON InlineObject1 where
  toJSON = genericToJSON (removeFieldLabelPrefix False "inlineObject1")


-- | 
data InlineObject2 = InlineObject2
  { inlineObject2Filename :: Maybe [FilePath] -- ^ 
  } deriving (Show, Eq, Generic, Data)

instance FromJSON InlineObject2 where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "inlineObject2")
instance ToJSON InlineObject2 where
  toJSON = genericToJSON (removeFieldLabelPrefix False "inlineObject2")


-- | A license
data License = License
  { licenseId :: Text -- ^ 
  , licenseExternalURI :: Text -- ^ external definition URI.
  , licenseName :: Maybe Text -- ^ The name of the license
  } deriving (Show, Eq, Generic, Data)

instance FromJSON License where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "license")
instance ToJSON License where
  toJSON = genericToJSON (removeFieldLabelPrefix False "license")


-- | 
data MediaRecord = MediaRecord
  { mediaRecordId :: Maybe Text -- ^ id generated by server, immutable
  , mediaRecordText :: Maybe MediaRecordText -- ^ 
  , mediaRecordTranscodingStatus :: Maybe Text -- ^ 
  , mediaRecordWidth :: Maybe Int -- ^ Width if it is an image
  , mediaRecordHeight :: Maybe Int -- ^ Height if it is an image
  , mediaRecordTitle :: Text -- ^ 
  , mediaRecordCopyright :: Text -- ^ 
  , mediaRecordLicense :: Text -- ^ RC id of the license, obtained with the call /licenses
  , mediaRecordDescription :: Maybe Text -- ^ 
  , mediaRecordCreator :: Maybe Text -- ^ RC user id, immutable
  , mediaRecordMediaType :: Maybe Text -- ^ 
  , mediaRecordParents :: Maybe [Text] -- ^ media record ids
  , mediaRecordKeywordsClosed :: Maybe [Text] -- ^ closed vocabulary keywords ids, obtained by /keywords/closed
  , mediaRecordKeywordsOpen :: Maybe [Text] -- ^ open vocabulary keywords ids, obtained by /keywords/open
  , mediaRecordTags :: Maybe [Text] -- ^ tags by user, non existing tags are added automatically, obtained by /tags/#userid
  , mediaRecordRecordType :: Maybe MediaRecordRecordType -- ^ 
  , mediaRecordCreationDate :: Maybe Day -- ^ date when object was created
  , mediaRecordModifiedDate :: Maybe Day -- ^ date of last change to the media record
  , mediaRecordMediaDate :: Maybe Day -- ^ Date of the media record or what it represents
  , mediaRecordConnections :: Maybe [Connection] -- ^ this connects one media record to another, or an exposition.
  } deriving (Show, Eq, Generic, Data)

instance FromJSON MediaRecord where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "mediaRecord")
instance ToJSON MediaRecord where
  toJSON = genericToJSON (removeFieldLabelPrefix False "mediaRecord")


-- | Type obtained from the portfolio API ...
data MediaRecordRecordType = MediaRecordRecordType
  { mediaRecordRecordTypeId :: Maybe Text -- ^ 
  , mediaRecordRecordTypeMetadata :: Maybe Value -- ^ 
  } deriving (Show, Eq, Generic, Data)

instance FromJSON MediaRecordRecordType where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "mediaRecordRecordType")
instance ToJSON MediaRecordRecordType where
  toJSON = genericToJSON (removeFieldLabelPrefix False "mediaRecordRecordType")


-- | 
data MediaRecordText = MediaRecordText
  { mediaRecordTextTextType :: Maybe Text -- ^ 
  , mediaRecordTextContent :: Maybe Text -- ^ 
  } deriving (Show, Eq, Generic, Data)

instance FromJSON MediaRecordText where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "mediaRecordText")
instance ToJSON MediaRecordText where
  toJSON = genericToJSON (removeFieldLabelPrefix False "mediaRecordText")


-- | a string with language tag
data MultiLangString = MultiLangString
  { multiLangStringLang :: Text -- ^ 
  , multiLangStringValue :: Text -- ^ 
  } deriving (Show, Eq, Generic, Data)

instance FromJSON MultiLangString where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "multiLangString")
instance ToJSON MultiLangString where
  toJSON = genericToJSON (removeFieldLabelPrefix False "multiLangString")


-- | 
data ObjectPointer = ObjectPointer
  { objectPointerObjectType :: Text -- ^ 
  , objectPointerId :: Text -- ^ RC id
  , objectPointerPointer :: Maybe ObjectPointerPointer -- ^ 
  } deriving (Show, Eq, Generic, Data)

instance FromJSON ObjectPointer where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "objectPointer")
instance ToJSON ObjectPointer where
  toJSON = genericToJSON (removeFieldLabelPrefix False "objectPointer")


-- | 
data ObjectPointerPointer = ObjectPointerPointer
  { objectPointerPointerTimePointer :: Maybe TimePointer -- ^ 
  , objectPointerPointerTwoDPointer :: Maybe TwoDPointer -- ^ 
  , objectPointerPointerCounterPointer :: Maybe CounterPointer -- ^ 
  , objectPointerPointerChannelPointer :: Maybe ChannelPointer -- ^ 
  } deriving (Show, Eq, Generic, Data)

instance FromJSON ObjectPointerPointer where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "objectPointerPointer")
instance ToJSON ObjectPointerPointer where
  toJSON = genericToJSON (removeFieldLabelPrefix False "objectPointerPointer")


-- | a term from a open vocabulary
data OpenVocabularyTerm = OpenVocabularyTerm
  { openVocabularyTermId :: Maybe Text -- ^ 
  , openVocabularyTermTerm :: Text -- ^ the keyword, language unspecified
  } deriving (Show, Eq, Generic, Data)

instance FromJSON OpenVocabularyTerm where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "openVocabularyTerm")
instance ToJSON OpenVocabularyTerm where
  toJSON = genericToJSON (removeFieldLabelPrefix False "openVocabularyTerm")


-- | a predicate used in a connection
data Predicate = Predicate
  { predicateId :: Maybe Text -- ^ 
  , predicatePredicate :: Text -- ^ the description
  , predicateUri :: Maybe Text -- ^ an optional uri defining the predicate
  } deriving (Show, Eq, Generic, Data)

instance FromJSON Predicate where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "predicate")
instance ToJSON Predicate where
  toJSON = genericToJSON (removeFieldLabelPrefix False "predicate")


-- | Problem with an expositon or media record
data ProblemWithRCObject = ProblemWithRCObject
  { problemWithRCObjectObjectType :: Text -- ^ 
  , problemWithRCObjectId :: Text -- ^ RC id
  , problemWithRCObjectProblem :: Text -- ^ 
  } deriving (Show, Eq, Generic, Data)

instance FromJSON ProblemWithRCObject where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "problemWithRCObject")
instance ToJSON ProblemWithRCObject where
  toJSON = genericToJSON (removeFieldLabelPrefix False "problemWithRCObject")


-- | An object to filter searches for media records
data SearchRequest = SearchRequest
  { searchRequestCreator :: Maybe Text -- ^ User id
  , searchRequestTitle :: Maybe Text -- ^ Part of the title of the media record
  , searchRequestMediaType :: Maybe Text -- ^ 
  , searchRequestRecordType :: Maybe Text -- ^ Id of type obtained from the portfolio API
  , searchRequestCreationDate :: Maybe DateRange -- ^ 
  , searchRequestModificationDate :: Maybe DateRange -- ^ 
  , searchRequestDate :: Maybe DateRange -- ^ 
  , searchRequestLicense :: Maybe Text -- ^ Id of a license
  , searchRequestCopyright :: Maybe Text -- ^ Part of the copyright statement
  , searchRequestTag :: Maybe [Text] -- ^ A list tag ids
  , searchRequestKeywordsClosed :: Maybe [Text] -- ^ A list closed vocabulary keyword ids
  , searchRequestKeywordsOpen :: Maybe [Text] -- ^ Open vocabulary keywords ids
  , searchRequestTextContent :: Maybe Text -- ^ Full text search in text MediaRecords (only for text media records)
  , searchRequestConnectedTo :: Maybe [Text] -- ^ A list of media record or exposition ids that the search result should be connected to as subject or object.
  } deriving (Show, Eq, Generic, Data)

instance FromJSON SearchRequest where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "searchRequest")
instance ToJSON SearchRequest where
  toJSON = genericToJSON (removeFieldLabelPrefix False "searchRequest")


-- | Read and write permssions for users that are not the creator
data ShareStatus = ShareStatus
  { shareStatusRead :: ShareStatusRead -- ^ 
  , shareStatusWrite :: ShareStatusWrite -- ^ 
  } deriving (Show, Eq, Generic, Data)

instance FromJSON ShareStatus where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "shareStatus")
instance ToJSON ShareStatus where
  toJSON = genericToJSON (removeFieldLabelPrefix False "shareStatus")


-- | 
data ShareStatusRead = ShareStatusRead
  { shareStatusReadUsers :: [Text] -- ^ list of user id's who can read
  , shareStatusReadPublic :: Bool -- ^ if true, anybody can read
  } deriving (Show, Eq, Generic, Data)

instance FromJSON ShareStatusRead where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "shareStatusRead")
instance ToJSON ShareStatusRead where
  toJSON = genericToJSON (removeFieldLabelPrefix False "shareStatusRead")


-- | 
data ShareStatusWrite = ShareStatusWrite
  { shareStatusWriteUsers :: [Text] -- ^ list of user id's who can write
  } deriving (Show, Eq, Generic, Data)

instance FromJSON ShareStatusWrite where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "shareStatusWrite")
instance ToJSON ShareStatusWrite where
  toJSON = genericToJSON (removeFieldLabelPrefix False "shareStatusWrite")


-- | See the space used by a user
data StorageUsage = StorageUsage
  { storageUsageUsed :: Float -- ^ used space in kiloBytes
  } deriving (Show, Eq, Generic, Data)

instance FromJSON StorageUsage where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "storageUsage")
instance ToJSON StorageUsage where
  toJSON = genericToJSON (removeFieldLabelPrefix False "storageUsage")


-- | An exposition with text-based pages
data TextExposition = TextExposition
  { textExpositionPages :: [TextExpositionPage] -- ^ 
  , textExpositionToolMeta :: [TextExpositionToolMeta] -- ^ 
  , textExpositionTitle :: Text -- ^ 
  , textExpositionStyle :: Text -- ^ CSS styling for the whole exposition
  , textExpositionId :: Maybe Text -- ^ 
  , textExpositionEditorVersion :: Text -- ^ 
  , textExpositionContentVersion :: Int -- ^ 
  , textExpositionToc :: [TextExpositionTocEntry] -- ^ 
  } deriving (Show, Eq, Generic, Data)

instance FromJSON TextExposition where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "textExposition")
instance ToJSON TextExposition where
  toJSON = genericToJSON (removeFieldLabelPrefix False "textExposition")


-- | A text-based exposition page
data TextExpositionPage = TextExpositionPage
  { textExpositionPageTitle :: Text -- ^ Page title
  , textExpositionPageHtml :: Text -- ^ Rendered page
  , textExpositionPageMarkdown :: Text -- ^ Markdown input
  , textExpositionPagePageId :: Maybe Int -- ^ 
  } deriving (Show, Eq, Generic, Data)

instance FromJSON TextExpositionPage where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "textExpositionPage")
instance ToJSON TextExpositionPage where
  toJSON = genericToJSON (removeFieldLabelPrefix False "textExpositionPage")


-- | An entry in the table of contents
data TextExpositionTocEntry = TextExpositionTocEntry
  { textExpositionTocEntryLevel :: Int -- ^ 
  , textExpositionTocEntryTitle :: Text -- ^ 
  , textExpositionTocEntryId :: Text -- ^ Id of the element it refers to
  , textExpositionTocEntryPage :: Int -- ^ Id of the exposition page
  } deriving (Show, Eq, Generic, Data)

instance FromJSON TextExpositionTocEntry where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "textExpositionTocEntry")
instance ToJSON TextExpositionTocEntry where
  toJSON = genericToJSON (removeFieldLabelPrefix False "textExpositionTocEntry")


-- | Style and caption information for media
data TextExpositionToolMeta = TextExpositionToolMeta
  { textExpositionToolMetaMediaId :: Text -- ^ 
  , textExpositionToolMetaCaption :: Maybe Text -- ^ 
  , textExpositionToolMetaUserClass :: Maybe Text -- ^ 
  } deriving (Show, Eq, Generic, Data)

instance FromJSON TextExpositionToolMeta where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "textExpositionToolMeta")
instance ToJSON TextExpositionToolMeta where
  toJSON = genericToJSON (removeFieldLabelPrefix False "textExpositionToolMeta")


-- | 
data TimePointer = TimePointer
  { timePointerHours :: Int -- ^ 
  , timePointerMinutes :: Int -- ^ 
  , timePointerSeconds :: Int -- ^ 
  , timePointerMilliseconds :: Int -- ^ 
  } deriving (Show, Eq, Generic, Data)

instance FromJSON TimePointer where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "timePointer")
instance ToJSON TimePointer where
  toJSON = genericToJSON (removeFieldLabelPrefix False "timePointer")


-- | 
data TwoDPointer = TwoDPointer
  { twoDPointerUnit :: Text -- ^ 
  , twoDPointerX :: Float -- ^ 
  , twoDPointerY :: Float -- ^ 
  } deriving (Show, Eq, Generic, Data)

instance FromJSON TwoDPointer where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "twoDPointer")
instance ToJSON TwoDPointer where
  toJSON = genericToJSON (removeFieldLabelPrefix False "twoDPointer")


-- | a term from a closed vocabulary
data VocabularyTerm = VocabularyTerm
  { vocabularyTermId :: Maybe Text -- ^ 
  , vocabularyTermExternalURI :: Maybe Text -- ^ external definition URI.
  , vocabularyTermTerms :: [MultiLangString] -- ^ a list of synonymous terms in different languages.
  } deriving (Show, Eq, Generic, Data)

instance FromJSON VocabularyTerm where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "vocabularyTerm")
instance ToJSON VocabularyTerm where
  toJSON = genericToJSON (removeFieldLabelPrefix False "vocabularyTerm")


uncapitalize :: String -> String
uncapitalize (first:rest) = Char.toLower first : rest
uncapitalize [] = []

-- | Remove a field label prefix during JSON parsing.
--   Also perform any replacements for special characters.
--   The @forParsing@ parameter is to distinguish between the cases in which we're using this
--   to power a @FromJSON@ or a @ToJSON@ instance. In the first case we're parsing, and we want
--   to replace special characters with their quoted equivalents (because we cannot have special
--   chars in identifier names), while we want to do viceversa when sending data instead.
removeFieldLabelPrefix :: Bool -> String -> Options
removeFieldLabelPrefix forParsing prefix =
  defaultOptions
    { omitNothingFields  = True
    , fieldLabelModifier = uncapitalize . fromMaybe (error ("did not find prefix " ++ prefix)) . stripPrefix prefix . replaceSpecialChars
    }
  where
    replaceSpecialChars field = foldl (&) field (map mkCharReplacement specialChars)
    specialChars =
      [ ("@", "'At")
      , ("\\", "'Back_Slash")
      , ("<=", "'Less_Than_Or_Equal_To")
      , ("\"", "'Double_Quote")
      , ("[", "'Left_Square_Bracket")
      , ("]", "'Right_Square_Bracket")
      , ("^", "'Caret")
      , ("_", "'Underscore")
      , ("`", "'Backtick")
      , ("!", "'Exclamation")
      , ("#", "'Hash")
      , ("$", "'Dollar")
      , ("%", "'Percent")
      , ("&", "'Ampersand")
      , ("'", "'Quote")
      , ("(", "'Left_Parenthesis")
      , (")", "'Right_Parenthesis")
      , ("*", "'Star")
      , ("+", "'Plus")
      , (",", "'Comma")
      , ("-", "'Dash")
      , (".", "'Period")
      , ("/", "'Slash")
      , (":", "'Colon")
      , ("{", "'Left_Curly_Bracket")
      , ("|", "'Pipe")
      , ("<", "'LessThan")
      , ("!=", "'Not_Equal")
      , ("=", "'Equal")
      , ("}", "'Right_Curly_Bracket")
      , (">", "'GreaterThan")
      , ("~", "'Tilde")
      , ("?", "'Question_Mark")
      , (">=", "'Greater_Than_Or_Equal_To")
      ]
    mkCharReplacement (replaceStr, searchStr) = T.unpack . replacer (T.pack searchStr) (T.pack replaceStr) . T.pack
    replacer =
      if forParsing
        then flip T.replace
        else T.replace
