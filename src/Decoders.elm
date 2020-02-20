module Decoders exposing (..)

import Models exposing (Monster)

import Json.Decode as Json

monsterDecoder: Json.Decoder Monster
monsterDecoder =
    Json.map5 Monster
        (Json.field "id" Json.int)
        (Json.field "name" Json.string)
        (Json.field "pow" Json.int)
        (Json.field "lif" Json.int)
        (Json.field "spd" Json.int)

monsterListDecoder: Json.Decoder (List Monster)
monsterListDecoder =
    Json.field "monsters" (Json.list monsterDecoder)
