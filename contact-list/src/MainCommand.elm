module MainCommand exposing (..)

{-| This is the level 2 of this tutorial, you have to complete
the level 1 before doing it!

    The idea here is to interact with the software only with a command
    line interface.

    Go to the Command module first and implement the parsers.

    Then, fulfill this file.

-}

import Browser
import Command
import Dict exposing (Dict)
import Element exposing (Element, column, el, fill, height, none, padding, paddingEach, px, rgb, rgba, row, spacing, text, width)
import Element.Background as Background
import Element.Font as Font
import Element.Input as Input


type alias Model =
    { commandInput : String
    , error : Bool
    , people : Dict String Int
    }


type Msg
    = CommandEntered String
    | CommandSubmitted String


init : Model
init =
    { commandInput = ""
    , error = False
    , people = Debug.todo "Fill the personList field with an appropriate value!"
    }


update : Msg -> Model -> Model
update msg model =
    case msg of
        CommandEntered string ->
            { model | commandInput = string }

        CommandSubmitted commandStr ->
            case Command.parse commandStr of
                Ok command ->
                    -- TODO: apply the command
                    model

                Err _ ->
                    { model | error = True }


view : Model -> Element Msg
view model =
    column [ width fill, height fill ]
        [ column [ spacing 30, width fill, height fill ]
            -- TODO: replace this empty list with the actual people list,
            -- TODO: you can use the viewPerson function (see below)
            []
        , viewControlBar model
        ]


viewPerson : ( String, Int ) -> Element Msg
viewPerson ( personName, age ) =
    row [ spacing 10 ]
        [ el [ Font.bold ] (text personName)
        , el [] (text (String.fromInt age ++ " years"))
        ]


viewControlBar : Model -> Element Msg
viewControlBar model =
    row [ spacing 30, height (px 50), paddingEach { top = 100, bottom = 100, left = 50, right = 50 } ]
        [ Input.text []
            { onChange = CommandEntered
            , text = model.commandInput
            , placeholder = Just (Input.placeholder [ Font.color (rgb 0.5 0.5 0.5) ] (text "John Doe"))
            , label = Input.labelAbove [ Font.bold ] (text "Enter the name")
            }
        , let
            maybeCommandStr =
                if String.isEmpty model.commandInput then
                    Nothing

                else
                    Just model.commandInput

            alpha =
                -- using a half transparent background if the submit button is unavailable
                if maybeCommandStr == Nothing then
                    0.5

                else
                    1
          in
          Input.button
            [ padding 10
            , Font.color (rgb 1 1 1)
            , Background.color (rgba 0 0 0.5 alpha)
            ]
            { onPress = Maybe.map CommandSubmitted maybeCommandStr
            , label = text "Add"
            }
        , if model.error then
            el [ Font.color (rgb 1 0 0) ] (text "Error in the command")

          else
            none
        ]


main =
    Browser.sandbox
        { init = init
        , view = \model -> Element.layout [ width fill, height fill ] (view model)
        , update = update
        }
