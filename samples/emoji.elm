import Html exposing (Html, div, ul, li, text, button)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import List


main = Html.beginnerProgram { model = model, view = view, update = update }


-- MODEL

type alias Model = List Emoji

model : Model
model = [ Emoji "🍕" 0, Emoji "😂" 0, Emoji "💯" 0 ]


-- UPDATE

type Msg = Increment String | Decrement String

update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment value -> increment value model
        Decrement value -> decrement value model

increment : String -> Model -> Model
increment value emojis = List.map (\emoji ->
                            if emoji.value == value then
                                { emoji | count = emoji.count + 1 }
                            else
                                emoji) emojis

decrement : String -> Model -> Model
decrement value emojis = List.map (\emoji ->
                            if emoji.value == value then
                                { emoji | count = emoji.count - 1 }
                            else
                                emoji) emojis
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
