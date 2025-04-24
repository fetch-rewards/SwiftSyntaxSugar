//
//  DeclModifierSyntax+AccessLevel.swift
//
//  Copyright © 2025 Fetch.
//

public import SwiftSyntax

extension DeclModifierSyntax {

    /// A boolean indicating if the modifier is an access level modifier.
    public var isAccessLevel: Bool {
        AccessLevelSyntax.allCases.contains { accessLevel in
            self.name.tokenKind == accessLevel.tokenKind
        }
    }
}
