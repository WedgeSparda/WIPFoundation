// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "WIPFoundation",
    platforms: [
        .iOS(.v14), .macOS(.v10_15), .tvOS(.v14), .watchOS(.v7)
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
