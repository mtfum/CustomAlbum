// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "CustomAlbum",
  platforms: [.iOS(.v11)],
  products: [
    .library(
      name: "CustomAlbum",
      targets: ["CustomAlbum"]),
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "CustomAlbum",
      path: "Sources/CustomAlbum"),
    .testTarget(
      name: "CustomAlbumTests",
      dependencies: ["CustomAlbum"]),
  ]
)
