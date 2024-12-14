//
//  InheritedTypeListSyntax+IdentifierTypes.swift
//
//  Created by Gray Campbell.
//  Copyright © 2024 Fetch.
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
