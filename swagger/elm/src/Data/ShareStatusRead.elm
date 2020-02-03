{-
   Media Repository API
   This is the Research Catalouge Media Repository API

   The version of the OpenAPI document: 1.0.0-oas3
   Contact: support@researchcatalogue.net

   NOTE: This file is auto generated by the openapi-generator.
   https://github.com/openapitools/openapi-generator.git
   Do not edit this file manually.
-}


module Data.ShareStatusRead exposing (ShareStatusRead, decoder, encode, encodeWithTag, toString)

import Dict exposing (Dict)
import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline exposing (optional, required)
import Json.Encode as Encode


type alias ShareStatusRead =
    { users : (List String)
    , public : Bool
    }


decoder : Decoder ShareStatusRead
decoder =
    Decode.succeed ShareStatusRead
        |> required "users" (Decode.list Decode.string)
        |> required "public" Decode.bool



encode : ShareStatusRead -> Encode.Value
encode =
    Encode.object << encodePairs


encodeWithTag : ( String, String ) -> ShareStatusRead -> Encode.Value
encodeWithTag (tagField, tag) model =
    Encode.object <| encodePairs model ++ [ ( tagField, Encode.string tag ) ]


encodePairs : ShareStatusRead -> List (String, Encode.Value)
encodePairs model =
    [ ( "users", (Encode.list Encode.string) model.users )
    , ( "public", Encode.bool model.public )
    ]



toString : ShareStatusRead -> String
toString =
    Encode.encode 0 << encode



