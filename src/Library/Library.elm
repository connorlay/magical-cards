module Library.Library exposing (..)

import Maybe exposing (..)


type alias Card =
    { name : String }


type alias Library =
    List Card


init : Library
init =
    []


pop : Library -> ( Maybe Card, Library )
pop library =
    case library of
        [] ->
            ( Nothing, [] )

        x :: xs ->
            ( Just x, xs )


pushTop : Card -> Library -> Library
pushTop card library =
    card :: library


pushBottom : Card -> Library -> Library
pushBottom card library =
    library ++ [ card ]


removeByName : String -> Library -> ( Maybe Card, Library )
removeByName name library =
    remove (\card -> card.name == name) [] library


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
