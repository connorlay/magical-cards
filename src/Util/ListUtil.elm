module Util.ListUtil exposing (..)


remove : (a -> Bool) -> List a -> List a -> ( Maybe a, List a )
remove predicate before after =
    case after of
        [] ->
            ( Nothing, before )

        x :: xs ->
            if predicate x then
                ( Just x, before ++ xs )
            else
                remove predicate (before ++ [ x ]) xs
