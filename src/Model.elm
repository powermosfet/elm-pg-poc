module Model exposing (..)

import Message exposing (Msg)


type alias Model =
    Int


init : ( Model, Cmd Msg )
init =
    ( 0, Cmd.none )
