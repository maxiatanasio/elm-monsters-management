module Views.MainView exposing (..)

import Actions exposing (Message(..))
import Html exposing (Html, div, text)
import Html.Attributes exposing (style)
import PageDataModel exposing (ModalStatus(..), Model)
import Views.GeneralViews exposing (monsterCardContainer, monstersCount)
import Views.StyledViews exposing (button, container, modal)
mainView: Model -> Html Message
mainView model =
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
