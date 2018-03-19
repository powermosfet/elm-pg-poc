module Commands exposing (..)

import Http
import Message exposing (Msg(LoadIcons))
import Icon.Types exposing (IconDict)
import Icon.Decoder exposing (selection)


getIcons : Http.Request IconDict
getIcons =
    Http.get "icomoon/selection.json" selection


requestIcons : Cmd Msg
requestIcons =
    Http.send LoadIcons getIcons
