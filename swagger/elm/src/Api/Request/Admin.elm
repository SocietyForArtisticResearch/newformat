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


module Api.Request.Admin exposing
    ( deleteKeywordsClosed
    , deletePredicate
    , postKeywordsClosed
    , postPredicate
    , putKeywordsClosed
    , putPredicate
    )

import Api
import Api.Data
import Dict
import Http
import Json.Decode
import Json.Encode



deleteKeywordsClosed : String -> Api.Request ()
deleteKeywordsClosed keywordId_path =
    Api.request
        "DELETE"
        "/keywords/closed/{keywordId}"
        [ ( "keywordId", identity keywordId_path ) ]
        []
        []
        Nothing
        (Json.Decode.succeed ())



deletePredicate : String -> Api.Request ()
deletePredicate predicateId_path =
    Api.request
        "DELETE"
        "/predicates/{predicateId}"
        [ ( "predicateId", identity predicateId_path ) ]
        []
        []
        Nothing
        (Json.Decode.succeed ())



postKeywordsClosed : Api.Data.VocabularyTerm -> Api.Request Api.Data.VocabularyTerm
postKeywordsClosed vocabularyTerm_body =
    Api.request
        "POST"
        "/keywords/closed"
        []
        []
        []
        (Just (Api.Data.encodeVocabularyTerm vocabularyTerm_body))
        Api.Data.vocabularyTermDecoder



postPredicate : Api.Data.Predicate -> Api.Request Api.Data.Predicate
postPredicate predicate_body =
    Api.request
        "POST"
        "/predicates"
        []
        []
        []
        (Just (Api.Data.encodePredicate predicate_body))
        Api.Data.predicateDecoder



putKeywordsClosed : String -> Api.Data.VocabularyTerm -> Api.Request ()
putKeywordsClosed keywordId_path vocabularyTerm_body =
    Api.request
        "PUT"
        "/keywords/closed/{keywordId}"
        [ ( "keywordId", identity keywordId_path ) ]
        []
        []
        (Just (Api.Data.encodeVocabularyTerm vocabularyTerm_body))
        (Json.Decode.succeed ())



putPredicate : String -> Api.Data.Predicate -> Api.Request ()
putPredicate predicateId_path predicate_body =
    Api.request
        "PUT"
        "/predicates/{predicateId}"
        [ ( "predicateId", identity predicateId_path ) ]
        []
        []
        (Just (Api.Data.encodePredicate predicate_body))
        (Json.Decode.succeed ())
