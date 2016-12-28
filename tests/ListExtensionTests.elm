module ListExtensionTests exposing (..)

import Test exposing (..)
import Expect
import Data.List.Extensions exposing (..)


listExtensions : Test
listExtensions =
    describe "List extensions"
        [ adding 
        , removing
        , shuffling
        ]


adding : Test
adding =
    describe "add an element to the list"
        [ test "to the top" <|
            \() ->
                let
                    list =
                        [ "a",  "b" ]
                in
                    Expect.equal [ "c", "a", "b" ] <|
                        pushTop "c" list
        , test "to the bottom" <|
            \() ->
                let
                    list = [ "a", "b" ]
                in
                    Expect.equal [ "a", "b", "c" ] <|
                        pushBottom "c" list
        ]


removing : Test
removing =
    describe "removing an element from the list"
        [ describe "from the top"
            [ test "non-empty list" <|
                \() ->
                    let
                        list =
                            [ "a", "b", "c" ]
                    in
                        Expect.equal ( Just "a", [ "b", "c" ] ) <|
                            popTop list
            , test "empty list" <|
                \() ->
                    Expect.equal ( Nothing, [] ) <| popTop []
            ]
        , describe "from the bottom" <|
            [ test "non-empty library" <|
                \() ->
                    let
                        list =
                            [ "a", "b", "c" ]
                    in
                        Expect.equal ( Just "c", [ "a", "b" ] ) <|
                            popBottom list
            , test "empty library" <|
                \() ->
                    Expect.equal ( Nothing, [] ) <| popBottom []
            ]
        ]

shuffling : Test
shuffling =
    describe "shuffle the list"
        [ test "non-empty list" <|
            \() ->
                let
                    initial =
                        [ "a", "b", "c" ]

                    newOrder =
                        [ 3, 1, 2 ]

                    expected =
                        [ "b", "c", "a" ]
                in
                    Expect.equal expected <| shuffle initial newOrder
        , test "empty list" <|
            \() ->
                Expect.equal [] <| shuffle [] []
        ]
