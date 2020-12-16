// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "PokerHandEvaluator",
    products: [
        .library(
            name: "PokerHandEvaluator",
            targets: ["PokerHandEvaluator"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "PokerHandEvaluator",
            dependencies: []),
        .testTarget(
            name: "PokerHandEvaluatorTests",
            dependencies: ["PokerHandEvaluator"]),
    ]
)
