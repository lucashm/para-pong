module Main exposing (..)
import Time exposing (..)
import Keyboard.Extra exposing (..)
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

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.batch
  [ Sub.map Msg.KeyboardMsg Keyboard.Extra.subscriptions
  , Time.every ((1000/60*millisecond)) Msg.Tick
  ]
