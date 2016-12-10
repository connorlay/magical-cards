module Library.Command exposing (..)

import Random exposing (..)
import Library.Message exposing (..)


randomOrder : Int -> Cmd Msg
randomOrder size =
    Random.generate Shuffle (Random.list size (Random.int 0 (size - 1)))
