//
//  FunctionDeclSyntax+Body.swift
//  SwiftSyntaxSugar
//
//  Created by Gray Campbell on 11/4/23.
//

import SwiftSyntax
import SwiftSyntaxBuilder

extension FunctionDeclSyntax {

    /// Returns a copy of the function declaration with the provided body.
    ///
    /// - Parameter body: The body of the new function declaration.
    /// - Returns: A copy of the function declaration with the provided body.
    public func withBody(_ body: CodeBlockSyntax?) -> FunctionDeclSyntax {
        FunctionDeclSyntax(
            leadingTrivia: self.leadingTrivia,
            attributes: self.attributes,
            modifiers: self.modifiers,
            funcKeyword: self.funcKeyword,
            name: self.name,
            genericParameterClause: self.genericParameterClause,
            signature: self.signature,
            genericWhereClause: self.genericWhereClause,
            body: body,
            trailingTrivia: self.trailingTrivia
        )
    }

    /// Returns a copy of the function declaration with the provided body.
    ///
    /// - Parameter bodyBuilder: A block used to build the body of the new
    ///   function declaration.
    /// - Returns: A copy of the function declaration with the provided body.
    public func withBody(
        @CodeBlockItemListBuilder
        bodyBuilder: @escaping () throws -> CodeBlockItemListSyntax?
    ) throws -> FunctionDeclSyntax {
        try FunctionDeclSyntax(
            leadingTrivia: self.leadingTrivia,
            attributes: self.attributes,
            modifiers: self.modifiers,
            funcKeyword: self.funcKeyword,
            name: self.name,
            genericParameterClause: self.genericParameterClause,
            signature: self.signature,
            genericWhereClause: self.genericWhereClause,
            bodyBuilder: bodyBuilder,
            trailingTrivia: self.trailingTrivia
        )
    }
}
