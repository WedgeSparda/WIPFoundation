# {WIP} Extensions

## What is this?

{**WIP**} *Extensions* is a collection of extensions for some *Foundation* framework and *Swift Standard Library* types. 

## How to use?

First import the framework with

```swift
import WIPFoundation
```

Then, if the type is compatible with {**WIP**} *Extensions*, use the `wip` namespace to access the available functions and/or variables. For example:

```swift
var value: String = "Hello World!"
value.wip.hasLetters // true
```

## List of extended types

- [String](#string)

## String

Here is the list of available helpers for the `String` type:
```swift
hasLetters // String value has any letter.

hasNumbers // String value has any numer.

isAlphabetic // String value ONLY has letters.

isAlphanumeric // String value has letters AND numbers.

isNumeric // String value ONLY has numbers.

base64Encoded // String representation of the Base64 for the value.

base64Decoded // String value of a previous Base64 encoded text.
```