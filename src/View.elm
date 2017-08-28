module View exposing (..)

import Msg
import Model
import Html exposing (Html, text, div, img)
import Html.Attributes exposing (src)
import Html exposing (Html)

type alias Model =
  Model.Model

type alias Msg =
  Msg.Msg


view : Model -> Html Msg
view model =
    div []
        [ img [ src "/logo.svg" ] []
        , div [] [ text "Your Elm App is working!" ]
        ]
