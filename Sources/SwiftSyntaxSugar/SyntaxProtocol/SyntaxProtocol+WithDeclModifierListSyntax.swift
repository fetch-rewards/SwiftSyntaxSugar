//
//  SyntaxProtocol+WithDeclModifierListSyntax.swift
//
//  Created by Gray Campbell.
//  Copyright © 2024 Fetch.
//

public import SwiftSyntax
import SwiftSyntaxBuilder

extension SyntaxProtocol {

    /// Returns a new syntax node that has the child at `keyPath` replaced by a
    /// `DeclModifierListSyntax` built using `itemsBuilder`.
    ///
    /// - Parameters:
    ///   - keyPath: The key path of the child to replace.
    ///   - itemsBuilder: The items builder with which to build the
    ///     `DeclModifierListSyntax` value with which to replace the child.
    /// - Returns: A new syntax node that has the child at `keyPath` replaced by
    ///   a `DeclModifierListSyntax` built using `itemsBuilder`.
    public func with(
        _ keyPath: WritableKeyPath<Self, DeclModifierListSyntax>,
        @DeclModifierListBuilder itemsBuilder: @escaping () throws -> DeclModifierListSyntax
    ) throws -> Self {
        try self.with(
            keyPath,
            DeclModifierListSyntax(itemsBuilder: itemsBuilder)
        )
    }

    /// Returns a new syntax node that has the child at `keyPath` replaced by a
    /// `DeclModifierListSyntax` built using `itemsBuilder`.
    ///
    /// - Parameters:
    ///   - keyPath: The key path of the child to replace.
    ///   - itemsBuilder: The items builder with which to build the
    ///     `DeclModifierListSyntax` value with which to replace the child.
    /// - Returns: A new syntax node that has the child at `keyPath` replaced by
    ///   a `DeclModifierListSyntax` built using `itemsBuilder`.
    public func with(
        _ keyPath: WritableKeyPath<Self, DeclModifierListSyntax>,
        @DeclModifierListBuilder itemsBuilder: @escaping (DeclModifierListSyntax) throws
            -> DeclModifierListSyntax
    ) throws -> Self {
        try self.with(keyPath) {
            try itemsBuilder(self[keyPath: keyPath])
        }
    }

    /// Returns a new syntax node that has the child at `keyPath` replaced by a
    /// `DeclModifierListSyntax` built using `itemsBuilder`.
    ///
    /// - Parameters:
    ///   - keyPath: The key path of the child to replace.
    ///   - itemsBuilder: The items builder with which to build the
    ///     `DeclModifierListSyntax` value with which to replace the child.
    /// - Returns: A new syntax node that has the child at `keyPath` replaced by
    ///   a `DeclModifierListSyntax` built using `itemsBuilder`.
    public func with(
        _ keyPath: WritableKeyPath<Self, DeclModifierListSyntax?>,
        @DeclModifierListBuilder itemsBuilder: @escaping () throws -> DeclModifierListSyntax
    ) throws -> Self {
        try self.with(
            keyPath,
            DeclModifierListSyntax(itemsBuilder: itemsBuilder)
        )
    }

    /// Returns a new syntax node that has the child at `keyPath` replaced by a
    /// `DeclModifierListSyntax` built using `itemsBuilder`.
    ///
    /// - Parameters:
    ///   - keyPath: The key path of the child to replace.
    ///   - itemsBuilder: The items builder with which to build the
    ///     `DeclModifierListSyntax` value with which to replace the child.
    /// - Returns: A new syntax node that has the child at `keyPath` replaced by
    ///   a `DeclModifierListSyntax` built using `itemsBuilder`.
    public func with(
        _ keyPath: WritableKeyPath<Self, DeclModifierListSyntax?>,
        @DeclModifierListBuilder itemsBuilder: @escaping (DeclModifierListSyntax?) throws
            -> DeclModifierListSyntax
    ) throws -> Self {
        try self.with(keyPath) {
            try itemsBuilder(self[keyPath: keyPath])
        }
    }
}
