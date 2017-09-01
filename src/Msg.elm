module Msg exposing (..)
import Keyboard.Extra exposing (Key(..))
import Model
import Time exposing (..)
import List exposing (..)
import Collage exposing (..)


type alias Model =
  Model.Model

type Msg
    = KeyboardMsg Keyboard.Extra.Msg
    | UpdatePlayer1Position Float
    | MovePlayer1 Float
    | Tick Time


update : Msg -> Model.Model -> ( Model.Model, Cmd Msg )
update msg model =
    case msg of

        Tick newTime ->
          let
            direction = getPlayer1Command model.pressedKeys
          in
            update (MovePlayer1 direction) { model | time = newTime }

        MovePlayer1 deslocation ->
          let
            newModel = moveY deslocation model.player1
          in
            case model.player1Position of
              205 -> --   205 = 250 - 45 : limit of where the player can go
                  case deslocation of
                      (-5) ->
                        update (UpdatePlayer1Position deslocation) {model | player1 = newModel}

                      _ ->
                        (model, Cmd.none)

              (-205) ->
                  case deslocation of
                      (-5) ->
                        (model, Cmd.none)

                      _ ->
                        update (UpdatePlayer1Position deslocation) {model | player1 = newModel}


              _ ->
                  update (UpdatePlayer1Position deslocation) {model | player1 = newModel}

        UpdatePlayer1Position deslocation ->
          let
            newModel = model.player1Position + deslocation
          in
            {model | player1Position = newModel} ! []


        KeyboardMsg keyMsg ->
          ( { model | pressedKeys = Keyboard.Extra.update keyMsg model.pressedKeys }
                , Cmd.none
          )


getPlayer1Command : List Key -> Float
getPlayer1Command pressedKeys =
  if member CharW pressedKeys then
      5
  else if member CharS pressedKeys then
      -5
  else
      0
