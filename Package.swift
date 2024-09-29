// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "SwiftSyntaxSugar",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6),
        .macCatalyst(.v13),
    ],
    products: [
        .library(
            name: "SwiftSyntaxSugar",
            targets: ["SwiftSyntaxSugar"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/apple/swift-syntax.git",
            exact: "600.0.1"
        ),
    ],
    targets: [
        .target(
            name: "SwiftSyntaxSugar",
            dependencies: [
                .product(name: "SwiftSyntax", package: "swift-syntax"),
                .product(name: "SwiftSyntaxBuilder", package: "swift-syntax"),
            ]
        ),
        .testTarget(
            name: "SwiftSyntaxSugarTests",
            dependencies: ["SwiftSyntaxSugar"]
        ),
    ]
)
