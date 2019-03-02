// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "Alice",
    products: [
        .library(name: "Alice",
				 targets: ["Alice"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "Alice",
				dependencies: []),
        .testTarget(name: "AliceTests",
					dependencies: ["Alice"]),
    ]
)
