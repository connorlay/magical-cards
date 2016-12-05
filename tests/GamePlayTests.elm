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
                            { library = [ Card "a", Card "b", Card "c" ]
                            , hand = [ Card "h" ]
                            }

                        expected =
                            { library = [ Card "b", Card "c" ]
                            , hand = [ Card "a", Card "h" ]
                            }
                    in
                        Expect.equal expected <| drawCard initial
            ]
        ]

