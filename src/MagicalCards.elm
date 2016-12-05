port module MagicalCards exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
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
    ( Model (Library.Library.init 5) Hand.Hand.init, Cmd.none )



-- UPDATE


type Msg
    = LibraryMsg
    | HandMsg
    | DrawCard


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LibraryMsg ->
            ( model, Cmd.none )

        HandMsg ->
            ( model, Cmd.none )

        DrawCard ->
            ( drawCard model, Cmd.none )


drawCard : Model -> Model
drawCard model =
    let
        ( card, library ) =
            pop model.library

        hand =
            case card of
                Nothing ->
                    model.hand

                Just c ->
                    add c model.hand
    in
        { model | library = library, hand = hand }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ text <| (model.library |> List.length |> toString) ++ " cards in library"
        , text <| (model.hand |> List.length |> toString) ++ " cards in hand"
        , button [ onClick DrawCard ] [ text "Draw Card" ]
        ]



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
