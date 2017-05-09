# What is it
like react or angular, V in MVC
haskell/ml like syntax, not quite haskell (type classes)
currently 0.18, used by a couple smaller companies as part of their code base

# what we're going to talk about
basic syntax
structure of an application and simple uses
skipping some advanced topics

# Why do you care

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
types as a language abstraction to aide in programming, let you codify functionality
not as complete as haskell where you can define type classes, but that's beyond the scope of this
record update creates new record

## functions
more complex type signatures
functions are themselves values that you can pass to other functions

## flow control
if is as expected, but the else is required
case should also be familiar, but we need to match *every* value
underscore for values we don't really care about

## deconstruction and pattern matching

## the elm architecture
elm was designed with the purpose of building single pages app, strives to do that well
has a set architecture that it wants you to use
design philosophy is that everything is well thought out, doesn't want to be everything to everyone (talk with the elm guy on twitter)
