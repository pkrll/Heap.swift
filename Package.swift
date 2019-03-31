// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "Heap",
	products: [
		.library(
			name: "Heap",
			targets: ["Heap"]
		)
	],
	dependencies: [],
	targets: [
		.target(
			name: "Heap",
			dependencies: []
		),
		.testTarget(
			name: "HeapTests",
			dependencies: ["Heap"]
		)
	]
)
