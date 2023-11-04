//
//  ProtocolDeclSyntax+Variables.swift
//  SwiftSyntaxSugar
//
//  Created by Gray Campbell on 11/4/23.
//

import SwiftSyntax

extension ProtocolDeclSyntax {

    /// The protocol's variable declarations.
    public var variableDeclarations: [VariableDeclSyntax] {
        self.memberBlock.members.compactMap { member in
            member.decl.as(VariableDeclSyntax.self)
        }
    }
}
