# SwiftSyntaxSugar

SwiftSyntaxSugar is a library that provides syntactic sugar and helpful extensions for [SwiftSyntax](https://github.com/swiftlang/swift-syntax). The purpose of this library is to improve the readability and maintainability of code written using SwiftSyntax.

## Installation

To add SwiftSyntaxSugar to a Swift package manifest file:
- Add the SwiftSyntaxSugar package to your package's `dependencies`:
  ```swift
  .package(
      url: "https://github.com/fetch-rewards/SwiftSyntaxSugar.git",
      from: "<#latest SwiftSyntaxSugar tag#>"
  )
  ```
- Add the SwiftSyntaxSugar product to your target's `dependencies`:
  ```swift
  .product(name: "SwiftSyntaxSugar", package: "SwiftSyntaxSugar")
  ```

## License

This library is released under the MIT license. See [LICENSE](https://github.com/fetch-rewards/SwiftSyntaxSugar/blob/main/LICENSE) for details.
