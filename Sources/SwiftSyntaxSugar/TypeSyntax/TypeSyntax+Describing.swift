//
//  TypeSyntax+Describing.swift
//  SwiftSyntaxSugar
//
//  Created by Gray Campbell on 11/4/23.
//

public import SwiftSyntax

extension TypeSyntax {

    /// Creates a new `TypeSyntax` from a `String` representing the given value.
    ///
    /// This initializer uses `String(describing: subject)` to create a `String`
    /// representation of the given value and create a new `TypeSyntax`.
    ///
    /// Use this initializer to create a `TypeSyntax` instance from a type. This
    /// removes the need to use string literals to create `TypeSyntax` instances
    /// in most cases.
    ///
    /// ```swift
    /// TypeSyntax(describing: Int.self)
    /// ```
    public init(describing subject: some Any) {
        self.init(stringLiteral: String(describing: subject))
    }
}

// MARK: - TypeSyntaxProtocol

extension TypeSyntaxProtocol where Self == TypeSyntax {

    /// A `TypeSyntax` instance describing `Bool`.
    public static var bool: TypeSyntax { TypeSyntax(describing: Bool.self) }

    /// A `TypeSyntax` instance describing `Int`.
    public static var int: TypeSyntax { TypeSyntax(describing: Int.self) }

    /// A `TypeSyntax` instance describing `String`.
    public static var string: TypeSyntax { TypeSyntax(describing: String.self) }

    /// A `TypeSyntax` instance describing `Void`.
    public static var void: TypeSyntax { "Void" }
}
