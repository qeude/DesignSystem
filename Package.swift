// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "DesignSystem",
  platforms: [
    .iOS("17.0"),
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
      plugins: []),
    .testTarget(
      name: "DesignSystemTests",
      dependencies: ["DesignSystem"]),
  ]
)
