module Model exposing (..)

import Message exposing (Msg)
import Commands exposing (requestIcons)
import Icon.Types exposing (IconDict)


type alias Model =
    { menuOpen : Bool
    , iconDefinitions : Maybe IconDict
    }


init : ( Model, Cmd Msg )
init =
    ( { menuOpen = False
      , iconDefinitions = Nothing
      }
    , requestIcons
    )
