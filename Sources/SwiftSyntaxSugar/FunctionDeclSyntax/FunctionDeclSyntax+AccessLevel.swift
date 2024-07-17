//
//  FunctionDeclSyntax+AccessLevel.swift
//  SwiftSyntaxSugar
//
//  Created by Gray Campbell on 11/4/23.
//

import SwiftSyntax

extension FunctionDeclSyntax {

    /// The function declaration's access level.
    public var accessLevel: AccessLevelSyntax {
        self.modifiers.accessLevel
    }

    /// Returns a copy of the function declaration with the provided access
    /// level.
    ///
    /// - Parameter accessLevel: The access level of the new function
    ///   declaration.
    /// - Returns: A copy of the function declaration with the provided access
    ///   level.
    public func withAccessLevel(
        _ accessLevel: AccessLevelSyntax
    ) throws -> FunctionDeclSyntax {
        try self.with(\.modifiers) {
            if accessLevel != .internal {
                accessLevel.modifier
            }

            for modifier in self.modifiers where !modifier.isAccessLevel {
                modifier
            }
        }
    }
}
