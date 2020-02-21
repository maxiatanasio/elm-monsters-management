module Views.StyledViews exposing (..)

import Html exposing (Html, div, hr, span, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)

import Actions exposing (Message(..))

container: List (Html Message) -> Html Message
container children =
    div [
        style "width" "1024px",
        style "margin" "auto",
        style "padding" "40px 0"
    ] children

goodMessage: String -> Html Message
goodMessage message =
    span [
        classList [
            ("text-gray-600", True)
        ]
    ] [text message]

badMessage: String -> Html Message
badMessage message =
    span [
        style "display" "inline-block",
        style "padding" "12px 20px",
        style "color" "white",
        style "background-color" "#e53935",
        style "border-radius" "8px"
    ] [text message]

flexContainer: List (Html Message) -> Html Message
flexContainer children =
    div [
        classList [
            ("flex", True),
            ("flex-wrap", True),
            ("my-2", True),
            ("-mx-2", True)
        ]
    ] children

card: Html Message -> Html Message
card children =
    div [
        classList [
            ("max-w", True),
            ("rounded", True),
            ("overflow-hidden", True),
            ("shadow-lg", True),
            ("p-4", True)
        ]
    ] [children]

modal: List (Html Message) -> Html Message
modal children =
    div [
        style "position" "fixed",
        style "width" "100%",
        style "height" "100%",
        style "top" "0",
        style "left" "0",
        style "background-color" "rgba(100,100,100,0.5)",
        style "z-index" "999999",
        style "display" "flex",
        style "align-items" "center",
        style "justify-content" "center",
        onClick CloseModal
    ] [
        div [
            style "padding" "15px",
            style "min-width" "150px",
            style "background-color" "white",
            style "border-radius" "5px"
        ] children
    ]

button: String -> Message -> Html Message
button buttonText msg =
    Html.button [
        classList [
            ("bg-blue-500", True),
            ("hover:bg-blue-700", True),
            ("text-white", True),
            ("font-bold", True),
            ("py-2", True),
            ("px-4", True),
            ("rounded", True)
        ],
        onClick msg
    ] [
        text buttonText
    ]

separator: () -> Html Message
separator _ =
    hr [
        classList [
            ("my-8", True),
            ("border-b-2", True),
            ("border-gray-200", True)
        ]
    ] []
