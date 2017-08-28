module Main exposing (..)


import Html exposing (Html)
import Model
import Msg
import View


type alias Model =
  Model.Model

type alias Msg =
  Msg.Msg

---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = View.view
        , init = (Model.init, Cmd.none)
        , update = Msg.update
        , subscriptions = always Sub.none
        }
