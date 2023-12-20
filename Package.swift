// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "DesignSystem",
  platforms: [
    .iOS(.v17),
    .macOS(.v14),
    .watchOS(.v10)
  ],
  products: [
    .library(
      name: "DesignSystem",
      targets: ["DesignSystem"]),
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "DesignSystem",
      dependencies: [
      ],
      resources: [
          .process("Resources"),
        ],
      plugins: []),
    .testTarget(
      name: "DesignSystemTests",
      dependencies: ["DesignSystem"]),
  ]
)
