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
    , player2Position : Float
    , pressedKeys : List Key
    , time : Time
    , background : Collage.Form
    , ball : Collage.Form
    , ballPosition : (Float, Float)
    , ballSpeed : (Float, Float)
    , obstacle: Collage.Form
    , obstaclePosition: (Float, Bool)
    }


init : Model
init =
     { player1 = createPlayer1
     , player2 = createPlayer2
     , player1Position = 0
     , player2Position = 0
     , pressedKeys = []
     , time = 0
     , background = createBackground
     , ball = createBall
     , ballPosition = (0,0)
     , ballSpeed = (5, 2)
     , obstacle = createObstacle
     , obstaclePosition = (0, False)
      }


createObstacle : Collage.Form
createObstacle =
    Collage.filled blue (Collage.rect 10 90)
    |> Collage.move (0, 0)


createBall : Collage.Form
createBall =
    Collage.filled blue (Collage.rect 10 10)
    |> Collage.move (0, 0)

createPlayer1 : Collage.Form
createPlayer1 =
    Collage.filled blue (Collage.rect 10 90)
    |> Collage.move (-235, 0)

createPlayer2 : Collage.Form
createPlayer2 =
    Collage.filled blue (Collage.rect 10 90)
    |> Collage.move (235, 0)

createBackground : Collage.Form
createBackground =
    Collage.filled  red (Collage.rect 500 500)
