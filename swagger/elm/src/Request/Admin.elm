{-
   Media Repository API
   This is the Research Catalouge Media Repository API

   The version of the OpenAPI document: 1.0.0-oas3
   Contact: support@researchcatalogue.net

   NOTE: This file is auto generated by the openapi-generator.
   https://github.com/openapitools/openapi-generator.git
   Do not edit this file manually.
-}


module Request.Admin exposing (deletePredicate, postPredicate, putPredicate)

import Data.Predicate as Predicate exposing (Predicate)
import Dict
import Http
import Json.Decode as Decode
import Url.Builder as Url




basePath : String
basePath =
    "http://localhost"


deletePredicate :
    { onSend : Result Http.Error () -> msg



    , predicateId : String

    }
    -> Cmd msg
deletePredicate params =
    Http.request
        { method = "DELETE"
        , headers = List.filterMap identity []
        , url = Url.crossOrigin basePath
            ["predicates", identity params.predicateId]
            (List.filterMap identity [])
        , body = Http.emptyBody
        , expect = Http.expectWhatever params.onSend
        , timeout = Just 30000
        , tracker = Nothing
        }


postPredicate :
    { onSend : Result Http.Error Predicate -> msg


    , body : Maybe Predicate


    }
    -> Cmd msg
postPredicate params =
    Http.request
        { method = "POST"
        , headers = List.filterMap identity []
        , url = Url.crossOrigin basePath
            ["predicates"]
            (List.filterMap identity [])
        , body = Maybe.withDefault Http.emptyBody <| Maybe.map (Http.jsonBody << Predicate.encode) params.body
        , expect = Http.expectJson params.onSend Predicate.decoder
        , timeout = Just 30000
        , tracker = Nothing
        }


putPredicate :
    { onSend : Result Http.Error () -> msg


    , body : Maybe Predicate
    , predicateId : String

    }
    -> Cmd msg
putPredicate params =
    Http.request
        { method = "PUT"
        , headers = List.filterMap identity []
        , url = Url.crossOrigin basePath
            ["predicates", identity params.predicateId]
            (List.filterMap identity [])
        , body = Maybe.withDefault Http.emptyBody <| Maybe.map (Http.jsonBody << Predicate.encode) params.body
        , expect = Http.expectWhatever params.onSend
        , timeout = Just 30000
        , tracker = Nothing
        }
