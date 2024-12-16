//
//  FunctionTypeSyntax+Escaping.swift
//
//  Created by Gray Campbell.
//  Copyright © 2024 Fetch.
//

public import SwiftSyntax

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
