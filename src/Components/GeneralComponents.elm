module Components.GeneralComponents exposing (..)

import Html exposing (Html, p, text, h2, table, tr, td, th, div)
import Html.Attributes exposing (style)

import Models exposing (Monster)
import PageModels exposing (Model, MonstersMessage(..))
import UpdateType exposing (Message)
import Components.StyledComponents exposing (goodMessage, badMessage,card, flexContainer)

monstersCount: Model -> Html Message
monstersCount model =
    case model.monsters of
        Loading ->
            p [] [text "Still loading..."]

        Failure ->
            badMessage "There was a problem getting the monsters"

        Success monsters ->
            goodMessage ("Showing " ++ (String.fromInt (List.length monsters)) ++ " monsters")

monsterCard: Monster -> Html Message
monsterCard monster =
    card (
        div [] [
            h2 [
                style "margin" "0"
            ] [text monster.name],
                p [] [text "Attributes"],
                table [
                    style "width" "100%",
                    style "border-spacing" "0",
                    style "margin" "auto"
                ] [
                    tr [] [
                        th [
                            style "width" "40%",
                            style "text-align" "left",
                            style "background-color" "#ddd",
                            style "padding" "8px",
                            style "border" "1px solid #ccc",
                            style "border-bottom" "none"
                        ] [text "Life"],
                        td [
                            style "width" "60%",
                            style "text-align" "right",
                            style "padding" "8px",
                            style "border" "1px solid #ccc",
                            style "border-left" "none",
                            style "border-bottom" "none"
                        ] [text (String.fromInt monster.lif)]
                    ],
                    tr [] [
                        th [
                            style "width" "40%",
                            style "text-align" "left",
                            style "background-color" "#ddd",
                            style "padding" "8px",
                            style "border" "1px solid #ccc",
                            style "border-bottom" "none"
                        ] [text "Power"],
                        td [
                            style "width" "60%",
                            style "text-align" "right",
                            style "padding" "8px",
                            style "border" "1px solid #ccc",
                            style "border-left" "none",
                            style "border-bottom" "none"
                        ] [text (String.fromInt monster.pow)]
                    ],
                    tr [] [
                        th [
                            style "width" "40%",
                            style "text-align" "left",
                            style "background-color" "#ddd",
                            style "padding" "8px",
                            style "border" "1px solid #ccc"
                        ] [text "Speed"],
                        td [
                            style "width" "60%",
                            style "text-align" "right",
                            style "padding" "8px",
                            style "border" "1px solid #ccc",
                            style "border-left" "none"
                        ] [text (String.fromInt monster.spd)]
                    ]
                ]
        ]
    )

monsterCardContainer: MonstersMessage -> Html Message
monsterCardContainer mons =
    case mons of
        Loading ->
            text ""

        Failure ->
            text ""

        Success monsters ->
            flexContainer (List.map monsterCard monsters)
