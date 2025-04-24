//
//  SyntaxProtocol+WithCodeBlockSyntax.swift
//
//  Copyright © 2025 Fetch.
//

public import SwiftSyntax
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
        @CodeBlockItemListBuilder statementsBuilder: @escaping () throws -> CodeBlockItemListSyntax
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
        _ keyPath: WritableKeyPath<Self, CodeBlockSyntax>,
        @CodeBlockItemListBuilder statementsBuilder: @escaping (
            CodeBlockSyntax
        ) throws -> CodeBlockItemListSyntax
    ) throws -> Self {
        try self.with(keyPath) {
            try statementsBuilder(self[keyPath: keyPath])
        }
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
        @CodeBlockItemListBuilder statementsBuilder: @escaping () throws -> CodeBlockItemListSyntax
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
        @CodeBlockItemListBuilder statementsBuilder: @escaping (
            CodeBlockSyntax?
        ) throws -> CodeBlockItemListSyntax
    ) throws -> Self {
        try self.with(keyPath) {
            try statementsBuilder(self[keyPath: keyPath])
        }
    }
}
