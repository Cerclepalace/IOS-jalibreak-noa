// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "SEC-iOS",
    platforms: [.iOS(.v18)],
    products: [
        .library(name: "SecIOSCore", targets: ["SecIOSCore"])
    ],
    targets: [
        .target(name: "SecIOSCore"),
        .testTarget(name: "SecIOSCoreTests", dependencies: ["SecIOSCore"])
    ]
)
