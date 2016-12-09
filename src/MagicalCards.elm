port module MagicalCards exposing (..)

import Html exposing (..)
import Library.Library exposing (..)
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


type alias Model =
    { library : Library }


init : ( Model, Cmd Msg )
init =
    ( Model Library.Library.init, Cmd.none )



-- UPDATE


type Msg
    = LibraryMsg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    text <| ([] |> List.length |> toString) ++ " cards in library"



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
