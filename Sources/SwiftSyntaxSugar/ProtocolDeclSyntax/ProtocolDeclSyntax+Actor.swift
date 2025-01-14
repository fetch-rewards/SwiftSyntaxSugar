//
//  ProtocolDeclSyntax+Actor.swift
//
//  Created by Gray Campbell.
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

        let inheritedTypes = inheritanceClause.inheritedTypes

        return inheritedTypes.identifierTypes.contains { identifierType in
            identifierType.name.trimmed.text == String(describing: (any Actor).self)
        }
    }
}
