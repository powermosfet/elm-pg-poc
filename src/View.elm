module View exposing (..)

import Html exposing (Html, div, text)
import Model exposing (Model)
import Message exposing (Msg)


view : Model -> Html Msg
view _ =
    div [] [ text "Hello, world" ]
