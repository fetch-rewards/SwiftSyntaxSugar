//
//  ActorDeclSyntax+AccessLevel.swift
//
//  Created by Gray Campbell.
//  Copyright © 2024 Fetch.
//

public import SwiftSyntax

extension ActorDeclSyntax {

    /// The actor declaration's access level.
    public var accessLevel: AccessLevelSyntax {
        self.modifiers.accessLevel
    }
}
