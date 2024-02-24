// swift-tools-version: 5.9

import PackageDescription

let package = Package(
  name: "Gomamayo",
  products: [
    .executable(
      name: "gomamayo",
      targets: ["Gomamayo"]
    ),
  ],
  targets: [
    .executableTarget(
      name: "Gomamayo"
    ),
  ]
)
