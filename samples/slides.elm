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
