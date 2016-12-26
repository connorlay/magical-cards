module HandTests exposing (..)

import Test exposing (..)
import Expect
import Hand.Model exposing (..)
import Hand.Update exposing (..)
import Card exposing (..)


hand : Test
hand =
    describe "Hand module"
        [ describe "Removing a card" <|
            [ test "by name" <|
                \() ->
                    let
                        hand =
                            [ Card "a", Card "b" ]
                    in
                        Expect.equal ( Just (Card "b"), [ Card "a" ] ) <| removeByName "b" hand
            ]
        ]
