module Model exposing (..)

import Message exposing (Msg)


type alias Model =
    { menuOpen : Bool }


init : ( Model, Cmd Msg )
init =
    ( { menuOpen = False
      }
    , Cmd.none
    )
