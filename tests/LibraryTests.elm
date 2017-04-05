module LibraryTests exposing (..)

import Test exposing (..)
import Expect
import Library.Model exposing (..)
import Library.Update exposing (..)
import Data.List.Extensions exposing (..)
import Card exposing (..)


library : Test
library =
    describe "Library module"
        [ removingByName
        ]


removingByName : Test
removingByName =
    describe "removing a card by name"
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
