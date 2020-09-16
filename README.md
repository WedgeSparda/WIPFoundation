# {**WIP**} *Core*

![Run Tests Workflow](https://github.com/WedgeSparda/WIPFoundation/workflows/Run%20Tests%20Workflow/badge.svg)

## Summary
* [What is this?](#what-is-this)
* [Requirements](#requirement)
* [How to install](#how-to-install)
  * [Swift Package Manager](#swift-package-manager)
* [How to use it](#how-to-use-it)
* [How to contribute](#how-to-contribute)
* [Projects using {**WIP**} *Core*](#projects-using-wip-core)
* [Inspiration](#inspiration)

## What is this?

{**WIP**} *Core* is the foundation stone for a series of frameworks I use in my projects. It is just a couple of protocols and a struct designed to extend any Swift type in order to create safe namespace extensions.

So, instead of having this:

```swift
aType.myAwesomeExtendedFunction()
```

You can have this:

```swift
aType.wip.myAwesomeExtendedFunction()
```

This way you avoid any collision with other frameworks extending the same type. (Trust me, it happens...)

## Requirements
+ iOS 13.0+ 
+ macOS 10.14+
+ watchOS 6.0
+ tvOS 13.0
+ Swift 5.0+ 

## How to install

### Swift Package Manager
*Work in Progress...*

## How to use it

Depending on the type you want to extend, value type (String, Struct...) or reference type (Classes), you need to use one of these:

```swift
// For value types
extension ValueType: WIPCompatibleValueType {}
extension WIPContainer where T == ValueType {
  // Your extended code here...
}

// For reference types
extension ReferenceType: WIPCompatibleReferenceType {}
extension WIPContainer where T: ReferenceType {
  // Your extended code here...
}
```

So, in case you want to extend the `String` type, you have to set it like this.

```swift
extension String: WIPCompatibleValueType {}
extension WIPContainer where T == String {
  func myAwesomeExtendedFunction() { ... }
}
```

And then use your extended code like this:

```swift
"My awesome string".wip.myAwesomeExtendedFunction()
```

If you need to access the current extended type within the `WIPContainer` extension you can do it using the `type` property, instead of `self`.

```swift
extension WIPContainer where T == String {
  var myAwesomeExtendedProperty: Bool {
    // In this case, type is the extended String
    let currentType = type 
    ...
  }
}
```

That's it!

## How to contribute
*Work in Progress...*

## Projects using {**WIP**} *Core*
*Work in Progress...*

## Inspiration

The inspiration for this solution came 100% from [Kingfisher](https://github.com/onevcat/Kingfisher), an amazing Swift library for downloading and caching images.

