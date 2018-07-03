# What is it
like react or angular, V in MVC
if you've used redux, it follows the store/action/reactive render pattern (came from elm)
haskell/ml like syntax, not quite haskell (type classes)
currently 0.18, used by a couple smaller companies as part of their code base, carfax, noredink, ableton, microsoft (on github)

# what we're going to talk about
functional programming basics
  - it's a complex topic but the things you need to be effective are relatively simple
basic syntax
structure of an application and simple uses
skipping some advanced topics

# Functional programming

## what is it
	- no one definition
	- first class functions
	- some things that are generally part of it

## what most people mean (give or take)
	- math functions have no side effects, same input, same output, do not change state, referentially transparent, "honest"
	- immutability plays into this, things don't change. need to change something? new object
	- side effects are avoided, but are made explicit (CQS)
	- type system encodes application rules (applies less to C#)
	- things you don't need to worry about: monads, monoids, functors, endofunctors, etc
	- popular in academic circles years ago, react, redux, c# are gateway drugs

## how is this better than OOP
	- makes code more explicit, declarative, and readable
  - being explicit about side effects prevents weird states
	- tests are actually fun
	- a strong type system makes code more safe, less bugs, some states are impossible to get into
	- thread safety increasingly important
	- might be less readable if you aren't used to it, makes things more verbose generally


# Why do you care
- already know javascript

## speed
haskell compiler optimizes away your bad decisions
no preact, but it would be fun to test, speed test is open source

## error free
basically guarantees no runtime errors
if you can get it to compile, it will likely work
because of the typing, packages can't break you
potential for errors with javascript interop

## fun
declaractive, react like
virtual dom
shared state - redux, flux
static typing and referential transparency makes refactoring what you've written easy
even if you don't plan on writing it, it's relevant to react, redux and what's happening in the ui dev world

## basics
let's talk through some of the syntax concepts first

## basic values and structures
type signatures
immutable values
type aliases for user defined types, make it easier to reason about problems
types as a language abstraction to aide in programming, let you codify functionality (this one is a record)
not as complete as haskell where you can define type classes, but that's beyond the scope of this
record update creates new record

## functions
more complex type signatures
functions are themselves values that you can pass to other functions

## flow control
if is as expected, but the else is required
case should also be familiar, but we need to match *every* value
underscore for values we don't really care about

## more advanced types
we know about normal types, people see types think they understand but often don't fully grasp the power of the type system (css encoded type system!)
complex type system lets you encode more than simple info
makes functions more explicit
allows the compiler to cover your butt

## deconstruction and pattern matching
make declarative programming easier
similar to es6 deconstruction

## the elm architecture
elm was designed with the purpose of building single pages app, strives to do that well
has a set architecture that it wants you to use
design philosophy is that everything is well thought out, doesn't want to be everything to everyone (talk with the elm guy on twitter)

## hello world
ok, time for some code!
elm provides elm-repl, elm-make and elm-reactor
- main is the "core" of the program. this is the simple version
- model: we define a model type, it can be anything. this is equivalent to a redux store
	now it's just a string
- update: like redux reducers, here is where changes are applied to the model
	aren't doing any updating yet, so it just returns the model
- view: elm defines dom functions that build a vdom, like react
	just normal function syntax
	they all take two list arguments, attributes and children

## building an emoji counter
want to list a bunch of emoji and let voting happen on them
- going to start just listing emoji
- model to string list
- add emojis, show broken page
- import needed elements: div, ul, li
- import List
- fill div with List.map text model
- actually want it in a ul. should put it in another function for simplicity
- want to actually see, so import Html.Attributes. style list of tuples
	import Html.Attributes exposing (..)
- now we want to do some counting
	- create emoji type
	- change model
	- change display function, toString
	- add message types, like in redux, we need a type for our changes
	- import button and onclick
		import Html.Events exposing (onClick)
	- update display, then show actions
	- update update
	- write emoji decrement / increment
- if time, refactor increment / decrement

## web stuff
ok, that's cool but what about web requests so we can make real applications
emoji api: http://localhost:3000
add types, add cases
commands are another way of saying do something, like a msg, but they produce side effects.
 - our new complex main has an update that produces both a model and a cmd, some msg types will spawn a command
 - the elm runtime "does" the command, then hands the result back
write out http functions
	- getEmoji function produces a command that produces a message...
		- so Http.send is creating a command, that command then creates an addemoji message which the update function will use
    - Http.send AddEmoji (Http.get url decodeEmoji)
    - Decode.at ["emoji"] Decode.string
	- GotEmoji (Ok emoji)
	- GotEmoji (Err _)

## advanced / not covered
subscriptions for things on an interval, a websocket, mouse or keyboard input

## examples
https://learningmusic.ableton.com
https://github.com/rtfeldman/elm-spa-example
