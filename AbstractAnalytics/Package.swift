// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "AbstractAnalytics",
    platforms: [.iOS(.v17), .macOS(.v14)],
    products: [
        .library(
            name: "AbstractAnalytics",
//            type: .dynamic,
            targets: ["AbstractAnalytics"]
        ),
        .library(
            name: "AbstractAnalyticsMocks",
//            type: .dynamic,
            targets: ["AbstractAnalyticsMocks"]
        )
    ],
    targets: [
        .target(name: "AbstractAnalytics", path: "./Sources/AbstractAnalytics/"),
        .target(name: "AbstractAnalyticsMocks", dependencies: ["AbstractAnalytics"], path: "./Mocks/")
    ]
)
