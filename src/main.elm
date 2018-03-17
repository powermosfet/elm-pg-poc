module Main exposing (main)

import Html exposing (Html, text, program)
import Model exposing (init)
import View exposing (view)
import Update exposing (update)


main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = (\_ -> Sub.none)
        }
