//
//  InitializerDeclSyntax+AccessLevel.swift
//
//  Created by Gray Campbell.
//  Copyright © 2024 Fetch.
//

public import SwiftSyntax

extension InitializerDeclSyntax {

    /// The initializer declaration's access level.
    public var accessLevel: AccessLevelSyntax {
        self.modifiers.accessLevel
    }

    /// Returns a copy of the initializer declaration with the provided access
    /// level.
    ///
    /// - Parameter accessLevel: The access level of the new initializer
    ///   declaration.
    /// - Returns: A copy of the initializer declaration with the provided
    ///   access level.
    public func withAccessLevel(
        _ accessLevel: AccessLevelSyntax
    ) throws -> InitializerDeclSyntax {
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
