{-
   Media Repository API
   This is the Research Catalouge Media Repository API

   The version of the OpenAPI document: 1.0.0-oas3
   Contact: support@researchcatalogue.net

   NOTE: This file is auto generated by the openapi-generator.
   https://github.com/openapitools/openapi-generator.git
   Do not edit this file manually.
-}


module Data.TimePointer exposing (TimePointer, decoder, encode, encodeWithTag, toString)

import Dict exposing (Dict)
import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline exposing (optional, required)
import Json.Encode as Encode


type alias TimePointer =
    { hours : Int
    , minutes : Int
    , seconds : Int
    , milliseconds : Int
    }


decoder : Decoder TimePointer
decoder =
    Decode.succeed TimePointer
        |> required "hours" Decode.int
        |> required "minutes" Decode.int
        |> required "seconds" Decode.int
        |> required "milliseconds" Decode.int



encode : TimePointer -> Encode.Value
encode =
    Encode.object << encodePairs


encodeWithTag : ( String, String ) -> TimePointer -> Encode.Value
encodeWithTag (tagField, tag) model =
    Encode.object <| encodePairs model ++ [ ( tagField, Encode.string tag ) ]


encodePairs : TimePointer -> List (String, Encode.Value)
encodePairs model =
    [ ( "hours", Encode.int model.hours )
    , ( "minutes", Encode.int model.minutes )
    , ( "seconds", Encode.int model.seconds )
    , ( "milliseconds", Encode.int model.milliseconds )
    ]



toString : TimePointer -> String
toString =
    Encode.encode 0 << encode




