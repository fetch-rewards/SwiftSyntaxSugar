//
//  ProtocolDeclSyntax+Initializers.swift
//
//  Created by Gray Campbell.
//  Copyright © 2024 Fetch.
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
