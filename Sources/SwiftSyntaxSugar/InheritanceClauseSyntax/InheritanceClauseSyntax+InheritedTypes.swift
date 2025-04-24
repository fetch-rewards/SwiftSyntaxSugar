//
//  InheritanceClauseSyntax+InheritedTypes.swift
//
//  Copyright © 2025 Fetch.
//

public import SwiftSyntax

extension InheritanceClauseSyntax {

    /// Returns the inherited types of the provided `type` that are contained in
    /// the inheritance clause.
    ///
    /// - Parameter type: The type of inherited type to return.
    /// - Returns: The inherited types of the provided `type` that are contained
    ///   in the inheritance clause.
    public func inheritedTypes<Syntax: TypeSyntaxProtocol>(
        ofType type: Syntax.Type
    ) -> [Syntax] {
        self.inheritedTypes.compactMap { inheritedType in
            inheritedType.type.as(type)
        }
    }
}
