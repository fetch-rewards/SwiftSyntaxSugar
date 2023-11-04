//
//  ProtocolDeclSyntax+Actor.swift
//  SwiftSyntaxSugar
//
//  Created by Gray Campbell on 11/4/23.
//

import SwiftSyntax

extension ProtocolDeclSyntax {

    /// A boolean indicating if the protocol requires conforming types to be
    /// actors.
    public var isActorConstrained: Bool {
        guard let inheritanceClause = self.inheritanceClause else {
            return false
        }

        let inheritedTypes = inheritanceClause.inheritedTypes

        return inheritedTypes.identifierTypes.contains { identifierType in
            identifierType.name.text == "Actor"
        }
    }
}
