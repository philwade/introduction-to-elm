title: "Elm: Let's build a UI"
author:
  name: Phil
  twitter: phil_wade
  url: philwade.org
output: index.html
controls: false

--

# Elm 🌳

--

### Ok, so what is Elm?

* Web development framework
* Compiles to javascript
* Pure, functional, strongly typed

--

### Functional?

* There isn't an agreed upon definition
* First class functions
* Immutability/referential transparency
* Side effects handled specially
* Advanced type system

--

### Why do you care?
* No runtime errors
* Fast
* Small
* Fun (for certain values of fun)

--

### Basics
![basics](images/basics.gif)

--

### Basic Values & Structures

    word : String
	word = "hello pizza"

	count : number
	count = 42

	items : List String
	items = ["car", "boat", "horse"]

	coords : (Int, Int)
	coords = (10, 15)

	type alias Coordinates = { x : Int, y : Int }
	betterCoords : Coordinates
	betterCoords = { x = 10, y = 15 }

	moreCoords = Coordinates 10 15

	updatedCoords = { betterCoords | x = 15 }

--

### Functions

	add : Int -> Int -> Int
	add a b = a + b

	addResults : (Int -> Int -> Int) -> Int -> Int -> Int
	addResults todo a b = (todo a b) + (todo a b)

--
### Flow control
    addResults : (Int -> Int -> Int) -> Int -> Int -> Int
    addResults todo a b =
      let
        first = todo a b
        second = todo a b
      in
        first + second

    isPositive : Int -> Bool
    isPositive number =
        if number > 0 then True else False

    ninetiesShow : String -> String
    ninetiesShow name =
        case name of
          "Jerry" -> "Seinfeld"
          "Joey" -> "Friends"
          _ -> "I don't know"

--
### Deconstruction and pattern matching

    type alias Pair = (Bool, Bool)

    pair : Pair
    pair = (True, False)

    or : Pair -> Bool
    or pair =
        case pair of
            (True, _) -> True
            (_, True) -> True
            (_, _) -> False

	person = { name = "Joe", age = 50 }

	isAdult : Person -> Boolean
	isAdult { age } = age > 18
--

### Advanced types

    List.head : List a -> Maybe a

    headPlusOne : List Int -> Int
    headPlusOne given =
      case List.head given of
        Just number -> number + 1
        Nothing -> 0

--
### More advanced types

    badOpenFile : String -> String -> String

vs

    type FileOpenType = Read | Write | ReadWrite
    type alias FileName = String
    type alias FileHandle = String

    openFile : FileName -> FileOpenType -> FileHandle
    openFile name openType =
        case openType of
            Read -> name ++ "read"
            Write -> name ++ "write"
            ReadWrite -> name ++ "readwrite"



--
### The Elm Architecture
* Single purpose
* Opinionated

--
### Demo time!

![demo](images/demo.gif)

--
### Questions?
--
### Examples
- https://learningmusic.ableton.com
- https://github.com/rtfeldman/elm-spa-example
