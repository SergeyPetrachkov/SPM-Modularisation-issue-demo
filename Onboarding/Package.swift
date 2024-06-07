// swift-tools-version: 5.10

import PackageDescription

let analyticsDependency = Target.Dependency.product(name: "AbstractAnalytics", package: "AbstractAnalytics")
let analyticsMocksDependency = Target.Dependency.product(name: "AbstractAnalyticsMocks", package: "AbstractAnalytics")

let package = Package(
    name: "Onboarding",
    platforms: [.iOS(.v17), .macOS(.v14)],
    products: [
        .library(
            name: "Onboarding",
            targets: ["Onboarding"]
        ),
    ],
    dependencies: [
        .package(path: "../AbstractAnalytics")
    ],
    targets: [
        .target(
            name: "Onboarding",
            dependencies: [analyticsDependency]
        ),
        .testTarget(
            name: "OnboardingTests",
            dependencies: ["Onboarding", analyticsMocksDependency]
        ),
    ]
)
