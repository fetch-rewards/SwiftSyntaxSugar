//
//  ProtocolDeclSyntax+AssociatedTypes.swift
//
//  Created by Gray Campbell.
//  Copyright © 2024 Fetch.
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
