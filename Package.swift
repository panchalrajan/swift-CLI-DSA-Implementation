// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "DSA",
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.2.0"),
    ],
    targets: [
        .executableTarget(
            name: "DSA",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ]),
        .testTarget(
            name: "DSATests",
            dependencies: ["DSA"]),
    ]
)
