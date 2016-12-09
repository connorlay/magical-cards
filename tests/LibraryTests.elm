module LibraryTests exposing (..)

import Test exposing (..)
import Expect
import Library.Library exposing (..)
import Card exposing (..)

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
                                popTop library
                , test "empty library" <|
                    \() ->
                        Expect.equal ( Nothing, [] ) <| popTop []
                ]
            , describe "by name" <|
                [ test "card is present" <|
                    \() ->
                        let
                            library =
                                [ Card "a", Card "b", Card "c" ]
                        in
                            Expect.equal ( Just (Card "b"), [ Card "a", Card "c" ] ) <|
                                Library.Library.removeByName "b" library
                , test "card is not present" <|
                    \() ->
                        let
                            library =
                                [ Card "a", Card "b" ]
                        in
                            Expect.equal ( Nothing, [ Card "a", Card "b" ] ) <|
                                Library.Library.removeByName "c" library
                ]
            , describe "from the bottom" <|
                [ test "non-empty library" <|
                    \() ->
                        let
                            library =
                                [ Card "a", Card "b", Card "c" ]
                        in
                            Expect.equal ( Just (Card "c"), [ Card "a", Card "b" ] ) <|
                                popBottom library
                , test "empty library" <|
                    \() ->
                        Expect.equal ( Nothing, [] ) <| popBottom []
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
