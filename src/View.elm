module View exposing (..)
import Msg
import Model
import Html exposing (Html, text, div, img)
import Html.Attributes exposing (src, style)
import Html exposing (Html)
import Element exposing (..)
import Style exposing (..)
import Collage exposing (..)
import Keyboard.Extra exposing (..)

type alias Model =
  Model.Model

type alias Msg =
  Msg.Msg


view : Model -> Html Msg
view model =
    let
      wasd =
        Keyboard.Extra.wasd model.pressedKeys
    in
      div [style backgroundStyle]
          [ toHtml ( Collage.collage 500 500 [model.background , model.player1, model.player2] )
          , Html.text (toString model.pressedKeys)
          ]
