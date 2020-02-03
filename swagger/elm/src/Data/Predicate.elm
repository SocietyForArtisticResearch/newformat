{-
   Media Repository API
   This is the Research Catalouge Media Repository API

   The version of the OpenAPI document: 1.0.0-oas3
   Contact: support@researchcatalogue.net

   NOTE: This file is auto generated by the openapi-generator.
   https://github.com/openapitools/openapi-generator.git
   Do not edit this file manually.
-}


module Data.Predicate exposing (Predicate, decoder, encode, encodeWithTag, toString)

import Dict exposing (Dict)
import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline exposing (optional, required)
import Json.Encode as Encode


{-| a predicate used in a connection
-}
type alias Predicate =
    { id : Maybe (String)
    , predicate : String
    , uri : Maybe (String)
    }


decoder : Decoder Predicate
decoder =
    Decode.succeed Predicate
        |> optional "id" (Decode.nullable Decode.string) Nothing
        |> required "predicate" Decode.string
        |> optional "uri" (Decode.nullable Decode.string) Nothing



encode : Predicate -> Encode.Value
encode =
    Encode.object << encodePairs


encodeWithTag : ( String, String ) -> Predicate -> Encode.Value
encodeWithTag (tagField, tag) model =
    Encode.object <| encodePairs model ++ [ ( tagField, Encode.string tag ) ]


encodePairs : Predicate -> List (String, Encode.Value)
encodePairs model =
    [ ( "id", Maybe.withDefault Encode.null (Maybe.map Encode.string model.id) )
    , ( "predicate", Encode.string model.predicate )
    , ( "uri", Maybe.withDefault Encode.null (Maybe.map Encode.string model.uri) )
    ]



toString : Predicate -> String
toString =
    Encode.encode 0 << encode



