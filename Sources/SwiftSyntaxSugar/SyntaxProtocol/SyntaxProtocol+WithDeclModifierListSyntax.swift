//
//  SyntaxProtocol+WithDeclModifierListSyntax.swift
//  SwiftSyntax
//
//  Created by Gray Campbell on 7/17/24.
//

import SwiftSyntax
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
        @DeclModifierListBuilder
        itemsBuilder: @escaping () throws -> DeclModifierListSyntax
    ) throws -> Self {
        self.with(
            keyPath,
            try DeclModifierListSyntax(itemsBuilder: itemsBuilder)
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
        @DeclModifierListBuilder
        itemsBuilder: @escaping () throws -> DeclModifierListSyntax
    ) throws -> Self {
        self.with(
            keyPath,
            try DeclModifierListSyntax(itemsBuilder: itemsBuilder)
        )
    }
}
