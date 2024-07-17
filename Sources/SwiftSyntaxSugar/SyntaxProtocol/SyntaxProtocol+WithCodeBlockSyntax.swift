//
//  SyntaxProtocol+WithCodeBlockSyntax.swift
//  SwiftSyntaxSugar
//
//  Created by Gray Campbell on 7/17/24.
//

import SwiftSyntax
import SwiftSyntaxBuilder

extension SyntaxProtocol {

    /// Returns a new syntax node that has the child at `keyPath` replaced by a
    /// `CodeBlockSyntax` built using `statementsBuilder`.
    ///
    /// - Parameters:
    ///   - keyPath: The key path of the child to replace.
    ///   - statementsBuilder: The statements builder with which to build the
    ///     `CodeBlockSyntax` value with which to replace the child.
    /// - Returns: A new syntax node that has the child at `keyPath` replaced by
    ///   a `CodeBlockSyntax` built using `statementsBuilder`.
    public func with(
        _ keyPath: WritableKeyPath<Self, CodeBlockSyntax>,
        @CodeBlockItemListBuilder
        statementsBuilder: @escaping () throws -> CodeBlockItemListSyntax
    ) throws -> Self {
        self.with(
            keyPath,
            try CodeBlockSyntax(statementsBuilder: statementsBuilder)
        )
    }

    /// Returns a new syntax node that has the child at `keyPath` replaced by a
    /// `CodeBlockSyntax` built using `statementsBuilder`.
    ///
    /// - Parameters:
    ///   - keyPath: The key path of the child to replace.
    ///   - statementsBuilder: The statements builder with which to build the
    ///     `CodeBlockSyntax` value with which to replace the child.
    /// - Returns: A new syntax node that has the child at `keyPath` replaced by
    ///   a `CodeBlockSyntax` built using `statementsBuilder`.
    public func with(
        _ keyPath: WritableKeyPath<Self, CodeBlockSyntax?>,
        @CodeBlockItemListBuilder
        statementsBuilder: @escaping () throws -> CodeBlockItemListSyntax
    ) throws -> Self {
        self.with(
            keyPath,
            try CodeBlockSyntax(statementsBuilder: statementsBuilder)
        )
    }
}
