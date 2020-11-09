// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "WIPFoundation",
    products: [
        .library(
            name: "WIPFoundation",
            targets: ["WIPFoundation"]
        )
    ],
    targets: [
        .target(
            name: "WIPFoundation",
            path: "Source"
        ),
        .testTarget(
            name: "WIPFoundationTests",
            dependencies: ["WIPFoundation"],
            path: "Tests", 
            exclude: [
                "Info.plist"
            ]
        )
    ],
    swiftLanguageVersions: [.v5]
)
