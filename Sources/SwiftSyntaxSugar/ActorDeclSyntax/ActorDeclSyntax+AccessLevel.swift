//
//  ActorDeclSyntax+AccessLevel.swift
//
//  Copyright © 2025 Fetch.
//

public import SwiftSyntax

extension ActorDeclSyntax {

    /// The actor declaration's access level.
    public var accessLevel: AccessLevelSyntax {
        self.modifiers.accessLevel
    }
}
