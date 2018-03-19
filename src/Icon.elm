module Icon exposing (..)

import Dict
import Char
import Element exposing (Element, el, text)
import Message exposing (Msg)
import Styles exposing (Style(Icon))
import Icon.Types exposing (IconDict)


icon : Maybe IconDict -> String -> Element Style variation Msg
icon definitions name =
    let
        c =
            String.fromChar << Char.fromCode

        result =
            definitions
                |> Maybe.andThen (Dict.get name)

        code =
            Maybe.withDefault 0xE033 result
    in
        el Icon [] <| text <| c code
