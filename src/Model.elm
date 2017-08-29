module Model exposing (..)
import Collage exposing (..)
import Element exposing (..)
import Color exposing (blue, red, purple)

type alias Model =
    { player : Collage.Form
    , background : Collage.Form}


init : Model
init =
     { player = createPlayer
     , background = createBackground }

createPlayer : Collage.Form
createPlayer =
    Collage.collage 10 90 [ Collage.filled blue (Collage.rect 10 90)]
    |> toForm
    |> Collage.move (-230, 0)

createBackground : Collage.Form
createBackground =
    Collage.collage 500 500 [ Collage.filled  red (Collage.rect 500 500) ]
    |> toForm
