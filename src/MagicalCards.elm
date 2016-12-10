port module MagicalCards exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Library.Library exposing (..)
import Library.Command exposing (..)
import Library.Message exposing (..)
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
    ( Model (Library.Library.init [ "a", "b", "c" ]) (Hand.Hand.init [])
    , Cmd.none
    )



-- UPDATE


type Msg
    = LibraryMsg Library.Message.Msg
    | HandMsg
    | DrawCard
    | ShuffleLibrary


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LibraryMsg submsg ->
            handleLibraryMsg submsg model

        HandMsg ->
            ( model, Cmd.none )

        DrawCard ->
            ( drawCard model, Cmd.none )

        ShuffleLibrary ->
            ( model, Cmd.map LibraryMsg (Library.Command.randomOrder (List.length model.library)) )


handleLibraryMsg : Library.Message.Msg -> Model -> ( Model, Cmd Msg )
handleLibraryMsg msg model =
    case msg of
        Shuffle newOrder ->
            let
                shuffled =
                    Library.Library.shuffle model.library newOrder
            in
                ( { model | library = shuffled }, Cmd.none )


drawCard : Model -> Model
drawCard model =
    let
        ( card, library ) =
            popTop model.library

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
        , button [ onClick ShuffleLibrary ] [ text "Shuffle Library" ]
        , div [] <| listCards model
        ]


listCards : Model -> List (Html Msg)
listCards model =
    List.map (\card -> text card.name) model.library



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
