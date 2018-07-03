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

pair : (Bool, Bool)
pair = (True, False)

or : (Bool, Bool) -> Bool
or pair =
    case pair of
        (True, True) -> True
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
