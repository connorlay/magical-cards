module HandTests exposing (..)

import Test exposing (..)
import Expect
import Hand.Hand exposing (..)
import Card exposing (..)

hand : Test
hand =
    describe "Hand module"
        [ describe "Adding a card" <|
            [ test "a single card" <|
                \() ->
                    let
                        hand =
                            [ Card "a", Card "b" ]
                    in
                        Expect.equal [ Card "c", Card "a", Card "b" ] <| add (Card "c") hand
            ]
        , describe "Removing a card" <|
            [ test "by name" <|
                \() ->
                    let
                        hand =
                            [ Card "a", Card "b" ]
                    in
                        Expect.equal ( Just (Card "b"), [ Card "a" ] ) <| Hand.Hand.removeByName "b" hand
            ]
        ]
