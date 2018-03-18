module View exposing (..)

import Color exposing (rgb)
import Style
import Style.Color as Color
import Style.Border as Border
import Style.Font as Font
import Element exposing (viewport, below, row, column, el, empty, text)
import Element.Attributes exposing (..)
import Element.Events exposing (onClick)
import Html exposing (Html)
import Model exposing (Model)
import Message exposing (Msg(..))


type MyStyles
    = NoStyle
    | Header
    | Body
    | Button
    | MenuList
    | MenuItem


scale s =
    50 * (1.618 ^ s)


styleSheet =
    Style.styleSheet
        [ Style.style NoStyle []
        , Style.style Header
            [ Color.background (rgb 0 153 255)
            , Font.typeface [ Font.font "helvetica" ]
            , Font.size (scale 0)
            ]
        , Style.style Body
            [ Color.background (rgb 220 220 220) ]
        , Style.style Button
            [ Font.underline
            ]
        , Style.style MenuList
            [ Color.background (rgb 240 240 240)
            ]
        , Style.style MenuItem
            [ Border.bottom 1
            ]
        ]


view : Model -> Html Msg
view model =
    viewport styleSheet <|
        column Body
            [ height fill ]
            [ header model
            , body
            ]


header model =
    row Header
        [ height (px (scale 2))
        , spread
        , verticalCenter
        ]
        [ el NoStyle [ width (fillPortion 1) ] empty
        , el NoStyle [] (text "HEADER")
        , el NoStyle
            [ width (fillPortion 1) ]
            (menu model.menuOpen)
        ]


menu open =
    let
        menuRow button =
            row NoStyle
                [ width fill, height fill, alignRight ]
                [ button ]

        menuButton =
            (el Button
                [ padding (scale -2)
                , verticalCenter
                , onClick ToggleMenu
                ]
                (text "Menu")
            )
    in
        if open then
            menuRow
                (menuButton
                    |> below [ menuList ]
                )
        else
            menuRow menuButton


menuList =
    el MenuList
        [ padding (scale -2), alignRight ]
        (column NoStyle
            []
            [ menuItem "Item 1"
            , menuItem "Menu item 2"
            , menuItem "Item 3"
            ]
        )


menuItem label =
    el MenuItem [ padding (scale -1) ] (text label)


body =
    el Body
        [ height (percent 90), onClick CloseMenu, yScrollbar ]
        (el NoStyle
            [ center, verticalCenter ]
            (text "BODY")
        )
