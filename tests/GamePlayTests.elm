module GamePlayTests exposing (..)

import Test exposing (..)
import Expect
import MagicalCards exposing (..)
import Card exposing (..)

cardMovement : Test
cardMovement =
    describe "Cards moving between zones"
        [ describe "drawing a card"
            [ test "a single card" <|
                \() ->
                    let
                        initial =
                            { library = init ["a", "b", "c" ]
                            , hand = [ Card "h" ]
                            }

                        expected =
                            { library = Library.init [ "b", "c" ]
                            , hand = [ Card "a", Card "h" ]
                            }
                    in
                        Expect.equal expected <| drawCard initial
            ]
        ]

