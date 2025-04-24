//
//  VariableDeclSyntax+AccessLevel.swift
//
//  Copyright © 2025 Fetch.
//

public import SwiftSyntax

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
    ) throws -> VariableDeclSyntax {
        try self.with(\.modifiers) { modifiers in
            if accessLevel != .internal {
                accessLevel.modifier
            }

            for modifier in modifiers where !modifier.isAccessLevel {
                modifier
            }
        }
    }
}
