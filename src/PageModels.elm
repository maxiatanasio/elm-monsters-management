module PageModels exposing (..)

import Models exposing (Monster)

type MonstersMessage =
    Loading
    | Failure
    | Success (List Monster)

type ModalStatus =
    Open
    | Close

type alias Model =
    {
    monsters: MonstersMessage,
    modal: ModalStatus
    }
