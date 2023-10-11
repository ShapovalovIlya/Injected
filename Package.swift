// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Injected",
    platforms: [
        .macOS(.v10_13),
        .iOS(.v12)
    ],
    products: [
        .library(name: "Injected",targets: ["Injected"]),
    ],
    targets: [
        .target(name: "Injected"),
        .testTarget(
            name: "InjectedTests",
            dependencies: ["Injected"]),
    ]
)
