//
//  DeclModifierListSyntax+AccessLevel.swift
//  SwiftSyntaxSugar
//
//  Created by Gray Campbell on 11/4/23.
//

import SwiftSyntax

extension DeclModifierListSyntax {

    /// The first access level modifier found in the modifier list, or
    /// `.internal` if none exists.
    public var accessLevel: AccessLevelSyntax {
        guard
            let accessLevelModifier = self.first(where: \.isAccessLevel),
            let accessLevel = AccessLevelSyntax(rawValue: accessLevelModifier.name.text)
        else {
            return .internal
        }

        return accessLevel
    }
}
