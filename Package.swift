// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "MessagePack",
    products: [
        .library(name: "MessagePack", targets: ["MessagePack"])
    ],
    dependencies: [
        .package(path: "../Codable"),
        .package(path: "../Stream"),
        .package(path: "../Radix"),
        .package(path: "../Test")
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
