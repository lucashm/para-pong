module Model exposing (..)
import Collage exposing (..)
import Element exposing (..)
import Keyboard.Extra exposing (..)
import Color exposing (blue, red, purple)
import Time exposing (..)

type alias Model =
    { player1 : Collage.Form
    , player2 : Collage.Form
    , player1Position : Float
    , pressedKeys : List Key
    , time : Time
    , background : Collage.Form}


init : Model
init =
     { player1 = createPlayer1
     , player2 = createPlayer2
     , player1Position = 0
     , pressedKeys = []
     , time = 0
     , background = createBackground }

createPlayer1 : Collage.Form
createPlayer1 =
    Collage.collage 10 90 [ Collage.filled blue (Collage.rect 10 90)]
    |> toForm
    |> Collage.move (-235, 0)

createPlayer2 : Collage.Form
createPlayer2 =
    Collage.collage 10 90 [ Collage.filled blue (Collage.rect 10 90)]
    |> toForm
    |> Collage.move (235, 0)

createBackground : Collage.Form
createBackground =
    Collage.collage 500 500 [ Collage.filled  red (Collage.rect 500 500) ]
    |> toForm
