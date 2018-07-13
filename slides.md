title: "Elm: Functional Programming and the Zen of UI"
author:
  name: Phil
  twitter: phil_wade
  url: philwade.org
output: index.html
controls: false

--

# Elm 🌳
### Functional Programming and the Zen of UI

--

### Ok, so what is Elm?

![elmo](images/elmo.gif)

--

### No, really

* Web development framework
* Compiles to javascript
* Pure, functional, strongly typed
* Still in beta, used in production

--

### Functional Programming

* There isn't really a single definition
* First class functions
* A few things most people mean

--

### How is this better than OOP?

--

![bonsai](images/bonsai.jpg)

--

### Why do you care?
![why](images/why.gif)

--

## It's fast

![speed comparison](images/speed.png)

--

### No Errors

* Strong typing
* Helpful compiler
* Truly semantic versioning

--

### It's fun!
![fun](images/fun.gif)

--

### For certain definitions of "Fun"
* You like writing in a functional style
* You are into shared state containers
* Refactoring rules
* Insight into modern web patterns

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
