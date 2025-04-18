# SwiftSyntaxSugar

[![ci](https://github.com/fetch-rewards/SwiftSyntaxSugar/actions/workflows/ci.yml/badge.svg)](https://github.com/fetch-rewards/SwiftSyntaxSugar/actions/workflows/ci.yml?query=branch%3Amain)
[![codecov](https://codecov.io/gh/fetch-rewards/SwiftSyntaxSugar/graph/badge.svg?token=gTqOi09vx5)](https://codecov.io/gh/fetch-rewards/SwiftSyntaxSugar)
[![License](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://github.com/fetch-rewards/SwiftSyntaxSugar/blob/feature/readme/LICENSE)

`SwiftSyntaxSugar` is a library that provides syntactic sugar and helpful extensions for [`SwiftSyntax`](https://github.com/swiftlang/swift-syntax). 
The purpose of this library is to improve the readability and maintainability of code written using `SwiftSyntax`.

- [Example](#example)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Example

<table>
<tr>
<td> With <code>SwiftSyntaxSugar</code> </td>
<td> Without <code>SwiftSyntaxSugar</code> </td> 
</tr>
<tr>
<td>
  
```swift
protocolDeclaration.isActorConstrained    
```

</td>
<td>
  
```swift
let isProtocolActorConstrained = protocolDeclaration.inheritanceClause?.inheritedTypes.contains { inheritedType in    
    let identifierType = inheritedType.type.as(IdentifierTypeSyntax.self)
    return identifierType.name.tokenKind == .identifier("Actor")
} ?? false
```

</td>
</tr>
</table>

## Installation

To add `SwiftSyntaxSugar` to a Swift package manifest file:
- Add the `SwiftSyntaxSugar` package to your package's `dependencies`:
  ```swift
  .package(
      url: "https://github.com/fetch-rewards/SwiftSyntaxSugar.git",
      from: "<#latest SwiftSyntaxSugar tag#>"
  )
  ```
- Add the `SwiftSyntaxSugar` product to your target's `dependencies`:
  ```swift
  .product(name: "SwiftSyntaxSugar", package: "SwiftSyntaxSugar")
  ```

## Usage

- Import `SwiftSyntaxSugar`:
  ```swift
  import SwiftSyntaxSugar
  ```
- Use `SwiftSyntax` exactly how you normally would!

## Contributing

The simplest way to contribute to this project is by [opening an issue](https://github.com/fetch-rewards/SwiftSyntaxSugar/issues/new).

If you would like to contribute code to this project, please read our [Contributing Guidelines](https://github.com/fetch-rewards/SwiftSyntaxSugar/blob/main/CONTRIBUTING.md).

By opening an issue or contributing code to this project, you agree to follow our [Code of Conduct](https://github.com/fetch-rewards/SwiftSyntaxSugar/blob/main/CODE_OF_CONDUCT.md).

## License

This library is released under the MIT license. See [LICENSE](https://github.com/fetch-rewards/SwiftSyntaxSugar/blob/main/LICENSE) for details.
