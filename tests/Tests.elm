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
            [ describe "from the top"
                [ test "non-empty library" <|
                    \() ->
                        let
                            library =
                                [ Card "a", Card "b", Card "c" ]
                        in
                            Expect.equal ( Just (Card "a"), [ Card "b", Card "c" ] ) <|
                                pop library
                , test "empty library" <|
                    \() ->
                        Expect.equal ( Nothing, [] ) <| pop []
                ]
            , describe "by name" <|
                [ test "card is present" <|
                    \() ->
                        let
                            library =
                                [ Card "a", Card "b", Card "c" ]
                        in
                            Expect.equal ( Just (Card "b"), [ Card "a", Card "c" ] ) <|
                                removeByName "b" library
                , test "card is not present" <|
                    \() ->
                        let
                            library =
                                [ Card "a", Card "b" ]
                        in
                            Expect.equal ( Nothing, [ Card "a", Card "b" ] ) <|
                                removeByName "c" library
                ]
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
                \() ->
                    let
                        library =
                            [ Card "a", Card "b", Card "c" ]
                    in
                        Expect.equal (library ++ [ Card "d" ]) <|
                            pushBottom (Card "d") library
            ]
        ]
