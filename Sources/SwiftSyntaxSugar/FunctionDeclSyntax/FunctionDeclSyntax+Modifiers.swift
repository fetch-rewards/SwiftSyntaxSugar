//
//  FunctionDeclSyntax+Modifiers.swift
//  SwiftSyntaxSugar
//
//  Created by Gray Campbell on 7/17/24.
//

import SwiftSyntax
import SwiftSyntaxBuilder

extension FunctionDeclSyntax {

    // MARK: With Modifiers

    /// Returns a copy of the function declaration with the provided modifiers.
    ///
    /// - Parameter modifiers: The modifiers of the new function declaration.
    /// - Returns: A copy of the function declaration with the provided
    ///   modifiers.
    public func withModifiers(
        _ modifiers: DeclModifierListSyntax
    ) -> FunctionDeclSyntax {
        FunctionDeclSyntax(
            leadingTrivia: self.leadingTrivia,
            attributes: self.attributes,
            modifiers: modifiers,
            funcKeyword: self.funcKeyword,
            name: self.name,
            genericParameterClause: self.genericParameterClause,
            signature: self.signature,
            genericWhereClause: self.genericWhereClause,
            body: self.body,
            trailingTrivia: self.trailingTrivia
        )
    }

    /// Returns a copy of the function declaration with the provided modifiers.
    ///
    /// - Parameter modifiers: The modifiers of the new function declaration.
    /// - Returns: A copy of the function declaration with the provided
    ///   modifiers.
    public func withModifiers(
        @DeclModifierListBuilder 
        modifiersBuilder: @escaping () throws -> DeclModifierListSyntax
    ) throws -> FunctionDeclSyntax {
        try self.withModifiers(modifiersBuilder())
    }
}
