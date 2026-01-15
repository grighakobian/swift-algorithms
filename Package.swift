// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "swift-algorithms",
    platforms: [
        .macOS(.v11),
        .iOS(.v12),
        .watchOS(.v6),
        .tvOS(.v12),
        .visionOS(.v1)
    ],
    targets: [
        .target(
            name: "SwiftAlgorithms"),
        .testTarget(
            name: "SwiftAlgorithmsTests",
            dependencies: ["SwiftAlgorithms"]),
    ]
)
