//
//  ProtocolDeclSyntax+Variables.swift
//
//  Created by Gray Campbell.
//  Copyright © 2024 Fetch.
//

public import SwiftSyntax

extension ProtocolDeclSyntax {

    /// The protocol's variable declarations.
    public var variableDeclarations: [VariableDeclSyntax] {
        self.memberBlock.members.compactMap { member in
            member.decl.as(VariableDeclSyntax.self)
        }
    }
}
