module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (src)
import Html.Events exposing (..)



---- MODEL ----


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )


phrase : String
phrase =
    "like and subscribe"



---- UPDATE ----


type Msg
    = Guess String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Guess char ->
            ( model, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    let
        phraseHtml =
            phrase
                |> String.split ""
                |> List.map
                    (\char ->
                        if char == " " then
                            " "

                        else
                            "_"
                    )
                |> List.map
                    (\char ->
                        span [] [ text char ]
                    )
                |> div []

        buttonHtml =
            "abcdefghijklmnopqrstuvwxyz"
                |> String.split ""
                |> List.map
                    (\char ->
                        button [ onClick <| Guess char ] [ text char ]
                    )
                |> div []
    in
    div []
        [ phraseHtml
        , buttonHtml
        ]



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
