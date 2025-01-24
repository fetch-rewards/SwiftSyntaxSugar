//
//  ProtocolDeclSyntax+Functions.swift
//
//  Created by Gray Campbell.
//  Copyright © 2025 Fetch.
//

public import SwiftSyntax

extension ProtocolDeclSyntax {

    /// The protocol's function declarations.
    public var functionDeclarations: [FunctionDeclSyntax] {
        self.memberBlock.members.compactMap { member in
            member.decl.as(FunctionDeclSyntax.self)
        }
    }
}
