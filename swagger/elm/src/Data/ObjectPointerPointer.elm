{-
   Media Repository API
   This is the Research Catalouge Media Repository API

   The version of the OpenAPI document: 1.0.0-oas3
   Contact: support@researchcatalogue.net

   NOTE: This file is auto generated by the openapi-generator.
   https://github.com/openapitools/openapi-generator.git
   Do not edit this file manually.
-}


module Data.ObjectPointerPointer exposing (ObjectPointerPointer, decoder, encode, encodeWithTag, toString)

import Data.TimePointer as TimePointer exposing (TimePointer)
import Data.TwoDPointer as TwoDPointer exposing (TwoDPointer)
import Data.CounterPointer as CounterPointer exposing (CounterPointer)
import Data.ChannelPointer as ChannelPointer exposing (ChannelPointer)
import Dict exposing (Dict)
import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline exposing (optional, required)
import Json.Encode as Encode


type alias ObjectPointerPointer =
    { timePointer : Maybe (TimePointer)
    , twoDPointer : Maybe (TwoDPointer)
    , counterPointer : Maybe (CounterPointer)
    , channelPointer : Maybe (ChannelPointer)
    }


decoder : Decoder ObjectPointerPointer
decoder =
    Decode.succeed ObjectPointerPointer
        |> optional "timePointer" (Decode.nullable TimePointer.decoder) Nothing
        |> optional "twoDPointer" (Decode.nullable TwoDPointer.decoder) Nothing
        |> optional "counterPointer" (Decode.nullable CounterPointer.decoder) Nothing
        |> optional "channelPointer" (Decode.nullable ChannelPointer.decoder) Nothing



encode : ObjectPointerPointer -> Encode.Value
encode =
    Encode.object << encodePairs


encodeWithTag : ( String, String ) -> ObjectPointerPointer -> Encode.Value
encodeWithTag (tagField, tag) model =
    Encode.object <| encodePairs model ++ [ ( tagField, Encode.string tag ) ]


encodePairs : ObjectPointerPointer -> List (String, Encode.Value)
encodePairs model =
    [ ( "timePointer", Maybe.withDefault Encode.null (Maybe.map TimePointer.encode model.timePointer) )
    , ( "twoDPointer", Maybe.withDefault Encode.null (Maybe.map TwoDPointer.encode model.twoDPointer) )
    , ( "counterPointer", Maybe.withDefault Encode.null (Maybe.map CounterPointer.encode model.counterPointer) )
    , ( "channelPointer", Maybe.withDefault Encode.null (Maybe.map ChannelPointer.encode model.channelPointer) )
    ]



toString : ObjectPointerPointer -> String
toString =
    Encode.encode 0 << encode




