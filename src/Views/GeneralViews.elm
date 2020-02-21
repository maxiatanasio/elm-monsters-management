module Views.GeneralViews exposing (..)

import Html exposing (Html, p, text, h2, table, tr, td, th, div)
import Html.Attributes exposing (class, classList, style)

import Models exposing (Monster)
import PageDataModel exposing (Model, MonstersMessage(..))
import Actions exposing (Message)
import Views.StyledViews exposing (goodMessage, badMessage,card, flexContainer)

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
    div [
        classList [
            ("w-1/3", True),
            ("px-4", True),
            ("mb-4", True)
        ]
    ] [
        card (
            div [] [
                h2 [
                    class "w-0"
                ] [text monster.name],
                    p [] [text "Attributes"],
                    table [
                        class "table-auto",
                        class "w-full"
                    ] [
                        tr [] [
                            monstersTableTh "Life",
                            monstersTableTd (String.fromInt monster.lif)
                        ],
                        tr [] [
                            monstersTableTh "Power",
                            monstersTableTd (String.fromInt monster.pow)
                        ],
                        tr [] [
                            monstersTableTh "Speed",
                            monstersTableTd (String.fromInt monster.spd)
                        ]
                    ]
            ]
        )
    ]

monstersTableTh: String -> Html Message
monstersTableTh headerText =
    th [
        classList [
            ("px-4", True),
            ("py-2", True),
            ("bg-gray-100", True),
            ("border", True),
            ("text-left", True),
            ("w-2/5", True)
        ]
    ] [text headerText]

monstersTableTd: String -> Html Message
monstersTableTd attribute =
    td [
        classList [
            ("w-3/5", True),
            ("px-4", True),
            ("py-2", True),
            ("text-right", True),
            ("border", True)
        ]
    ] [text attribute]

monsterCardContainer: MonstersMessage -> Html Message
monsterCardContainer mons =
    case mons of
        Loading ->
            text ""

        Failure ->
            text ""

        Success monsters ->
            flexContainer (List.map monsterCard monsters)
