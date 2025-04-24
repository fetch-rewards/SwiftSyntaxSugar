//
//  StructDeclSyntax+AccessLevel.swift
//
//  Copyright © 2025 Fetch.
//

public import SwiftSyntax

extension StructDeclSyntax {

    /// The struct declaration's access level.
    public var accessLevel: AccessLevelSyntax {
        self.modifiers.accessLevel
    }
}
