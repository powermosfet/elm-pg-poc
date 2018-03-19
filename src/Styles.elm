module Styles exposing (..)

import Color exposing (rgb)
import Style
import Style.Color as Color
import Style.Border as Border
import Style.Font as Font


type Style
    = NoStyle
    | Header
    | Body
    | Button
    | MenuList
    | MenuItem
    | Icon


styleSheet =
    Style.styleSheet
        [ Style.style NoStyle []
        , Style.style Header
            [ Color.background (rgb 0 153 255)
            , Font.typeface [ Font.font "helvetica" ]
            , Font.size (50)
            ]
        , Style.style Body
            [ Color.background (rgb 220 220 220) ]
        , Style.style Button
            []
        , Style.style MenuList
            [ Color.background (rgb 240 240 240)
            ]
        , Style.style MenuItem
            [ Border.bottom 1
            ]
        , Style.style Icon
            [ Font.typeface
                [ Font.importUrl
                    { url = "icomoon/style.css"
                    , name = "icomoon"
                    }
                ]
            , Font.size (50)
            ]
        ]
