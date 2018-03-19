module Icon.Decoder exposing (..)

import Dict
import Json.Decode as Decode
import Icon.Types exposing (IconDict)


selection : Decode.Decoder IconDict
selection =
    Decode.field "icons"
        (Decode.map Dict.fromList (Decode.list pair))


pair : Decode.Decoder ( String, Int )
pair =
    (Decode.field "properties"
        (Decode.map2 (,)
            (Decode.field "name" Decode.string)
            (Decode.field "code" Decode.int)
        )
    )
