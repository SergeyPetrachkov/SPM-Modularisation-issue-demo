// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "AbstractAnalyticsMocks",
    platforms: [.iOS(.v17), .macOS(.v14)],
    products: [
        .library(
            name: "AbstractAnalyticsMocks",
            type: .dynamic,
            targets: ["AbstractAnalyticsMocks"]
        ),
    ],
    dependencies: [
        .package(path: "../AbstractAnalytics")
    ],
    targets: [
        .target(
            name: "AbstractAnalyticsMocks",
            dependencies: [
                "AbstractAnalytics"
            ]
        )
    ]
)
