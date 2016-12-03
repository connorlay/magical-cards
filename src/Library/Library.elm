module Library.Library exposing (..)

import Maybe exposing (..)

type alias Card =
  { name : String }

type alias Library =
    List Card

pop : Library -> (Maybe Card, Library)
pop library =
    case library of
      [] -> ( Nothing, [] )
      x::xs -> ( Just x, xs )

