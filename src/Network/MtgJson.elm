module Network.MtgJson exposing (..)

import Http exposing (..)


type Msg
    = NewJson (Result Http.Error String)


getMtgJson : Cmd Msg
getMtgJson =
    let
        url =
            "https://mtgjson.com/json/AllCards.json"

        request =
            Http.getString url
    in
        Http.send NewJson request
