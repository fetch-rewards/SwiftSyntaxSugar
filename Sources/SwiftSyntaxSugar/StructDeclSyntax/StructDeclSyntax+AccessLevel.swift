//
//  StructDeclSyntax+AccessLevel.swift
//
//  Created by Gray Campbell.
//  Copyright © 2024 Fetch.
//

public import SwiftSyntax

extension StructDeclSyntax {

    /// The struct declaration's access level.
    public var accessLevel: AccessLevelSyntax {
        self.modifiers.accessLevel
    }
}
