//
//  ProtocolDeclSyntax+Functions.swift
//  SwiftSyntaxSugar
//
//  Created by Gray Campbell on 11/4/23.
//

import SwiftSyntax

extension ProtocolDeclSyntax {

    /// The protocol's function declarations.
    public var functionDeclarations: [FunctionDeclSyntax] {
        self.memberBlock.members.compactMap { member in
            member.decl.as(FunctionDeclSyntax.self)
        }
    }
}
