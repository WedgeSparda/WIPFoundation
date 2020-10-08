// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "WIPFoundation",
    platforms: [
        .iOS(.v13), .macOS(.v10_14), .tvOS(.v13), .watchOS(.v6)
    ],
    products: [
        .library(name: "WIPFoundation", targets: ["WIPFoundation"])
    ],
    targets: [
        .target(
            name: "WIPFoundation",
            path: "Sources")
    ]
)
