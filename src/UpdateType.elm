module UpdateType exposing (..)

import Http exposing (Error)
import Models exposing (Monster)

type Message =
    GotMonsters (Result Error (List Monster) )
    | OpenModal | CloseModal
