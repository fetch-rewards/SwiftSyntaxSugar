//
//  InheritedTypeListSyntax+IdentifierTypes.swift
//  SwiftSyntaxSugar
//
//  Created by Gray Campbell on 11/4/23.
//

public import SwiftSyntax

extension InheritedTypeListSyntax {

    /// The list's `IdentifierTypeSyntax` inherited types.
    public var identifierTypes: [IdentifierTypeSyntax] {
        self.compactMap { inheritedType in
            inheritedType.type.as(IdentifierTypeSyntax.self)
        }
    }
}
