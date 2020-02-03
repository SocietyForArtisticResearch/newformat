{-
   Media Repository API
   This is the Research Catalouge Media Repository API

   The version of the OpenAPI document: 1.0.0-oas3
   Contact: support@researchcatalogue.net

   NOTE: This file is auto generated by the openapi-generator.
   https://github.com/openapitools/openapi-generator.git
   Do not edit this file manually.
-}


module Data.InlineObject exposing (InlineObject, decoder, encode, encodeWithTag, toString)

import Data.MediaRecord as MediaRecord exposing (MediaRecord)
import Dict exposing (Dict)
import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline exposing (optional, required)
import Json.Encode as Encode


type alias InlineObject =
    { mediaRecord : Maybe (MediaRecord)
    , file : Maybe (String)
    }


decoder : Decoder InlineObject
decoder =
    Decode.succeed InlineObject
        |> optional "mediaRecord" (Decode.nullable MediaRecord.decoder) Nothing
        |> optional "file" (Decode.nullable Decode.string) Nothing



encode : InlineObject -> Encode.Value
encode =
    Encode.object << encodePairs


encodeWithTag : ( String, String ) -> InlineObject -> Encode.Value
encodeWithTag (tagField, tag) model =
    Encode.object <| encodePairs model ++ [ ( tagField, Encode.string tag ) ]


encodePairs : InlineObject -> List (String, Encode.Value)
encodePairs model =
    [ ( "mediaRecord", Maybe.withDefault Encode.null (Maybe.map MediaRecord.encode model.mediaRecord) )
    , ( "file", Maybe.withDefault Encode.null (Maybe.map Encode.string model.file) )
    ]



toString : InlineObject -> String
toString =
    Encode.encode 0 << encode




