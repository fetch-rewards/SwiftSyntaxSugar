//
//  AccessorDeclSyntax+Body.swift
//  SwiftSyntaxSugar
//
//  Created by Gray Campbell on 11/3/23.
//

import SwiftSyntax
import SwiftSyntaxBuilder

extension AccessorDeclSyntax {

    /// Returns a copy of the accessor declaration with the provided body.
    ///
    /// - Parameter body: The body of the new accessor declaration.
    /// - Returns: A copy of the accessor declaration with the provided body.
    public func withBody(body: CodeBlockSyntax?) -> AccessorDeclSyntax {
        AccessorDeclSyntax(
            leadingTrivia: self.leadingTrivia,
            attributes: self.attributes,
            modifier: self.modifier,
            accessorSpecifier: self.accessorSpecifier,
            parameters: self.parameters,
            effectSpecifiers: self.effectSpecifiers,
            body: body,
            trailingTrivia: self.trailingTrivia
        )
    }

    /// Returns a copy of the accessor declaration with the provided body.
    ///
    /// - Parameter bodyBuilder: A block used to build the body of the new
    ///   accessor declaration.
    /// - Returns: A copy of the accessor declaration with the provided body.
    public func withBody(
        @CodeBlockItemListBuilder
        bodyBuilder: @escaping () throws -> CodeBlockItemListSyntax?
    ) throws -> AccessorDeclSyntax {
        try AccessorDeclSyntax(
            leadingTrivia: self.leadingTrivia,
            attributes: self.attributes,
            modifier: self.modifier,
            accessorSpecifier: self.accessorSpecifier,
            parameters: self.parameters,
            effectSpecifiers: self.effectSpecifiers,
            bodyBuilder: bodyBuilder,
            trailingTrivia: self.trailingTrivia
        )
    }
}
