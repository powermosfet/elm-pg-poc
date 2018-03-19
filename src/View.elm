module View exposing (..)

import Char
import Element exposing (viewport, below, row, column, el, empty, text)
import Element.Attributes exposing (..)
import Element.Events exposing (onClick)
import Html exposing (Html)
import Model exposing (Model)
import Message exposing (Msg(..))
import Styles exposing (Style(..), styleSheet)
import Icon


scale s =
    50 * (1.618 ^ s)


view : Model -> Html Msg
view model =
    let
        icon =
            Icon.icon model.iconDefinitions

        header =
            row Header
                [ height (px (scale 2))
                , spread
                , verticalCenter
                ]
                [ el NoStyle [ width (fillPortion 1) ] empty
                , el NoStyle [] (text "HEADER")
                , el NoStyle
                    [ width (fillPortion 1) ]
                    (menu)
                ]

        menu =
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
                        (icon "menu")
                    )
            in
                if model.menuOpen then
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
                    [ menuItem "power_settings_new" "Item 1"
                    , menuItem "share" "Menu item 2"
                    , menuItem "trending_up" "Item 3"
                    ]
                )

        menuItem iconName label =
            row MenuItem
                [ padding (scale -2), spacing (scale -2) ]
                [ icon iconName
                , text label
                ]

        body =
            el Body
                [ height (percent 90), onClick CloseMenu, yScrollbar ]
                (el NoStyle
                    [ center, verticalCenter ]
                    (text "BODY")
                )
    in
        viewport styleSheet <|
            column Body
                [ height fill ]
                [ header
                , body
                ]
