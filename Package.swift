// swift-tools-version: 5.9

import PackageDescription

let package = Package(
  name: "Gomamayo",
  products: [
    .executable(
      name: "gomamayo",
      targets: ["Gomamayo"]
    ),
    .library(
      name: "GomamayoDetection",
      targets: ["GomamayoDetection"]
    ),
  ],
  targets: [
    .executableTarget(
      name: "Gomamayo",
      dependencies: ["GomamayoDetection"]
    ),
    .target(
      name: "GomamayoDetection"
    ),
    .testTarget(
      name: "GomamayoDetectionTests",
      dependencies: ["GomamayoDetection"]
    ),
  ]
)
