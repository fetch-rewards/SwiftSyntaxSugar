//
//  ProtocolDeclSyntax+Initializers.swift
//  SwiftSyntaxSugar
//
//  Created by Gray Campbell on 11/30/24.
//

public import SwiftSyntax

extension ProtocolDeclSyntax {

    /// The protocol's initializer declarations.
    public var initializerDeclarations: [InitializerDeclSyntax] {
        self.memberBlock.members.compactMap { member in
            member.decl.as(InitializerDeclSyntax.self)
        }
    }
}
