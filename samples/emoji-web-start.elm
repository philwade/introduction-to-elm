import Html exposing (Html, div, ul, li, text, button)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import List
import Http
import Json.Decode as Decode

main = Html.program { init = init, view = view, update = update, subscriptions = subscriptions }

-- MODEL

type alias Model = List Emoji

init : (Model, Cmd Msg)
init = ([ Emoji "🍕" 0, Emoji "😂" 0, Emoji "💯" 0 ] , Cmd.none)


-- UPDATE

type Msg = Increment String | Decrement String

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        Increment value -> (increment value model, Cmd.none)
        Decrement value -> (decrement value model, Cmd.none)

increment : String -> Model -> Model
increment value emojis = List.map (match ((+) 1) value) emojis

decrement : String -> Model -> Model
decrement value emojis = List.map (match (\x -> x - 1) value) emojis

match : (Int -> Int) -> String -> Emoji -> Emoji
match modifier value emoji =
    if emoji.value == value then
        { emoji | count = modifier emoji.count }
    else
        emoji
-- VIEW

view : Model -> Html Msg
view model =
  div [ style [("font-size", "50px")] ] [
            ul [] (List.map emojiDisplay model)
         ]

emojiDisplay : Emoji -> Html Msg
emojiDisplay emoji =
    li [] [ text emoji.value
          , text ("Count: " ++ (toString emoji.count))
          , button [ onClick (Increment emoji.value) ] [ text "+" ]
          , button [ onClick (Decrement emoji.value) ] [ text "-" ]
          ]

type alias Emoji = { value : String , count : Int }

-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none
