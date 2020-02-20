module Components.StyledComponents exposing (..)

import Html exposing (Html, div, text, span)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)

import UpdateType exposing (Message(..))

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
        style "display" "inline-block",
        style "padding" "12px 20px",
        style "color" "white",
        style "background-color" "#43a047",
        style "border-radius" "8px"
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
        style "display" "flex",
        style "justify-content" "space-between",
        style "margin" "20px 0",
        style "flex-wrap" "wrap"
    ] children

card: Html Message -> Html Message
card children =
    div [
        style "border" "1px solid rgba(100,100,100,0.5)",
        style "padding" "10px",
        style "border-radius" "6px",
        style "width" "250px",
        style "margin" "10px 0"
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
        style "padding" "12px 20px",
        style "border-radius" "8px",
        onClick msg
    ] [
        text buttonText
    ]
