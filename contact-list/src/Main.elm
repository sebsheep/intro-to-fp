module Main exposing (..)

import Browser
import Dict exposing (Dict)
import Element exposing (Element, column, el, fill, height, padding, paddingEach, px, rgb, rgba, row, spacing, text, width)
import Element.Background as Background
import Element.Font as Font
import Element.Input as Input


type alias Model =
    { nameInput : String
    , ageInput : String
    , people : Dict String Int
    }


type Msg
    = NameEntered String
    | AgeEntered String
    | PersonSubmited ( String, Int )
    | PersonDeleted String


init : Model
init =
    { nameInput = ""
    , ageInput = ""
    , people = Dict.empty --Debug.todo "Fill the personList field with an appropriate value!"
    }


update : Msg -> Model -> Model
update msg model =
    case msg of
        NameEntered string ->
            { model | nameInput = string }

        AgeEntered string ->
            { model | ageInput = string }

        PersonSubmited ( personName, age ) ->
            -- TODO: insert the new person's age
            model

        PersonDeleted personName ->
            -- TODO: remove the person from the list
            model


view : Model -> Element Msg
view model =
    column [ width fill, height fill ]
        [ column [ spacing 30, width fill, height fill ]
            -- TODO: replace this empty list with the actual people list,
            -- TODO: you can use the viewPerson function (see below)
            -- []
            (Dict.toList model.people
                |> List.map viewPerson
            )
        , viewControlBar model
        ]


viewPerson : ( String, Int ) -> Element Msg
viewPerson ( personName, age ) =
    row [ spacing 10 ]
        [ el [ Font.bold ] (text personName)
        , el [] (text (String.fromInt age ++ " years"))
        , Input.button []
            { onPress = Just (PersonDeleted personName)
            , label = el [ Font.extraBold, Font.color (rgb 1 0 0) ] (text "X")
            }
        ]


viewControlBar : Model -> Element Msg
viewControlBar model =
    row [ spacing 30, height (px 50), paddingEach { top = 100, bottom = 100, left = 50, right = 50 } ]
        [ Input.text []
            { onChange = NameEntered
            , text = model.nameInput
            , placeholder = Just (Input.placeholder [ Font.color (rgb 0.5 0.5 0.5) ] (text "John Doe"))
            , label = Input.labelAbove [ Font.bold ] (text "Enter the name")
            }
        , Input.text []
            { onChange = AgeEntered
            , text = model.ageInput
            , placeholder = Just (Input.placeholder [ Font.color (rgb 0.5 0.5 0.5) ] (text "42"))
            , label = Input.labelAbove [ Font.bold ] (text "Enter the age")
            }
        , let
            maybePersonNameAge =
                case ( String.toInt model.ageInput, String.isEmpty model.nameInput ) of
                    ( Just age, False ) ->
                        if age > 0 then
                            Just ( model.nameInput, age )

                        else
                            Nothing

                    _ ->
                        Nothing

            alpha =
                -- using a half transparent background if the submit button is unavailable
                if maybePersonNameAge == Nothing then
                    0.5

                else
                    1
          in
          Input.button
            [ padding 10
            , Font.color (rgb 1 1 1)
            , Background.color (rgba 0 0 0.5 alpha)
            ]
            { onPress = Maybe.map PersonSubmited maybePersonNameAge
            , label = text "Add"
            }
        ]


main =
    Browser.sandbox
        { init = init
        , view = \model -> Element.layout [ width fill, height fill ] (view model)
        , update = update
        }
