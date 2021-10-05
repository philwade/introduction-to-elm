import Html exposing (Html, h1, text)
import Browser


main = Browser.sandbox { init = init, view = view, update = update }


-- MODEL

type alias Model = String

init : Model
init = "hello world"


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
