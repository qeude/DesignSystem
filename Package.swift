// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "DesignSystem",
  platforms: [
    .iOS(.v17)
  ],
  products: [
    .library(
      name: "DesignSystem",
      targets: ["DesignSystem"]),
  ],
  dependencies: [
    .package(url: "https://github.com/qeude/MacroKit.git", .upToNextMajor(from: "0.1.0"))
  ],
  targets: [
    .target(
      name: "DesignSystem",
      dependencies: [
        "MacroKit"
      ],
      plugins: []),
    .testTarget(
      name: "DesignSystemTests",
      dependencies: ["DesignSystem"]),
  ]
)
