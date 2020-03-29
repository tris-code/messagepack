// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "MessagePack",
    products: [
        .library(name: "MessagePack", targets: ["MessagePack"])
    ],
    dependencies: [
        .package(path: "../codable"),
        .package(path: "../stream"),
        .package(path: "../radix"),
        .package(path: "../test")
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
