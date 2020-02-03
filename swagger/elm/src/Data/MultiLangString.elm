{-
   Media Repository API
   This is the Research Catalouge Media Repository API

   The version of the OpenAPI document: 1.0.0-oas3
   Contact: support@researchcatalogue.net

   NOTE: This file is auto generated by the openapi-generator.
   https://github.com/openapitools/openapi-generator.git
   Do not edit this file manually.
-}


module Data.MultiLangString exposing (MultiLangString, decoder, encode, encodeWithTag, toString)

import Dict exposing (Dict)
import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline exposing (optional, required)
import Json.Encode as Encode


{-| a string with language tag
-}
type alias MultiLangString =
    { lang : String
    , value : String
    }


decoder : Decoder MultiLangString
decoder =
    Decode.succeed MultiLangString
        |> required "lang" Decode.string
        |> required "value" Decode.string



encode : MultiLangString -> Encode.Value
encode =
    Encode.object << encodePairs


encodeWithTag : ( String, String ) -> MultiLangString -> Encode.Value
encodeWithTag (tagField, tag) model =
    Encode.object <| encodePairs model ++ [ ( tagField, Encode.string tag ) ]


encodePairs : MultiLangString -> List (String, Encode.Value)
encodePairs model =
    [ ( "lang", Encode.string model.lang )
    , ( "value", Encode.string model.value )
    ]



toString : MultiLangString -> String
toString =
    Encode.encode 0 << encode



