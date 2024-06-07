// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "AbstractAnalytics",
    platforms: [.iOS(.v17), .macOS(.v14)],
    products: [
        .library(
            name: "AbstractAnalytics",
            type: .dynamic,
            targets: ["AbstractAnalytics"]
        )
    ],
    targets: [
        .target(name: "AbstractAnalytics", path: "./Sources/AbstractAnalytics/")
    ]
)
