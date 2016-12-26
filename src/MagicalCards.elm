port module MagicalCards exposing (..)

import Html exposing (Html, div, text, button)
import Html.Events exposing (onClick)
import Html.Attributes exposing (src)
import Library.Model exposing (Library, init)
import Library.Update exposing (update)
import Library.Command exposing (randomOrder)
import Library.Message exposing (..)
import Hand.Model exposing (Hand, init)
import Actions exposing (drawCard)
import List exposing (map)
import Html exposing (..)
import Html.Events exposing (..)
import Network.MtgJson exposing (..)
import Electron.Ports exposing (..)
import Data.List.Extensions exposing (shuffle)


main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { library : Library
    , hand : Hand
    , cardData : Maybe String
    }


init : ( Model, Cmd Msg )
init =
    ( Model (Library.Model.init [ "a", "b", "c" ]) (Hand.Model.init []) Nothing
    , Cmd.none
    )



-- UPDATE


type alias NetworkMsg =
    Network.MtgJson.Msg


type alias FilePath =
    Electron.Ports.FilePath


type alias Content =
    Electron.Ports.Content


type Msg
    = LibraryMsg Library.Message.Msg
    | NetworkMsg NetworkMsg
    | HandMsg
    | DrawCard
    | FetchJson
    | ShuffleLibrary


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LibraryMsg submsg ->
            handleLibraryMsg submsg model

        HandMsg ->
            ( model, Cmd.none )

        DrawCard ->
            let
                ( library, hand ) =
                    Actions.drawCard model.library model.hand
            in
                ( { model | library = library, hand = hand }, Cmd.none )

        ShuffleLibrary ->
            ( model, Cmd.map LibraryMsg (Library.Command.randomOrder (List.length model.library)) )

        FetchJson ->
            ( model, Cmd.map NetworkMsg getMtgJson )

        NetworkMsg submsg ->
            case submsg of
                NewJson (Ok json) ->
                    ( { model | cardData = Just json }, writeFile ( "./data.json", json ) )

                NewJson (Err _) ->
                    ( model, Cmd.none )


handleLibraryMsg : Library.Message.Msg -> Model -> ( Model, Cmd Msg )
handleLibraryMsg msg model =
    case msg of
        Shuffle newOrder ->
            let
                shuffled =
                    shuffle model.library newOrder
            in
                ( { model | library = shuffled }, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ text <| (model.library |> List.length |> toString) ++ " cards in library"
        , text <| (model.hand |> List.length |> toString) ++ " cards in hand"
        , button [ onClick DrawCard ] [ text "Draw Card" ]
        , button [ onClick ShuffleLibrary ] [ text "Shuffle Library" ]
        , div [] <| listCards model
        , button [ onClick FetchJson ] [ text "Fetch Json" ]
        , displayJson model
        , div [] <| displayLibrary model.library
        ]


listCards : Model -> List (Html Msg)
listCards model =
    List.map (\card -> text card.name) model.library


displayJson : Model -> Html Msg
displayJson model =
    case model.cardData of
        Just json ->
            text json

        Nothing ->
            text "No card data :("


displayLibrary : Library -> List (Html Msg)
displayLibrary library =
    [ img [ src "http://gatherer.wizards.com/Handlers/Image.ashx?type=card&multiverseid=405134" ] [] ]



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
