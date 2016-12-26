module Library.Model exposing (..)

import Card exposing (Card)


type alias Library =
    List Card


init : List String -> Library
init names =
    List.map Card names
