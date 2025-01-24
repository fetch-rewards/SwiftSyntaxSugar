//
//  DeclModifierListSyntax+AccessLevel.swift
//
//  Created by Gray Campbell.
//  Copyright © 2025 Fetch.
//

public import SwiftSyntax

extension DeclModifierListSyntax {

    /// The first access level modifier found in the modifier list, or
    /// `.internal` if none exists.
    public var accessLevel: AccessLevelSyntax {
        guard
            let accessLevelModifier = self.first(where: \.isAccessLevel),
            let accessLevel = AccessLevelSyntax(modifier: accessLevelModifier)
        else {
            return .internal
        }

        return accessLevel
    }
}
