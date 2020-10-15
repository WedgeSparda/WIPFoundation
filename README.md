# {**WIP**} *Foundation*

<div align="center">

<a href="https://github.com/WedgeSparda/WIPFoundation/actions?query=workflow%3ATests"><img src="https://github.com/WedgeSparda/WIPFoundation/workflows/Tests/badge.svg"/></a>
<a href="https://swift.org/package-manager/"><img src="https://img.shields.io/badge/SPM-supported-orange.svg?style=flat"/></a>
</div>

## Summary
* [What is this?](#what-is-this)
  * [{WIP} Core](docs/WIPCore.md)
  * [{WIP} Extensions](docs/WIPExtensions.md)
* [Requirements](#requirement)
* [How to install](#how-to-install)
  * [Swift Package Manager](#swift-package-manager)
* [How to contribute](#how-to-contribute)
* [Projects using {WIP} Foundation](#projects-using-wip-foundation)
* [Inspiration](#inspiration)

## What is this?

{**WIP**} *Foundation* is a collection of extensions for some *Foundation* framework and *Swift Standard Library* types. They can be used on your project (like I do) to minimize boilerplate code or provide helpers.

All extensions are based on the {**WIP**} *Core* namespacing approach. You can know more about it [here](docs/WIPCore.md).

## Requirements
+ iOS 13.0+ 
+ macOS 10.14+
+ watchOS 6.0
+ tvOS 13.0
+ Swift 5.0+ 


In order to work with this project you need:

- [XcodeGen](https://github.com/yonaskolb/XcodeGen): to create the `xcodeproj`.
- [SwiftLint](https://github.com/realm/SwiftLint): to keep the code styling.
- [Mint](https://github.com/yonaskolb/Mint): to install `XcodeGen` and `SwiftLint`
- [Fastlane](https://fastlane.tools/): to run tests.


Best option to install all these dependencies is running this command line from the project's root:
```
sh scripts/install_dependencies.sh
```

## How to install

To install the framework on your project, please use:

### Swift Package Manager (Xcode 11+)

1. Select File > Swift Packages > Add Package Dependency
2. Type `https://github.com/WedgeSparda/WIPFoundation` in the "Enter package repository URL"

## How to contribute

If you wish to contribute to the project, check the [Contributing](CONTRIBUTING.md) documentation.

## Inspiration

The inspiration for **{WIP}** *Core* namespacing came 100% from [Kingfisher](https://github.com/onevcat/Kingfisher), an amazing Swift library for downloading and caching images.

