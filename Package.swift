// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "MessagePack",
    products: [
        .library(name: "MessagePack", targets: ["MessagePack"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/tris-code/codable.git",
            .branch("master")),
        .package(
            url: "https://github.com/tris-code/stream.git",
            .branch("master")),
        .package(
            url: "https://github.com/tris-code/radix.git",
            .branch("master")),
        .package(
            url: "https://github.com/tris-code/test.git",
            .branch("master"))
    ],
    targets: [
        .target(
            name: "MessagePack",
            dependencies: ["Codable", "Stream", "Hex"]),
        .testTarget(
            name: "MessagePackTests",
            dependencies: ["MessagePack", "Test"])
    ]
)
