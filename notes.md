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
	- first class functions are the most basic rule
	- some things that are generally part of it

## what most people mean (give or take)
  - confusing because we use the word function a lot in programming
	- math functions have no side effects, same input, same output, do not change state, referentially transparent, "honest"
	- immutability plays into this, things don't change.
	- side effects are avoided, but are made explicit
	- type system encodes application rules - more strongly typed than what most people think of (we'll see examples later)
	- things you don't need to worry about: monads, monoids, functors, endofunctors, etc
	- popular in academic circles years ago, react, redux, c# are gateway drugs

## how is this better than OOP
	- makes code more explicit, declarative, and readable. a function does what it says, no more no less
  - being explicit about side effects prevents weird states
	- tests are actually fun
	- a strong type system makes code more safe, less bugs, some states are impossible to get into
	- thread safety increasingly important
	- might be less readable if you aren't used to it, makes things more verbose generally
  - there is a learning curve (but I don't mind)


# Why do you care
- already know javascript, now you've got to learn a new language and paradigm at the same time?

## speed
haskell compiler optimizes away your bad decisions
no preact, but it would be fun to test, speed test is open source

## error free
basically guarantees no runtime errors
if you can get it to compile, it will likely work - compiler as programming partner
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
ADT

## deconstruction and pattern matching
make declarative programming easier
similar to es6 deconstruction

## the elm architecture
elm was designed with the purpose of building single pages app, strives to do that well
has a set architecture that it wants you to use
design philosophy is that everything is well thought out, doesn't want to be everything to everyone (talk with the elm guy on twitter)
three pieces: model, update and view (cover more when we get there)

## hello world (simple exposure to arch)
ok, time for some code!
elm provides elm-repl, elm-make and elm-reactor
- main is the "core" of the program. this is the simple version
- model: we define a model type, it can be anything. this is equivalent to a redux store for the moment it's just a string
- update: like redux reducers, here is where changes are applied to the model
	aren't doing any updating yet, so it just returns the model
- view: elm defines dom functions that build a vdom, like react
	just normal function syntax
	they all take two list arguments, attributes and children

## emoji counter (more complex model, actions changing things)
want to list a bunch of emoji and let voting happen on them
- going to start just listing emoji
- model to list of "Emoji" objects
- a more complex view
  - imported needed dom elements: div, ul, li
  - List.map creates an li for each emoji in our list
  - the body of li gets us to our next piece, the update function
  - the buttons emit "Msg"
  - show debugging
  - msgs cause the runtime to fire an update with their value, in this case the emoji and wether we want to increment or decrement
  - maybe implement a Zero branch for the messages?


## web stuff (full on web emoji counter)
ok, that's cool but what about web requests so we can make real applications
emoji api: http://localhost:3000
add types, add cases
commands are another way of saying do something, like a msg, but they produce side effects.
 - our new complex main has an update that produces both a model and a cmd, some msg types will spawn a command
 - the elm runtime "does" the command, then hands the result back
	- getEmoji function produces a command that produces a message...
		- so Http.send is creating a command, that command then creates an addemoji message which the update function will use
    - Http.send AddEmoji (Http.get url decodeEmoji)
    - Decode.at ["emoji"] Decode.string
	- GotEmoji (Ok emoji)
	- GotEmoji (Err )

## Even more.. One Way Tweet
- webpack! good? bad? indifferent?
  - optimized builds
  - css stuff
  - other javascript
  - subscriptions
- speaking of other javascript:
  - twitter api. ports are how we chat back and forth
    - we specially declare them
     - sending
      - button calls a function which hits the created port
     - receiving
       - call app.ports.send from JS
       - subscriptions receieve the value and send a message
       - the message updates the model

## advanced / not covered
subscriptions for things on an interval, a websocket, mouse or keyboard input

## examples
https://learningmusic.ableton.com
https://github.com/rtfeldman/elm-spa-example
