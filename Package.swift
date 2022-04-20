// swift-tools-version:5.6
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
            path: "Recommend/Sources",
            linkerSettings: [.linkedFramework("UIKit", .when(platforms: [.iOS])),
                             .linkedFramework("UserNotifications", .when(platforms: [.iOS]))
            ]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
