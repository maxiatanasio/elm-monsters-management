module Main exposing (..)

import Http exposing (get, Error, expectJson)
import Html exposing (Html)

import Decoders exposing (monsterListDecoder)
import PageDataModel exposing (MonstersMessage(..), ModalStatus(..),Model)
import Views.MainView exposing (mainView)
import Actions exposing (Message(..))


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
        url = "src/mocks/monsters.json",
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
    mainView model

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
