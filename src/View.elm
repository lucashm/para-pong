module View exposing (..)

import Msg
import Model
import Html exposing (Html, text, div, img)
import Html.Attributes exposing (src, style)
import Html exposing (Html)
import Element exposing (..)
import Style exposing (..)

type alias Model =
  Model.Model

type alias Msg =
  Msg.Msg


view : Model -> Html Msg
view model =
    div [style backgroundStyle]
      [ toHtml model.background ]
