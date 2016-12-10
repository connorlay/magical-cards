module GamePlayTests exposing (..)

import Test exposing (..)
import Expect
import MagicalCards exposing (..)
import Library.Library exposing (..)
import Hand.Hand exposing (..)
import Card exposing (..)

cardMovement : Test
cardMovement =
    describe "Cards moving between zones"
        [ describe "drawing a card"
            [ test "a single card" <|
                \() ->
                    let
                        initial =
                            { library = Library.Library.init ["a", "b", "c" ]
                            , hand = Hand.Hand.init ["h"]
                            }

                        expected =
                            { library = Library.Library.init [ "b", "c" ]
                            , hand = Hand.Hand.init [ "a", "h" ]
                            }
                    in
                        Expect.equal expected <| drawCard initial
            ]
        ]

