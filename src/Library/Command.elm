module Library.Command exposing (..)

import Random exposing (list, int, generate)
import Library.Message exposing (..)


randomOrder : Int -> Cmd Msg
randomOrder size =
    Random.generate Shuffle (Random.list size (Random.int 0 (size - 1)))
