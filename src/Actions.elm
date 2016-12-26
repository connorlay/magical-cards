module Actions exposing (..)

import Hand.Model exposing (Hand)
import Library.Model exposing (Library)
import Data.List.Extensions exposing (..)


drawCard : Library -> Hand -> ( Library, Hand )
drawCard library hand =
    let
        ( card, newLibrary ) =
            popTop library

        newHand =
            case card of
                Nothing ->
                    hand

                Just c ->
                    pushTop c hand
    in
        ( newLibrary, newHand )
