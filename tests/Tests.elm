module Tests exposing (..)

import Test exposing (..)
import Expect
import Fuzz exposing (list, int, tuple, string)
import String
import Library.Library exposing (..)


all : Test
all =
    Test.concat [ library ]


library : Test
library =
    describe "Library module"
        [ describe "removing a card"
            [ test "from the top" <|
                \() ->
                    let
                        library =
                            [ Card "a", Card "b", Card "c" ]
                    in
                        Expect.equal ( Just (Card "a"), [ Card "b", Card "c" ] ) <|
                            pop library
            , test "from an empty library" <|
                \() ->
                    Expect.equal ( Nothing, [] ) <| pop []
            ]
        , describe "adding a card"
            [ test "to the top" <|
                \() ->
                    let
                        library =
                            [ Card "a", Card "b", Card "c" ]
                    in
                        Expect.equal (Card "d" :: library) <|
                            pushTop (Card "d") library
            , test "to the bottom" <|
                let
                    library =
                        [ Card "a", Card "b", Card "c" ]
                in
                    Expect.equal (Card "d" :: library) <|
                        pushTop (Card "d") library
            ]
        ]
