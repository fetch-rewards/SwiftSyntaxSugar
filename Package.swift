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
            from: "600.0.1"
        ),
    ],
    targets: [
        .target(
            name: "SwiftSyntaxSugar",
            dependencies: [
                .product(name: "SwiftSyntax", package: "swift-syntax"),
                .product(name: "SwiftSyntaxBuilder", package: "swift-syntax"),
            ],
            swiftSettings: .default
        ),
        .testTarget(
            name: "SwiftSyntaxSugarTests",
            dependencies: ["SwiftSyntaxSugar"],
            swiftSettings: .default
        ),
    ]
)

// MARK: - Swift Settings

extension SwiftSetting {
    static let internalImportsByDefault: SwiftSetting = .enableUpcomingFeature("InternalImportsByDefault")
    static let existentialAny: SwiftSetting = .enableUpcomingFeature("ExistentialAny")
}

extension Array where Element == SwiftSetting {

    /// Default Swift settings to enable for targets.
    static let `default`: [SwiftSetting] = [
        .existentialAny,
        .internalImportsByDefault
    ]
}
