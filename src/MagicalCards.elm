port module MagicalCards exposing (..)

import Html exposing (..)
import Library.Library exposing (..)
import Hand.Hand exposing (..)
import List exposing (..)


main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Library =
    Library.Library.Library

type alias Hand =
    Hand.Hand.Hand


type alias Model =
    { library : Library
    , hand : Hand
    }


init : ( Model, Cmd Msg )
init =
    ( Model Library.Library.init Hand.Hand.init, Cmd.none )



-- UPDATE


type Msg
    = LibraryMsg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ text <| (model.library |> List.length |> toString) ++ " cards in library"
        , text <| (model.hand |> List.length |> toString) ++ " cards in hand"
        ]



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
