//
//  ProtocolDeclSyntax+Actor.swift
//
//  Copyright © 2025 Fetch.
//

public import SwiftSyntax

extension ProtocolDeclSyntax {

    /// A boolean indicating if the protocol requires conforming types to be
    /// actors.
    public var isActorConstrained: Bool {
        guard let inheritanceClause = self.inheritanceClause else {
            return false
        }

        let identifierTypes = inheritanceClause.inheritedTypes(
            ofType: IdentifierTypeSyntax.self
        )

        return identifierTypes.contains { type in
            type.name.tokenKind == .identifier(String(describing: (any Actor).self))
        }
    }
}
