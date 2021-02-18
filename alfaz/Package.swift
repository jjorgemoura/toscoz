// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "alfaz",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "alfaz",
            type: .dynamic,
            targets: ["alfaz"]),
        .library(
            name: "alfazLive",
            type: .dynamic,
            targets: ["alfazLive"])
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "alfaz",
            dependencies: []),
        .testTarget(
            name: "alfazTests",
            dependencies: ["alfaz"]),
        .target(
            name: "alfazLive",
            dependencies: ["alfaz"])
    ]
)
