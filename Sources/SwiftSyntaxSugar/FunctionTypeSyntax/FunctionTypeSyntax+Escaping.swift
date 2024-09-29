//
//  FunctionTypeSyntax+Escaping.swift
//  SwiftSyntaxSugar
//
//  Created by Gray Campbell on 11/4/23.
//

import SwiftSyntax

extension FunctionTypeSyntax {

    /// Returns an escaping version of the function type.
    ///
    /// - Returns: An escaping version of the function type.
    public func escaping() -> AttributedTypeSyntax {
        // TODO: Remove specifiers argument when deprecated init is removed.
        AttributedTypeSyntax(
            specifiers: [],
            attributes: AttributeListSyntax {
                AttributeSyntax(
                    atSign: .atSignToken(),
                    attributeName: IdentifierTypeSyntax(
                        name: .keyword(.escaping)
                    )
                )
            },
            baseType: self
        )
    }
}
