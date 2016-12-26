module Library.Update exposing (..)

import Maybe exposing (Maybe)
import Card exposing (Card)
import Hand.Model exposing (Hand)
import Library.Message exposing (..)
import Library.Model exposing (Library)
import Data.List.Extensions exposing (remove, shuffle)


-- UPDATE


update : Msg -> Library -> Library
update msg model =
    case msg of
        Shuffle newOrder ->
            shuffle model newOrder


removeByName : String -> Hand -> ( Maybe Card, Hand )
removeByName name hand =
    remove (\card -> card.name == name) [] hand
