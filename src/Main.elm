module Main exposing (..)

import Http exposing (get, Error, expectJson)
import Html exposing (Html, div, text)
import Html.Attributes exposing (style)

import Decoders exposing (monsterListDecoder)
import PageModels exposing (MonstersMessage(..), ModalStatus(..),Model)
import Components.GeneralComponents exposing (monstersCount, monsterCardContainer)
import Components.StyledComponents exposing (container, modal, button)
import UpdateType exposing (Message(..))


import Browser

-- Model
init: () -> (Model,  Cmd Message)
init _ =
    (
    {
        monsters = Loading,
        modal = Close
    },
    get {
        url = "mocks/monsters.json",
        expect = expectJson GotMonsters monsterListDecoder
        }
    )

-- Update

update: Message -> Model -> (Model, Cmd Message)
update message model =
    case message of
        GotMonsters result ->
            case result of
                Ok monsters ->
                    ({model | monsters = Success monsters}, Cmd.none)
                Err error ->
                    ({ model | monsters = Failure }, Cmd.none)

        OpenModal ->
            ({model | modal = Open}, Cmd.none)

        CloseModal ->
            ({model | modal = Close}, Cmd.none)

-- View

view: Model -> Html Message
view model =
    container [
        div [ style "margin-bottom" "20px"] [
            button "Add new monster" OpenModal
        ],
        (monstersCount model),
        monsterCardContainer model.monsters,
        (case model.modal of
            Open ->
                modal [text "testing modal"]
            Close ->
                text ""
        )

    ]

-- Subscriptions
subscriptions: Model -> Sub Message
subscriptions model =
    Sub.none


-- Main
main =
    Browser.element {
    init = init,
    update = update,
    subscriptions = subscriptions,
    view = view
    }
