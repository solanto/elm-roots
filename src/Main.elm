module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)



-- 📦 model 📦


type alias Model =
    { weekday : String
    , nightMode : Bool
    }


init : String -> Model
init weekday =
    { weekday = weekday
    , nightMode = False
    }



-- 📦 ----- 📦
--
--
-- 📩 messages 📩


type Msg
    = ToggleNightMode



-- 📩 -------- 📩
--
--
-- 🤝 helpers 🤝


darkStyle : Bool -> List (Attribute msg)
darkStyle active =
    if active then
        [ class "dark" ]

    else
        []


toggleIcon : Bool -> Html msg
toggleIcon active =
    if active then
        text "light_mode"

    else
        text "dark_mode"



-- 🤝 ------- 🤝
--
--
-- 📃 view 📃


view : Model -> Html Msg
view model =
    section (id "greeting" :: darkStyle model.nightMode)
        [ div [ class "card" ]
            [ h1 [] [ text "hej!" ]
            , p []
                [ text "idag är ", strong [] [ text model.weekday ], text "." ]
            , button
                [ id "night-mode-toggle"
                , class "material-icons-round"
                , onClick ToggleNightMode
                ]
                [ toggleIcon model.nightMode ]
            ]
        ]



-- 📃 ---- 📃
--
--
-- 📯 update 📯


update : Msg -> Model -> Model
update msg model =
    case msg of
        ToggleNightMode ->
            { model | nightMode = not model.nightMode }



-- 📯 ------ 📯
--
--
-- 💻 main 💻


main : Program String Model Msg
main =
    Browser.element
        { init = \model -> ( init model, Cmd.none )
        , update = \msg model -> ( update msg model, Cmd.none )
        , view = view
        , subscriptions = \_ -> Sub.none
        }



-- 💻 ---- 💻