module Hand.Hand exposing (..)

import Card exposing (..)
import Maybe exposing (..)
import Util.ListUtil exposing (..)


type alias Hand =
    List Card


add : Card -> Hand -> Hand
add card hand =
    card :: hand

removeByName : String -> Hand -> ( Maybe Card, Hand )
removeByName name hand =
    Util.ListUtil.remove (\card -> card.name == name) [] hand
