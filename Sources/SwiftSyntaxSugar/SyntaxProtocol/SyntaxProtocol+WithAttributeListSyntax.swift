//
//  SyntaxProtocol+WithAttributeListSyntax.swift
//
//  Copyright © 2025 Fetch.
//

public import SwiftSyntax
import SwiftSyntaxBuilder

extension SyntaxProtocol {

    /// Returns a new syntax node that has the child at `keyPath` replaced by an
    /// `AttributeListSyntax` built using `itemsBuilder`.
    ///
    /// - Parameters:
    ///   - keyPath: The key path of the child to replace.
    ///   - itemsBuilder: The items builder with which to build the
    ///     `AttributeListSyntax` value with which to replace the child.
    /// - Returns: A new syntax node that has the child at `keyPath` replaced by
    ///   an `AttributeListSyntax` built using `itemsBuilder`.
    public func with(
        _ keyPath: WritableKeyPath<Self, AttributeListSyntax>,
        @AttributeListBuilder itemsBuilder: @escaping () throws -> AttributeListSyntax
    ) throws -> Self {
        self.with(
            keyPath,
            try AttributeListSyntax(itemsBuilder: itemsBuilder)
        )
    }

    /// Returns a new syntax node that has the child at `keyPath` replaced by an
    /// `AttributeListSyntax` built using `itemsBuilder`.
    ///
    /// - Parameters:
    ///   - keyPath: The key path of the child to replace.
    ///   - itemsBuilder: The items builder with which to build the
    ///     `AttributeListSyntax` value with which to replace the child.
    /// - Returns: A new syntax node that has the child at `keyPath` replaced by
    ///   an `AttributeListSyntax` built using `itemsBuilder`.
    public func with(
        _ keyPath: WritableKeyPath<Self, AttributeListSyntax>,
        @AttributeListBuilder itemsBuilder: @escaping (
            AttributeListSyntax
        ) throws -> AttributeListSyntax
    ) throws -> Self {
        try self.with(keyPath) {
            try itemsBuilder(self[keyPath: keyPath])
        }
    }

    /// Returns a new syntax node that has the child at `keyPath` replaced by an
    /// `AttributeListSyntax` built using `itemsBuilder`.
    ///
    /// - Parameters:
    ///   - keyPath: The key path of the child to replace.
    ///   - itemsBuilder: The items builder with which to build the
    ///     `AttributeListSyntax` value with which to replace the child.
    /// - Returns: A new syntax node that has the child at `keyPath` replaced by
    ///   an `AttributeListSyntax` built using `itemsBuilder`.
    public func with(
        _ keyPath: WritableKeyPath<Self, AttributeListSyntax?>,
        @AttributeListBuilder itemsBuilder: @escaping () throws -> AttributeListSyntax
    ) throws -> Self {
        self.with(
            keyPath,
            try AttributeListSyntax(itemsBuilder: itemsBuilder)
        )
    }

    /// Returns a new syntax node that has the child at `keyPath` replaced by an
    /// `AttributeListSyntax` built using `itemsBuilder`.
    ///
    /// - Parameters:
    ///   - keyPath: The key path of the child to replace.
    ///   - itemsBuilder: The items builder with which to build the
    ///     `AttributeListSyntax` value with which to replace the child.
    /// - Returns: A new syntax node that has the child at `keyPath` replaced by
    ///   an `AttributeListSyntax` built using `itemsBuilder`.
    public func with(
        _ keyPath: WritableKeyPath<Self, AttributeListSyntax?>,
        @AttributeListBuilder itemsBuilder: @escaping (
            AttributeListSyntax?
        ) throws -> AttributeListSyntax
    ) throws -> Self {
        try self.with(keyPath) {
            try itemsBuilder(self[keyPath: keyPath])
        }
    }
}
