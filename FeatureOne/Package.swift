// swift-tools-version: 5.10

import PackageDescription

let analyticsDependency = Target.Dependency.product(name: "AbstractAnalytics", package: "AbstractAnalytics")

let package = Package(
    name: "FeatureOne",
    platforms: [.iOS(.v17), .macOS(.v14)],
    products: [
        .library(
            name: "FeatureOne",
            targets: ["FeatureOne"]
        ),
    ],
    dependencies: [
        .package(path: "../AbstractAnalytics")
    ],
    targets: [
        .target(
            name: "FeatureOne",
            dependencies: [analyticsDependency]
        ),
        .testTarget(
            name: "FeatureOneTests",
            dependencies: ["FeatureOne"]
        ),
    ]
)
