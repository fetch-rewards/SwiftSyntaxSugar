//
//  FunctionDeclSyntax+AccessLevel.swift
//
//  Created by Gray Campbell.
//  Copyright © 2024 Fetch.
//

public import SwiftSyntax

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
