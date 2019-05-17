// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "Alice",
	platforms: [
		.macOS(.v10_14),
		.iOS(.v12),
		.tvOS(.v12),
		.watchOS(.v5)
	],
    products: [
        .library(name: "Alice",
				 type: .dynamic,
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
