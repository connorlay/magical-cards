module Hand.Hand exposing (..)

import Card exposing (..)
import Maybe exposing (..)
import List exposing (..)
import Util.ListUtil exposing (..)


type alias Hand =
    List Card


init : List String -> Hand
init names =
    List.map Card names


add : Card -> Hand -> Hand
add card hand =
    card :: hand

removeByName : String -> Hand -> ( Maybe Card, Hand )
removeByName name hand =
    Util.ListUtil.remove (\card -> card.name == name) [] hand
