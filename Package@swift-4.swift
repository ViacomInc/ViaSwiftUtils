// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "ViaSwiftUtils",
//    exclude: ["iOSTests", "Example","Carthage","Images","Sources/ViaSwiftUtils/UIKit"],
    products: [
        .library(
            name: "ViaSwiftUtils",
            targets: ["ViaSwiftUtils"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ViaSwiftUtils",
            dependencies: []
        ),
        .testTarget(
            name: "ViaSwiftUtilsTests",
            dependencies: ["ViaSwiftUtils"]
        )
    ]
)
