//
//  ClassDeclSyntax+AccessLevel.swift
//
//  Created by Gray Campbell.
//  Copyright © 2025 Fetch.
//

public import SwiftSyntax

extension ClassDeclSyntax {

    /// The class declaration's access level.
    public var accessLevel: AccessLevelSyntax {
        self.modifiers.accessLevel
    }
}
