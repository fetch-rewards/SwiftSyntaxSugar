//
//  ProtocolDeclSyntax+AssociatedTypes.swift
//  SwiftSyntaxSugar
//
//  Created by Gray Campbell on 11/4/23.
//

public import SwiftSyntax

extension ProtocolDeclSyntax {

    /// The protocol's associated type declarations.
    public var associatedTypeDeclarations: [AssociatedTypeDeclSyntax] {
        self.memberBlock.members.compactMap { member in
            member.decl.as(AssociatedTypeDeclSyntax.self)
        }
    }
}
