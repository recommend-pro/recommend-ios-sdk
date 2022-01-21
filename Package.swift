// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Recommend",
    platforms: [.iOS(.v11)],
    products: [
        .library(
            name: "Recommend",
            targets: ["Recommend"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Recommend",
            dependencies: [],
            path: "Recommend/Sources"),
    ],
    swiftLanguageVersions: [.v5]
)
