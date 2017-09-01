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
    | UpdatePlayer2Position Float
    | MovePlayer2 Float
    | Tick Time


update : Msg -> Model.Model -> ( Model.Model, Cmd Msg )
update msg model =
    case msg of

        Tick newTime ->
          let
            direction1 = getPlayer1Command model.pressedKeys
            direction2 = getPlayer2Command model.pressedKeys
          in
            update (MovePlayer1 direction1) { model | time = newTime }
            |> andThen  (MovePlayer2 direction2)

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

        MovePlayer2 deslocation ->
          let
            newModel = moveY deslocation model.player2
          in
            case model.player2Position of
              205 -> --   205 = 250 - 45 : limit of where the player can go
                  case deslocation of
                      (-5) ->
                        update (UpdatePlayer2Position deslocation) {model | player2 = newModel}

                      _ ->
                        (model, Cmd.none)

              (-205) ->
                  case deslocation of
                      (-5) ->
                        (model, Cmd.none)

                      _ ->
                        update (UpdatePlayer2Position deslocation) {model | player2 = newModel}


              _ ->
                  update (UpdatePlayer2Position deslocation) {model | player2 = newModel}

        UpdatePlayer2Position deslocation ->
          let
            newModel = model.player2Position + deslocation
          in
            {model | player2Position = newModel} ! []

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

getPlayer2Command : List Key -> Float
getPlayer2Command pressedKeys =
  if member ArrowUp pressedKeys then
      5
  else if member ArrowDown pressedKeys then
      -5
  else
      0

andThen : Msg -> ( Model, Cmd Msg ) -> ( Model, Cmd Msg )
andThen msg ( model, cmd ) =
    let
        ( newmodel, newcmd ) =
            update msg model
    in
        newmodel ! [ cmd, newcmd ]
