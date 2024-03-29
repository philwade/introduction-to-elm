module Slides exposing(..)

word : String
word = "hello"

count : number
count = 42

items : List String
items = ["car", "boat", "horse"]

coords : (Int, Int)
coords = (10, 15)

type alias Coordinates = { x : Int, y : Int }
betterCoords : Coordinates
betterCoords = { x = 10, y = 15 }

updatedCoords = { betterCoords | x = 15 }

add : Int -> Int -> Int
add a b = a + b

addResults : (Int -> Int -> Int) -> Int -> Int -> Int
addResults todo a b = (todo a b) + (todo a b)

type alias Pair = (Bool, Bool)

pair : Pair
pair = (True, False)

or : Pair -> Bool
or p =
    case p of
        (True, _) -> True
        (_, True) -> True
        (_, _) -> False

type alias Person = { name: String, age: Int }
person = { name = "Joe", age = 50 }

isAdult : Person -> Bool
isAdult { age } = age > 18

type FileOpenType = Read | Write | ReadWrite
type alias FileName = String
type alias FileHandle = String

openFile : FileName -> FileOpenType -> FileHandle
openFile name openType =
    case openType of
        Read -> name ++ "read"
        Write -> name ++ "write"
        ReadWrite -> name ++ "readwrite"

isPositive : Int -> Bool
isPositive number =
    if number > 0 then True else False

ninetiesShow : String -> String
ninetiesShow name =
    case name of
      "Jerry" -> "Seinfeld"
      "Joey" -> "Friends"
      _ -> "I don't know"
