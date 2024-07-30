//
//  VariableDeclSyntax+AccessLevel.swift
//  SwiftSyntaxSugar
//
//  Created by Gray Campbell on 11/4/23.
//

import SwiftSyntax

extension VariableDeclSyntax {

    /// The variable declaration's access level.
    public var accessLevel: AccessLevelSyntax {
        self.modifiers.accessLevel
    }

    /// Returns a copy of the variable declaration with the provided access
    /// level.
    ///
    /// - Parameter accessLevel: The access level of the new variable
    ///   declaration.
    /// - Returns: A copy of the variable declaration with the provided access
    ///   level.
    public func withAccessLevel(
        _ accessLevel: AccessLevelSyntax
    ) -> VariableDeclSyntax {
        let modifiers = DeclModifierListSyntax {
            if accessLevel != .internal {
                accessLevel.modifier
            }

            for modifier in self.modifiers where !modifier.isAccessLevel {
                modifier
            }
        }

        return VariableDeclSyntax(
            leadingTrivia: self.leadingTrivia,
            attributes: self.attributes,
            modifiers: modifiers,
            bindingSpecifier: self.bindingSpecifier,
            bindings: self.bindings,
            trailingTrivia: self.trailingTrivia
        )
    }
}
