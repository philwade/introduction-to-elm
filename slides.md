title: "Elm: Functional Programming and the Zen of UI programming"
author:
  name: Phil
  twitter: phil_wade
  url: philwade.org
output: index.html
controls: true

--

# Elm 🌳
### Functional Programming and the Zen of UI programming

--

### Ok, so what is Elm?

![elmo](images/elmo.gif)

--

### No, really

* Web development framework
* Compiles to javascript
* Pure, Functional, Strongly typed
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
    if number > 0 then "positive" else "negative or zero"

	case name of
		"Jerry" -> "Seinfeld"
		"Joey" -> "Friends"
		_ -> "I don't know"
--

### More advanced types

    type FileOpenType = Read | Write | ReadWrite
    type alias FileName = String
    type alias FileHandle = String

    openFile : FileName -> FileOpenType -> FileHandle
    openFile name openType =
        case openType of
            Read -> name ++ "read"
            Write -> name ++ "write"
            ReadWrite -> name ++ "readwrite"
vs

    badOpen : String -> String -> String

--
### Deconstruction and pattern matching

	pair : (Boolean, Boolean)
	pair = (True, False)

	or : (Boolean, Boolean) -> Boolean
	or pair =
		case pair of
			(True, True) -> True
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
### Other stuff
- subscriptions
- ports

--
### Examples
- https://learningmusic.ableton.com
- https://github.com/rtfeldman/elm-spa-example
