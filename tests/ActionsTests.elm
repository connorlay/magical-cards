module ActionsTests exposing (..)

import Test exposing (..)
import Expect
import MagicalCards exposing (..)
import Library.Model exposing (..)
import Hand.Model exposing (..)
import Actions exposing (..)
import Card exposing (..)


cardMovement : Test
cardMovement =
    describe "Cards moving between zones"
        [ describe "drawing a card"
            [ test "a single card" <|
                \() ->
                    let
                        initialHand =
                            Hand.Model.init [ "h" ]
                        initialLibrary =
                            Library.Model.init [ "a", "b", "c" ]

                        expectedHand =
                            Hand.Model.init [ "a", "h" ]
                        expectedLibrary =
                            Library.Model.init [ "b", "c" ]
                    in
                        Expect.equal ( expectedLibrary, expectedHand ) <| drawCard initialLibrary initialHand
            ]
        ]
