module Message exposing (..)

import Http
import Icon.Types exposing (IconDict)


type Msg
    = ToggleMenu
    | CloseMenu
    | LoadIcons (Result Http.Error IconDict)
