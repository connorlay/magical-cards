module Hand.Model exposing (..)

import Card exposing (Card)
import List exposing (map)


type alias Hand =
    List Card


init : List String -> Hand
init names =
    List.map Card names
