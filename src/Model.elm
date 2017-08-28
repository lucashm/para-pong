module Model exposing (..)
import Collage exposing (..)
import Element exposing (..)
import Color exposing (blue, red, purple)

type alias Model =
    {background : Element.Element}


init : ( Model )
init =
    ( { background = createBackground } )


createBackground : Element.Element
createBackground =
    Collage.collage 500 500 [ Collage.filled  purple (Collage.rect 500 500) ]
