{-
   Media Repository API
   The Research Catalouge Media Repository API

   The version of the OpenAPI document: 1.0.0-oas3
   Contact: support@researchcatalogue.net

   NOTE: This file is auto generated by the openapi-generator.
   https://github.com/openapitools/openapi-generator.git

   DO NOT EDIT THIS FILE MANUALLY.

   For more info on generating Elm code, see https://eriktim.github.io/openapi-elm/
-}


module Api.Data exposing
    ( ChannelPointer
    , Connection
    , CounterPointer, CounterPointerCounterType(..), counterPointerCounterTypeVariants
    , InlineObject
    , MediaRecord, MediaRecordMediaType(..), mediaRecordMediaTypeVariants
    , MediaRecordText, MediaRecordTextTextType(..), mediaRecordTextTextTypeVariants
    , MediaRecordType
    , MultiLangString
    , ObjectPointer, ObjectPointerObjectType(..), objectPointerObjectTypeVariants
    , ObjectPointerPointer
    , OpenVocabularyTerm
    , Predicate
    , ProblemWithRCObject, ProblemWithRCObjectObjectType(..), problemWithRCObjectObjectTypeVariants, ProblemWithRCObjectProblem(..), problemWithRCObjectProblemVariants
    , ShareStatus
    , ShareStatusRead
    , ShareStatusWrite
    , TimePointer
    , TwoDPointer, TwoDPointerUnit(..), twoDPointerUnitVariants
    , VocabularyTerm
    , encodeChannelPointer
    , encodeConnection
    , encodeCounterPointer
    , encodeInlineObject
    , encodeMediaRecord
    , encodeMediaRecordText
    , encodeMediaRecordType
    , encodeMultiLangString
    , encodeObjectPointer
    , encodeObjectPointerPointer
    , encodeOpenVocabularyTerm
    , encodePredicate
    , encodeProblemWithRCObject
    , encodeShareStatus
    , encodeShareStatusRead
    , encodeShareStatusWrite
    , encodeTimePointer
    , encodeTwoDPointer
    , encodeVocabularyTerm
    , channelPointerDecoder
    , connectionDecoder
    , counterPointerDecoder
    , inlineObjectDecoder
    , mediaRecordDecoder
    , mediaRecordTextDecoder
    , mediaRecordTypeDecoder
    , multiLangStringDecoder
    , objectPointerDecoder
    , objectPointerPointerDecoder
    , openVocabularyTermDecoder
    , predicateDecoder
    , problemWithRCObjectDecoder
    , shareStatusDecoder
    , shareStatusReadDecoder
    , shareStatusWriteDecoder
    , timePointerDecoder
    , twoDPointerDecoder
    , vocabularyTermDecoder
    )

import Api
import Api.Time exposing (Posix)
import Dict
import Json.Decode
import Json.Encode


-- MODEL


type alias ChannelPointer =
    { channel : Float
    , totalChannels : Int
    }


type alias Connection =
    { id : Maybe String
    , subject : ObjectPointer
    , predicate : String
    , object : ObjectPointer
    }


type alias CounterPointer =
    { counterType : CounterPointerCounterType
    , counter : Int
    }


type CounterPointerCounterType
    = CounterPointerCounterTypeCharacter
    | CounterPointerCounterTypeByte
    | CounterPointerCounterTypePage


counterPointerCounterTypeVariants : List CounterPointerCounterType
counterPointerCounterTypeVariants =
    [ CounterPointerCounterTypeCharacter
    , CounterPointerCounterTypeByte
    , CounterPointerCounterTypePage
    ]


type alias InlineObject =
    { file : Maybe String
    }


type alias MediaRecord =
    { id : Maybe String
    , text : Maybe MediaRecordText
    , title : String
    , copyright : String
    , license : String
    , description : Maybe String
    , creator : Maybe String
    , mediaType : Maybe MediaRecordMediaType
    , parents : Maybe (List (String))
    , keywordsClosed : Maybe (List (String))
    , keywordsOpen : Maybe (List (String))
    , tags : Maybe (List (String))
    , type_ : Maybe MediaRecordType
    , creationDate : Maybe Posix
    , modifiedDate : Maybe Posix
    , mediaDate : Maybe Posix
    , connections : Maybe (List (Connection))
    }


type MediaRecordMediaType
    = MediaRecordMediaTypeVideo
    | MediaRecordMediaTypeAudio
    | MediaRecordMediaTypeImage
    | MediaRecordMediaTypeSvg
    | MediaRecordMediaTypePdf
    | MediaRecordMediaTypeText


mediaRecordMediaTypeVariants : List MediaRecordMediaType
mediaRecordMediaTypeVariants =
    [ MediaRecordMediaTypeVideo
    , MediaRecordMediaTypeAudio
    , MediaRecordMediaTypeImage
    , MediaRecordMediaTypeSvg
    , MediaRecordMediaTypePdf
    , MediaRecordMediaTypeText
    ]


type alias MediaRecordText =
    { textType : Maybe MediaRecordTextTextType
    , content : Maybe String
    }


type MediaRecordTextTextType
    = MediaRecordTextTextTypeMarkdown
    | MediaRecordTextTextTypeAltText
    | MediaRecordTextTextTypeHtml
    | MediaRecordTextTextTypePlain


mediaRecordTextTextTypeVariants : List MediaRecordTextTextType
mediaRecordTextTextTypeVariants =
    [ MediaRecordTextTextTypeMarkdown
    , MediaRecordTextTextTypeAltText
    , MediaRecordTextTextTypeHtml
    , MediaRecordTextTextTypePlain
    ]


{-| type obtained from the portfolio API ...
-}
type alias MediaRecordType =
    { id : Maybe String
    , metadata : Maybe Object
    }


{-| a string with language tag
-}
type alias MultiLangString =
    { lang : String
    , value : String
    }


type alias ObjectPointer =
    { objectType : ObjectPointerObjectType
    , id : String
    , pointer : ObjectPointerPointer
    }


type ObjectPointerObjectType
    = ObjectPointerObjectTypeMediaRecord
    | ObjectPointerObjectTypeExposition


objectPointerObjectTypeVariants : List ObjectPointerObjectType
objectPointerObjectTypeVariants =
    [ ObjectPointerObjectTypeMediaRecord
    , ObjectPointerObjectTypeExposition
    ]


type alias ObjectPointerPointer =
    { timePointer : Maybe TimePointer
    , twoDPointer : Maybe TwoDPointer
    , counterPointer : Maybe CounterPointer
    , channelPointer : Maybe ChannelPointer
    }


{-| a term from a open vocabulary
-}
type alias OpenVocabularyTerm =
    { id : Maybe String
    , term : String
    }


{-| a predicate used in a connection
-}
type alias Predicate =
    { id : Maybe String
    , predicate : String
    , uri : Maybe String
    }


{-| Problem with an expositon or media record
-}
type alias ProblemWithRCObject =
    { objectType : ProblemWithRCObjectObjectType
    , id : String
    , problem : ProblemWithRCObjectProblem
    }


type ProblemWithRCObjectObjectType
    = ProblemWithRCObjectObjectTypeMediaRecord
    | ProblemWithRCObjectObjectTypeExposition


problemWithRCObjectObjectTypeVariants : List ProblemWithRCObjectObjectType
problemWithRCObjectObjectTypeVariants =
    [ ProblemWithRCObjectObjectTypeMediaRecord
    , ProblemWithRCObjectObjectTypeExposition
    ]


type ProblemWithRCObjectProblem
    = ProblemWithRCObjectProblemDoesNotExist
    | ProblemWithRCObjectProblemInsufficientPermissions
    | ProblemWithRCObjectProblemConflict


problemWithRCObjectProblemVariants : List ProblemWithRCObjectProblem
problemWithRCObjectProblemVariants =
    [ ProblemWithRCObjectProblemDoesNotExist
    , ProblemWithRCObjectProblemInsufficientPermissions
    , ProblemWithRCObjectProblemConflict
    ]


{-| Read and write permssions for users that are not the creator
-}
type alias ShareStatus =
    { read : ShareStatusRead
    , write : ShareStatusWrite
    }


type alias ShareStatusRead =
    { users : List (String)
    , public : Bool
    }


type alias ShareStatusWrite =
    { users : List (String)
    }


type alias TimePointer =
    { hours : Int
    , minutes : Int
    , seconds : Int
    , milliseconds : Int
    }


type alias TwoDPointer =
    { unit : TwoDPointerUnit
    , x : Float
    , y : Float
    }


type TwoDPointerUnit
    = TwoDPointerUnitPerc
    | TwoDPointerUnitPixel


twoDPointerUnitVariants : List TwoDPointerUnit
twoDPointerUnitVariants =
    [ TwoDPointerUnitPerc
    , TwoDPointerUnitPixel
    ]


{-| a term from a closed vocabulary
-}
type alias VocabularyTerm =
    { id : Maybe String
    , externalURI : Maybe String
    , terms : List (MultiLangString)
    }


-- ENCODER


encodeChannelPointer : ChannelPointer -> Json.Encode.Value
encodeChannelPointer =
    encodeObject << encodeChannelPointerPairs


encodeChannelPointerWithTag : ( String, String ) -> ChannelPointer -> Json.Encode.Value
encodeChannelPointerWithTag (tagField, tag) model =
    encodeObject (encodeChannelPointerPairs model ++ [ encode tagField Json.Encode.string tag ])


encodeChannelPointerPairs : ChannelPointer -> List EncodedField
encodeChannelPointerPairs model =
    let
        pairs =
            [ encode "channel" Json.Encode.float model.channel
            , encode "totalChannels" Json.Encode.int model.totalChannels
            ]
    in
    pairs


encodeConnection : Connection -> Json.Encode.Value
encodeConnection =
    encodeObject << encodeConnectionPairs


encodeConnectionWithTag : ( String, String ) -> Connection -> Json.Encode.Value
encodeConnectionWithTag (tagField, tag) model =
    encodeObject (encodeConnectionPairs model ++ [ encode tagField Json.Encode.string tag ])


encodeConnectionPairs : Connection -> List EncodedField
encodeConnectionPairs model =
    let
        pairs =
            [ maybeEncode "id" Json.Encode.string model.id
            , encode "subject" encodeObjectPointer model.subject
            , encode "predicate" Json.Encode.string model.predicate
            , encode "object" encodeObjectPointer model.object
            ]
    in
    pairs


encodeCounterPointer : CounterPointer -> Json.Encode.Value
encodeCounterPointer =
    encodeObject << encodeCounterPointerPairs


encodeCounterPointerWithTag : ( String, String ) -> CounterPointer -> Json.Encode.Value
encodeCounterPointerWithTag (tagField, tag) model =
    encodeObject (encodeCounterPointerPairs model ++ [ encode tagField Json.Encode.string tag ])


encodeCounterPointerPairs : CounterPointer -> List EncodedField
encodeCounterPointerPairs model =
    let
        pairs =
            [ encode "counterType"  model.counterType
            , encode "counter" Json.Encode.int model.counter
            ]
    in
    pairs

stringFromCounterPointerCounterType : CounterPointerCounterType -> String
stringFromCounterPointerCounterType model =
    case model of
        CounterPointerCounterTypeCharacter ->
            "character"

        CounterPointerCounterTypeByte ->
            "byte"

        CounterPointerCounterTypePage ->
            "page"


encodeCounterPointerCounterType : CounterPointerCounterType -> Json.Encode.Value
encodeCounterPointerCounterType =
    Json.Encode.string << stringFromCounterPointerCounterType



encodeInlineObject : InlineObject -> Json.Encode.Value
encodeInlineObject =
    encodeObject << encodeInlineObjectPairs


encodeInlineObjectWithTag : ( String, String ) -> InlineObject -> Json.Encode.Value
encodeInlineObjectWithTag (tagField, tag) model =
    encodeObject (encodeInlineObjectPairs model ++ [ encode tagField Json.Encode.string tag ])


encodeInlineObjectPairs : InlineObject -> List EncodedField
encodeInlineObjectPairs model =
    let
        pairs =
            [ maybeEncode "file" Json.Decode.string model.file
            ]
    in
    pairs


encodeMediaRecord : MediaRecord -> Json.Encode.Value
encodeMediaRecord =
    encodeObject << encodeMediaRecordPairs


encodeMediaRecordWithTag : ( String, String ) -> MediaRecord -> Json.Encode.Value
encodeMediaRecordWithTag (tagField, tag) model =
    encodeObject (encodeMediaRecordPairs model ++ [ encode tagField Json.Encode.string tag ])


encodeMediaRecordPairs : MediaRecord -> List EncodedField
encodeMediaRecordPairs model =
    let
        pairs =
            [ maybeEncode "id" Json.Encode.string model.id
            , maybeEncode "text" encodeMediaRecordText model.text
            , encode "title" Json.Encode.string model.title
            , encode "copyright" Json.Encode.string model.copyright
            , encode "license" Json.Encode.string model.license
            , maybeEncode "description" Json.Encode.string model.description
            , maybeEncode "creator" Json.Encode.string model.creator
            , maybeEncode "mediaType"  model.mediaType
            , maybeEncode "parents" (Json.Encode.list Json.Encode.string) model.parents
            , maybeEncode "keywordsClosed" (Json.Encode.list Json.Encode.string) model.keywordsClosed
            , maybeEncode "keywordsOpen" (Json.Encode.list Json.Encode.string) model.keywordsOpen
            , maybeEncode "tags" (Json.Encode.list Json.Encode.string) model.tags
            , maybeEncode "type" encodeMediaRecordType model.type_
            , maybeEncode "creationDate" Api.Time.encodeDate model.creationDate
            , maybeEncode "modifiedDate" Api.Time.encodeDate model.modifiedDate
            , maybeEncode "mediaDate" Api.Time.encodeDate model.mediaDate
            , maybeEncode "connections" (Json.Encode.list encodeConnection) model.connections
            ]
    in
    pairs

stringFromMediaRecordMediaType : MediaRecordMediaType -> String
stringFromMediaRecordMediaType model =
    case model of
        MediaRecordMediaTypeVideo ->
            "video"

        MediaRecordMediaTypeAudio ->
            "audio"

        MediaRecordMediaTypeImage ->
            "image"

        MediaRecordMediaTypeSvg ->
            "svg"

        MediaRecordMediaTypePdf ->
            "pdf"

        MediaRecordMediaTypeText ->
            "text"


encodeMediaRecordMediaType : MediaRecordMediaType -> Json.Encode.Value
encodeMediaRecordMediaType =
    Json.Encode.string << stringFromMediaRecordMediaType



encodeMediaRecordText : MediaRecordText -> Json.Encode.Value
encodeMediaRecordText =
    encodeObject << encodeMediaRecordTextPairs


encodeMediaRecordTextWithTag : ( String, String ) -> MediaRecordText -> Json.Encode.Value
encodeMediaRecordTextWithTag (tagField, tag) model =
    encodeObject (encodeMediaRecordTextPairs model ++ [ encode tagField Json.Encode.string tag ])


encodeMediaRecordTextPairs : MediaRecordText -> List EncodedField
encodeMediaRecordTextPairs model =
    let
        pairs =
            [ maybeEncode "textType"  model.textType
            , maybeEncode "content" Json.Encode.string model.content
            ]
    in
    pairs

stringFromMediaRecordTextTextType : MediaRecordTextTextType -> String
stringFromMediaRecordTextTextType model =
    case model of
        MediaRecordTextTextTypeMarkdown ->
            "markdown"

        MediaRecordTextTextTypeAltText ->
            "altText"

        MediaRecordTextTextTypeHtml ->
            "html"

        MediaRecordTextTextTypePlain ->
            "plain"


encodeMediaRecordTextTextType : MediaRecordTextTextType -> Json.Encode.Value
encodeMediaRecordTextTextType =
    Json.Encode.string << stringFromMediaRecordTextTextType



encodeMediaRecordType : MediaRecordType -> Json.Encode.Value
encodeMediaRecordType =
    encodeObject << encodeMediaRecordTypePairs


encodeMediaRecordTypeWithTag : ( String, String ) -> MediaRecordType -> Json.Encode.Value
encodeMediaRecordTypeWithTag (tagField, tag) model =
    encodeObject (encodeMediaRecordTypePairs model ++ [ encode tagField Json.Encode.string tag ])


encodeMediaRecordTypePairs : MediaRecordType -> List EncodedField
encodeMediaRecordTypePairs model =
    let
        pairs =
            [ maybeEncode "id" Json.Encode.string model.id
            , maybeEncode "metadata" encodeObject model.metadata
            ]
    in
    pairs


encodeMultiLangString : MultiLangString -> Json.Encode.Value
encodeMultiLangString =
    encodeObject << encodeMultiLangStringPairs


encodeMultiLangStringWithTag : ( String, String ) -> MultiLangString -> Json.Encode.Value
encodeMultiLangStringWithTag (tagField, tag) model =
    encodeObject (encodeMultiLangStringPairs model ++ [ encode tagField Json.Encode.string tag ])


encodeMultiLangStringPairs : MultiLangString -> List EncodedField
encodeMultiLangStringPairs model =
    let
        pairs =
            [ encode "lang" Json.Encode.string model.lang
            , encode "value" Json.Encode.string model.value
            ]
    in
    pairs


encodeObjectPointer : ObjectPointer -> Json.Encode.Value
encodeObjectPointer =
    encodeObject << encodeObjectPointerPairs


encodeObjectPointerWithTag : ( String, String ) -> ObjectPointer -> Json.Encode.Value
encodeObjectPointerWithTag (tagField, tag) model =
    encodeObject (encodeObjectPointerPairs model ++ [ encode tagField Json.Encode.string tag ])


encodeObjectPointerPairs : ObjectPointer -> List EncodedField
encodeObjectPointerPairs model =
    let
        pairs =
            [ encode "objectType"  model.objectType
            , encode "id" Json.Encode.string model.id
            , encode "pointer" encodeObjectPointerPointer model.pointer
            ]
    in
    pairs

stringFromObjectPointerObjectType : ObjectPointerObjectType -> String
stringFromObjectPointerObjectType model =
    case model of
        ObjectPointerObjectTypeMediaRecord ->
            "mediaRecord"

        ObjectPointerObjectTypeExposition ->
            "exposition"


encodeObjectPointerObjectType : ObjectPointerObjectType -> Json.Encode.Value
encodeObjectPointerObjectType =
    Json.Encode.string << stringFromObjectPointerObjectType



encodeObjectPointerPointer : ObjectPointerPointer -> Json.Encode.Value
encodeObjectPointerPointer =
    encodeObject << encodeObjectPointerPointerPairs


encodeObjectPointerPointerWithTag : ( String, String ) -> ObjectPointerPointer -> Json.Encode.Value
encodeObjectPointerPointerWithTag (tagField, tag) model =
    encodeObject (encodeObjectPointerPointerPairs model ++ [ encode tagField Json.Encode.string tag ])


encodeObjectPointerPointerPairs : ObjectPointerPointer -> List EncodedField
encodeObjectPointerPointerPairs model =
    let
        pairs =
            [ maybeEncode "timePointer" encodeTimePointer model.timePointer
            , maybeEncode "twoDPointer" encodeTwoDPointer model.twoDPointer
            , maybeEncode "counterPointer" encodeCounterPointer model.counterPointer
            , maybeEncode "channelPointer" encodeChannelPointer model.channelPointer
            ]
    in
    pairs


encodeOpenVocabularyTerm : OpenVocabularyTerm -> Json.Encode.Value
encodeOpenVocabularyTerm =
    encodeObject << encodeOpenVocabularyTermPairs


encodeOpenVocabularyTermWithTag : ( String, String ) -> OpenVocabularyTerm -> Json.Encode.Value
encodeOpenVocabularyTermWithTag (tagField, tag) model =
    encodeObject (encodeOpenVocabularyTermPairs model ++ [ encode tagField Json.Encode.string tag ])


encodeOpenVocabularyTermPairs : OpenVocabularyTerm -> List EncodedField
encodeOpenVocabularyTermPairs model =
    let
        pairs =
            [ maybeEncode "id" Json.Encode.string model.id
            , encode "term" Json.Encode.string model.term
            ]
    in
    pairs


encodePredicate : Predicate -> Json.Encode.Value
encodePredicate =
    encodeObject << encodePredicatePairs


encodePredicateWithTag : ( String, String ) -> Predicate -> Json.Encode.Value
encodePredicateWithTag (tagField, tag) model =
    encodeObject (encodePredicatePairs model ++ [ encode tagField Json.Encode.string tag ])


encodePredicatePairs : Predicate -> List EncodedField
encodePredicatePairs model =
    let
        pairs =
            [ maybeEncode "id" Json.Encode.string model.id
            , encode "predicate" Json.Encode.string model.predicate
            , maybeEncode "uri" Json.Encode.string model.uri
            ]
    in
    pairs


encodeProblemWithRCObject : ProblemWithRCObject -> Json.Encode.Value
encodeProblemWithRCObject =
    encodeObject << encodeProblemWithRCObjectPairs


encodeProblemWithRCObjectWithTag : ( String, String ) -> ProblemWithRCObject -> Json.Encode.Value
encodeProblemWithRCObjectWithTag (tagField, tag) model =
    encodeObject (encodeProblemWithRCObjectPairs model ++ [ encode tagField Json.Encode.string tag ])


encodeProblemWithRCObjectPairs : ProblemWithRCObject -> List EncodedField
encodeProblemWithRCObjectPairs model =
    let
        pairs =
            [ encode "objectType"  model.objectType
            , encode "id" Json.Encode.string model.id
            , encode "problem"  model.problem
            ]
    in
    pairs

stringFromProblemWithRCObjectObjectType : ProblemWithRCObjectObjectType -> String
stringFromProblemWithRCObjectObjectType model =
    case model of
        ProblemWithRCObjectObjectTypeMediaRecord ->
            "mediaRecord"

        ProblemWithRCObjectObjectTypeExposition ->
            "exposition"


encodeProblemWithRCObjectObjectType : ProblemWithRCObjectObjectType -> Json.Encode.Value
encodeProblemWithRCObjectObjectType =
    Json.Encode.string << stringFromProblemWithRCObjectObjectType


stringFromProblemWithRCObjectProblem : ProblemWithRCObjectProblem -> String
stringFromProblemWithRCObjectProblem model =
    case model of
        ProblemWithRCObjectProblemDoesNotExist ->
            "does not exist"

        ProblemWithRCObjectProblemInsufficientPermissions ->
            "insufficient permissions"

        ProblemWithRCObjectProblemConflict ->
            "conflict"


encodeProblemWithRCObjectProblem : ProblemWithRCObjectProblem -> Json.Encode.Value
encodeProblemWithRCObjectProblem =
    Json.Encode.string << stringFromProblemWithRCObjectProblem



encodeShareStatus : ShareStatus -> Json.Encode.Value
encodeShareStatus =
    encodeObject << encodeShareStatusPairs


encodeShareStatusWithTag : ( String, String ) -> ShareStatus -> Json.Encode.Value
encodeShareStatusWithTag (tagField, tag) model =
    encodeObject (encodeShareStatusPairs model ++ [ encode tagField Json.Encode.string tag ])


encodeShareStatusPairs : ShareStatus -> List EncodedField
encodeShareStatusPairs model =
    let
        pairs =
            [ encode "read" encodeShareStatusRead model.read
            , encode "write" encodeShareStatusWrite model.write
            ]
    in
    pairs


encodeShareStatusRead : ShareStatusRead -> Json.Encode.Value
encodeShareStatusRead =
    encodeObject << encodeShareStatusReadPairs


encodeShareStatusReadWithTag : ( String, String ) -> ShareStatusRead -> Json.Encode.Value
encodeShareStatusReadWithTag (tagField, tag) model =
    encodeObject (encodeShareStatusReadPairs model ++ [ encode tagField Json.Encode.string tag ])


encodeShareStatusReadPairs : ShareStatusRead -> List EncodedField
encodeShareStatusReadPairs model =
    let
        pairs =
            [ encode "users" (Json.Encode.list Json.Encode.string) model.users
            , encode "public" Json.Encode.bool model.public
            ]
    in
    pairs


encodeShareStatusWrite : ShareStatusWrite -> Json.Encode.Value
encodeShareStatusWrite =
    encodeObject << encodeShareStatusWritePairs


encodeShareStatusWriteWithTag : ( String, String ) -> ShareStatusWrite -> Json.Encode.Value
encodeShareStatusWriteWithTag (tagField, tag) model =
    encodeObject (encodeShareStatusWritePairs model ++ [ encode tagField Json.Encode.string tag ])


encodeShareStatusWritePairs : ShareStatusWrite -> List EncodedField
encodeShareStatusWritePairs model =
    let
        pairs =
            [ encode "users" (Json.Encode.list Json.Encode.string) model.users
            ]
    in
    pairs


encodeTimePointer : TimePointer -> Json.Encode.Value
encodeTimePointer =
    encodeObject << encodeTimePointerPairs


encodeTimePointerWithTag : ( String, String ) -> TimePointer -> Json.Encode.Value
encodeTimePointerWithTag (tagField, tag) model =
    encodeObject (encodeTimePointerPairs model ++ [ encode tagField Json.Encode.string tag ])


encodeTimePointerPairs : TimePointer -> List EncodedField
encodeTimePointerPairs model =
    let
        pairs =
            [ encode "hours" Json.Encode.int model.hours
            , encode "minutes" Json.Encode.int model.minutes
            , encode "seconds" Json.Encode.int model.seconds
            , encode "milliseconds" Json.Encode.int model.milliseconds
            ]
    in
    pairs


encodeTwoDPointer : TwoDPointer -> Json.Encode.Value
encodeTwoDPointer =
    encodeObject << encodeTwoDPointerPairs


encodeTwoDPointerWithTag : ( String, String ) -> TwoDPointer -> Json.Encode.Value
encodeTwoDPointerWithTag (tagField, tag) model =
    encodeObject (encodeTwoDPointerPairs model ++ [ encode tagField Json.Encode.string tag ])


encodeTwoDPointerPairs : TwoDPointer -> List EncodedField
encodeTwoDPointerPairs model =
    let
        pairs =
            [ encode "unit"  model.unit
            , encode "x" Json.Encode.float model.x
            , encode "y" Json.Encode.float model.y
            ]
    in
    pairs

stringFromTwoDPointerUnit : TwoDPointerUnit -> String
stringFromTwoDPointerUnit model =
    case model of
        TwoDPointerUnitPerc ->
            "perc"

        TwoDPointerUnitPixel ->
            "pixel"


encodeTwoDPointerUnit : TwoDPointerUnit -> Json.Encode.Value
encodeTwoDPointerUnit =
    Json.Encode.string << stringFromTwoDPointerUnit



encodeVocabularyTerm : VocabularyTerm -> Json.Encode.Value
encodeVocabularyTerm =
    encodeObject << encodeVocabularyTermPairs


encodeVocabularyTermWithTag : ( String, String ) -> VocabularyTerm -> Json.Encode.Value
encodeVocabularyTermWithTag (tagField, tag) model =
    encodeObject (encodeVocabularyTermPairs model ++ [ encode tagField Json.Encode.string tag ])


encodeVocabularyTermPairs : VocabularyTerm -> List EncodedField
encodeVocabularyTermPairs model =
    let
        pairs =
            [ maybeEncode "id" Json.Encode.string model.id
            , maybeEncode "externalURI" Json.Encode.string model.externalURI
            , encode "terms" (Json.Encode.list encodeMultiLangString) model.terms
            ]
    in
    pairs


-- DECODER


channelPointerDecoder : Json.Decode.Decoder ChannelPointer
channelPointerDecoder =
    Json.Decode.succeed ChannelPointer
        |> decode "channel" Json.Decode.float 
        |> decode "totalChannels" Json.Decode.int 


connectionDecoder : Json.Decode.Decoder Connection
connectionDecoder =
    Json.Decode.succeed Connection
        |> maybeDecode "id" Json.Decode.string Nothing
        |> decode "subject" objectPointerDecoder 
        |> decode "predicate" Json.Decode.string 
        |> decode "object" objectPointerDecoder 


counterPointerDecoder : Json.Decode.Decoder CounterPointer
counterPointerDecoder =
    Json.Decode.succeed CounterPointer
        |> decode "counterType"  
        |> decode "counter" Json.Decode.int 


counterPointerCounterTypeDecoder : Json.Decode.Decoder CounterPointerCounterType
counterPointerCounterTypeDecoder =
    Json.Decode.string
        |> Json.Decode.andThen
            (\value ->
                case value of
                    "character" ->
                        Json.Decode.succeed CounterPointerCounterTypeCharacter

                    "byte" ->
                        Json.Decode.succeed CounterPointerCounterTypeByte

                    "page" ->
                        Json.Decode.succeed CounterPointerCounterTypePage

                    other ->
                        Json.Decode.fail <| "Unknown type: " ++ other
            )



inlineObjectDecoder : Json.Decode.Decoder InlineObject
inlineObjectDecoder =
    Json.Decode.succeed InlineObject
        |> maybeDecode "file" Json.Decode.string Nothing


mediaRecordDecoder : Json.Decode.Decoder MediaRecord
mediaRecordDecoder =
    Json.Decode.succeed MediaRecord
        |> maybeDecode "id" Json.Decode.string Nothing
        |> maybeDecode "text" mediaRecordTextDecoder Nothing
        |> decode "title" Json.Decode.string 
        |> decode "copyright" Json.Decode.string 
        |> decode "license" Json.Decode.string 
        |> maybeDecode "description" Json.Decode.string Nothing
        |> maybeDecode "creator" Json.Decode.string Nothing
        |> maybeDecode "mediaType"  Nothing
        |> maybeDecode "parents" (Json.Decode.list Json.Decode.string) Nothing
        |> maybeDecode "keywordsClosed" (Json.Decode.list Json.Decode.string) Nothing
        |> maybeDecode "keywordsOpen" (Json.Decode.list Json.Decode.string) Nothing
        |> maybeDecode "tags" (Json.Decode.list Json.Decode.string) Nothing
        |> maybeDecode "type" mediaRecordTypeDecoder Nothing
        |> maybeDecode "creationDate" Api.Time.dateDecoder Nothing
        |> maybeDecode "modifiedDate" Api.Time.dateDecoder Nothing
        |> maybeDecode "mediaDate" Api.Time.dateDecoder Nothing
        |> maybeDecode "connections" (Json.Decode.list connectionDecoder) Nothing


mediaRecordMediaTypeDecoder : Json.Decode.Decoder MediaRecordMediaType
mediaRecordMediaTypeDecoder =
    Json.Decode.string
        |> Json.Decode.andThen
            (\value ->
                case value of
                    "video" ->
                        Json.Decode.succeed MediaRecordMediaTypeVideo

                    "audio" ->
                        Json.Decode.succeed MediaRecordMediaTypeAudio

                    "image" ->
                        Json.Decode.succeed MediaRecordMediaTypeImage

                    "svg" ->
                        Json.Decode.succeed MediaRecordMediaTypeSvg

                    "pdf" ->
                        Json.Decode.succeed MediaRecordMediaTypePdf

                    "text" ->
                        Json.Decode.succeed MediaRecordMediaTypeText

                    other ->
                        Json.Decode.fail <| "Unknown type: " ++ other
            )



mediaRecordTextDecoder : Json.Decode.Decoder MediaRecordText
mediaRecordTextDecoder =
    Json.Decode.succeed MediaRecordText
        |> maybeDecode "textType"  Nothing
        |> maybeDecode "content" Json.Decode.string Nothing


mediaRecordTextTextTypeDecoder : Json.Decode.Decoder MediaRecordTextTextType
mediaRecordTextTextTypeDecoder =
    Json.Decode.string
        |> Json.Decode.andThen
            (\value ->
                case value of
                    "markdown" ->
                        Json.Decode.succeed MediaRecordTextTextTypeMarkdown

                    "altText" ->
                        Json.Decode.succeed MediaRecordTextTextTypeAltText

                    "html" ->
                        Json.Decode.succeed MediaRecordTextTextTypeHtml

                    "plain" ->
                        Json.Decode.succeed MediaRecordTextTextTypePlain

                    other ->
                        Json.Decode.fail <| "Unknown type: " ++ other
            )



mediaRecordTypeDecoder : Json.Decode.Decoder MediaRecordType
mediaRecordTypeDecoder =
    Json.Decode.succeed MediaRecordType
        |> maybeDecode "id" Json.Decode.string Nothing
        |> maybeDecode "metadata" objectDecoder Nothing


multiLangStringDecoder : Json.Decode.Decoder MultiLangString
multiLangStringDecoder =
    Json.Decode.succeed MultiLangString
        |> decode "lang" Json.Decode.string 
        |> decode "value" Json.Decode.string 


objectPointerDecoder : Json.Decode.Decoder ObjectPointer
objectPointerDecoder =
    Json.Decode.succeed ObjectPointer
        |> decode "objectType"  
        |> decode "id" Json.Decode.string 
        |> decode "pointer" objectPointerPointerDecoder 


objectPointerObjectTypeDecoder : Json.Decode.Decoder ObjectPointerObjectType
objectPointerObjectTypeDecoder =
    Json.Decode.string
        |> Json.Decode.andThen
            (\value ->
                case value of
                    "mediaRecord" ->
                        Json.Decode.succeed ObjectPointerObjectTypeMediaRecord

                    "exposition" ->
                        Json.Decode.succeed ObjectPointerObjectTypeExposition

                    other ->
                        Json.Decode.fail <| "Unknown type: " ++ other
            )



objectPointerPointerDecoder : Json.Decode.Decoder ObjectPointerPointer
objectPointerPointerDecoder =
    Json.Decode.succeed ObjectPointerPointer
        |> maybeDecode "timePointer" timePointerDecoder Nothing
        |> maybeDecode "twoDPointer" twoDPointerDecoder Nothing
        |> maybeDecode "counterPointer" counterPointerDecoder Nothing
        |> maybeDecode "channelPointer" channelPointerDecoder Nothing


openVocabularyTermDecoder : Json.Decode.Decoder OpenVocabularyTerm
openVocabularyTermDecoder =
    Json.Decode.succeed OpenVocabularyTerm
        |> maybeDecode "id" Json.Decode.string Nothing
        |> decode "term" Json.Decode.string 


predicateDecoder : Json.Decode.Decoder Predicate
predicateDecoder =
    Json.Decode.succeed Predicate
        |> maybeDecode "id" Json.Decode.string Nothing
        |> decode "predicate" Json.Decode.string 
        |> maybeDecode "uri" Json.Decode.string Nothing


problemWithRCObjectDecoder : Json.Decode.Decoder ProblemWithRCObject
problemWithRCObjectDecoder =
    Json.Decode.succeed ProblemWithRCObject
        |> decode "objectType"  
        |> decode "id" Json.Decode.string 
        |> decode "problem"  


problemWithRCObjectObjectTypeDecoder : Json.Decode.Decoder ProblemWithRCObjectObjectType
problemWithRCObjectObjectTypeDecoder =
    Json.Decode.string
        |> Json.Decode.andThen
            (\value ->
                case value of
                    "mediaRecord" ->
                        Json.Decode.succeed ProblemWithRCObjectObjectTypeMediaRecord

                    "exposition" ->
                        Json.Decode.succeed ProblemWithRCObjectObjectTypeExposition

                    other ->
                        Json.Decode.fail <| "Unknown type: " ++ other
            )



problemWithRCObjectProblemDecoder : Json.Decode.Decoder ProblemWithRCObjectProblem
problemWithRCObjectProblemDecoder =
    Json.Decode.string
        |> Json.Decode.andThen
            (\value ->
                case value of
                    "does not exist" ->
                        Json.Decode.succeed ProblemWithRCObjectProblemDoesNotExist

                    "insufficient permissions" ->
                        Json.Decode.succeed ProblemWithRCObjectProblemInsufficientPermissions

                    "conflict" ->
                        Json.Decode.succeed ProblemWithRCObjectProblemConflict

                    other ->
                        Json.Decode.fail <| "Unknown type: " ++ other
            )



shareStatusDecoder : Json.Decode.Decoder ShareStatus
shareStatusDecoder =
    Json.Decode.succeed ShareStatus
        |> decode "read" shareStatusReadDecoder 
        |> decode "write" shareStatusWriteDecoder 


shareStatusReadDecoder : Json.Decode.Decoder ShareStatusRead
shareStatusReadDecoder =
    Json.Decode.succeed ShareStatusRead
        |> decode "users" (Json.Decode.list Json.Decode.string) 
        |> decode "public" Json.Decode.bool 


shareStatusWriteDecoder : Json.Decode.Decoder ShareStatusWrite
shareStatusWriteDecoder =
    Json.Decode.succeed ShareStatusWrite
        |> decode "users" (Json.Decode.list Json.Decode.string) 


timePointerDecoder : Json.Decode.Decoder TimePointer
timePointerDecoder =
    Json.Decode.succeed TimePointer
        |> decode "hours" Json.Decode.int 
        |> decode "minutes" Json.Decode.int 
        |> decode "seconds" Json.Decode.int 
        |> decode "milliseconds" Json.Decode.int 


twoDPointerDecoder : Json.Decode.Decoder TwoDPointer
twoDPointerDecoder =
    Json.Decode.succeed TwoDPointer
        |> decode "unit"  
        |> decode "x" Json.Decode.float 
        |> decode "y" Json.Decode.float 


twoDPointerUnitDecoder : Json.Decode.Decoder TwoDPointerUnit
twoDPointerUnitDecoder =
    Json.Decode.string
        |> Json.Decode.andThen
            (\value ->
                case value of
                    "perc" ->
                        Json.Decode.succeed TwoDPointerUnitPerc

                    "pixel" ->
                        Json.Decode.succeed TwoDPointerUnitPixel

                    other ->
                        Json.Decode.fail <| "Unknown type: " ++ other
            )



vocabularyTermDecoder : Json.Decode.Decoder VocabularyTerm
vocabularyTermDecoder =
    Json.Decode.succeed VocabularyTerm
        |> maybeDecode "id" Json.Decode.string Nothing
        |> maybeDecode "externalURI" Json.Decode.string Nothing
        |> decode "terms" (Json.Decode.list multiLangStringDecoder) 




-- HELPER


type alias EncodedField =
    Maybe ( String, Json.Encode.Value )


encodeObject : List EncodedField -> Json.Encode.Value
encodeObject =
    Json.Encode.object << List.filterMap identity


encode : String -> (a -> Json.Encode.Value) -> a -> EncodedField
encode key encoder value =
    Just ( key, encoder value )


encodeNullable : String -> (a -> Json.Encode.Value) -> Maybe a -> EncodedField
encodeNullable key encoder value =
    Just ( key, Maybe.withDefault Json.Encode.null (Maybe.map encoder value) )


maybeEncode : String -> (a -> Json.Encode.Value) -> Maybe a -> EncodedField
maybeEncode key encoder =
    Maybe.map (Tuple.pair key << encoder)


maybeEncodeNullable : String -> (a -> Json.Encode.Value) -> Maybe a -> EncodedField
maybeEncodeNullable =
    encodeNullable


decode : String -> Json.Decode.Decoder a -> Json.Decode.Decoder (a -> b) -> Json.Decode.Decoder b
decode key decoder =
    decodeChain (Json.Decode.field key decoder)


decodeLazy : (a -> c) -> String -> Json.Decode.Decoder a -> Json.Decode.Decoder (c -> b) -> Json.Decode.Decoder b
decodeLazy f key decoder =
    decodeChainLazy f (Json.Decode.field key decoder)


decodeNullable : String -> Json.Decode.Decoder a -> Json.Decode.Decoder (Maybe a -> b) -> Json.Decode.Decoder b
decodeNullable key decoder =
    decodeChain (maybeField key decoder Nothing)


decodeNullableLazy : (Maybe a -> c) -> String -> Json.Decode.Decoder a -> Json.Decode.Decoder (c -> b) -> Json.Decode.Decoder b
decodeNullableLazy f key decoder =
    decodeChainLazy f (maybeField key decoder Nothing)


maybeDecode : String -> Json.Decode.Decoder a -> Maybe a -> Json.Decode.Decoder (Maybe a -> b) -> Json.Decode.Decoder b
maybeDecode key decoder fallback =
    -- let's be kind to null-values as well
    decodeChain (maybeField key decoder fallback)


maybeDecodeLazy : (Maybe a -> c) -> String -> Json.Decode.Decoder a -> Maybe a -> Json.Decode.Decoder (c -> b) -> Json.Decode.Decoder b
maybeDecodeLazy f key decoder fallback =
    -- let's be kind to null-values as well
    decodeChainLazy f (maybeField key decoder fallback)


maybeDecodeNullable : String -> Json.Decode.Decoder a -> Maybe a -> Json.Decode.Decoder (Maybe a -> b) -> Json.Decode.Decoder b
maybeDecodeNullable key decoder fallback =
    decodeChain (maybeField key decoder fallback)


maybeDecodeNullableLazy : (Maybe a -> c) -> String -> Json.Decode.Decoder a -> Maybe a -> Json.Decode.Decoder (c -> b) -> Json.Decode.Decoder b
maybeDecodeNullableLazy f key decoder fallback =
    decodeChainLazy f (maybeField key decoder fallback)


maybeField : String -> Json.Decode.Decoder a -> Maybe a -> Json.Decode.Decoder (Maybe a)
maybeField key decoder fallback =
    let
        fieldDecoder =
            Json.Decode.field key Json.Decode.value

        valueDecoder =
            Json.Decode.oneOf [ Json.Decode.map Just decoder, Json.Decode.null fallback ]

        decodeObject rawObject =
            case Json.Decode.decodeValue fieldDecoder rawObject of
                Ok rawValue ->
                    case Json.Decode.decodeValue valueDecoder rawValue of
                        Ok value ->
                            Json.Decode.succeed value

                        Err error ->
                            Json.Decode.fail (Json.Decode.errorToString error)

                Err _ ->
                    Json.Decode.succeed fallback
    in
    Json.Decode.value
        |> Json.Decode.andThen decodeObject


decodeChain : Json.Decode.Decoder a -> Json.Decode.Decoder (a -> b) -> Json.Decode.Decoder b
decodeChain =
    Json.Decode.map2 (|>)


decodeChainLazy : (a -> c) -> Json.Decode.Decoder a -> Json.Decode.Decoder (c -> b) -> Json.Decode.Decoder b
decodeChainLazy f =
    decodeChain << Json.Decode.map f