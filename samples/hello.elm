import Html exposing (Html, h1, text)


main = Html.beginnerProgram { model = model, view = view, update = update }


-- MODEL

type alias Model = String

model : Model
model = "hello world"


-- UPDATE

type Msg = Noop

update : Msg -> Model -> Model
update msg model = model


-- VIEW

view : Model -> Html Msg
view model =
  h1 []
    [ text model
    ]
