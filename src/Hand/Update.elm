module Hand.Update exposing (..)

import Hand.Model exposing (Hand)
import Card exposing (Card)
import Data.List.Extensions exposing (remove)


removeByName : String -> Hand -> ( Maybe Card, Hand )
removeByName name hand =
    remove (\card -> card.name == name) [] hand
