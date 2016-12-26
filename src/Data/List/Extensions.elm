module Data.List.Extensions exposing (..)

import List exposing (sortBy, reverse, tail, head)


pushTop : a -> List a -> List a
pushTop element list =
    element :: list


pushBottom : a -> List a -> List a
pushBottom element list =
    list ++ [ element ]


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


popTop : List a -> ( Maybe a, List a )
popTop list =
    case list of
        [] ->
            ( Nothing, [] )

        x :: xs ->
            ( Just x, xs )


popBottom : List a -> ( Maybe a, List a )
popBottom list =
    case list of
        [] ->
            ( Nothing, [] )

        xs ->
            let
                backwards =
                    reverse xs

                card =
                    head backwards

                rest =
                    tail backwards
            in
                case rest of
                    Nothing ->
                        ( card, [] )

                    Just r ->
                        ( card, reverse r )


shuffle : List a -> List Int -> List a
shuffle list newOrder =
    list
        |> List.map2 (,) newOrder
        |> sortBy Tuple.first
        |> List.unzip
        |> Tuple.second
