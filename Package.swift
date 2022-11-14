// swift-tools-version:5.3
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
        .package(
            url: "https://github.com/dmytriigolovanov/webkit-user-agent",
            "3.0.0" ..< "4.0.0"
        )
    ],
    targets: [
        .target(
            name: "Recommend",
            dependencies: [
                .product(
                    name: "WebKitUserAgent",
                    package: "webkit-user-agent"
                )
            ],
            path: "Recommend/Sources",
            linkerSettings: [
                .linkedFramework("UIKit", .when(platforms: [.iOS])),
                .linkedFramework("UserNotifications", .when(platforms: [.iOS]))
            ]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
