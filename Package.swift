// swift-tools-version:6.1
import PackageDescription

let package = Package(
    name: "PageSegmentControl",
    platforms: [.iOS(.v17), .macOS(.v13)],
    products: [
        .library(name: "PageSegmentControl", targets: ["PageSegmentControl"])
    ],
    targets: [
        .target(
            name: "PageSegmentControl",
            path: "Sources"
        )
    ]
)
