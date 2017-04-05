module Tests exposing (..)

import Test exposing (..)
import Expect
import Fuzz exposing (list, int, tuple, string)
import String
import LibraryTests exposing (..)
import HandTests exposing (..)
import ActionsTests exposing (..)
import ListExtensionTests exposing (..)


all : Test
all =
    Test.concat [ library, hand, cardMovement, listExtensions ]
