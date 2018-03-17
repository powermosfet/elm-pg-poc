module Update exposing (..)

import Message exposing (Msg)
import Model exposing (Model)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )
