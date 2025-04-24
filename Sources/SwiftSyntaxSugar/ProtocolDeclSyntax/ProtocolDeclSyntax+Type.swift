//
//  ProtocolDeclSyntax+Type.swift
//
//  Copyright © 2025 Fetch.
//

public import SwiftSyntax

extension ProtocolDeclSyntax {

    /// The protocol as a type.
    public var type: TypeSyntax {
        TypeSyntax(
            IdentifierTypeSyntax(name: self.name)
        )
    }
}
