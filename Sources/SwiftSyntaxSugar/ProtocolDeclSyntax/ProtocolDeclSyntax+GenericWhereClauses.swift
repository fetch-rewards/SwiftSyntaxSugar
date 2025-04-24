//
//  ProtocolDeclSyntax+GenericWhereClauses.swift
//
//  Copyright © 2025 Fetch.
//

public import SwiftSyntax

extension ProtocolDeclSyntax {

    /// The protocol's generic where clauses (the clause from the protocol
    /// declaration and the clauses from the associated type declarations).
    public var genericWhereClauses: [GenericWhereClauseSyntax] {
        var genericWhereClauses: [GenericWhereClauseSyntax] = []

        if let genericWhereClause = self.genericWhereClause {
            genericWhereClauses.append(genericWhereClause)
        }

        for member in self.memberBlock.members {
            guard
                let associatedTypeDeclaration = member.decl.as(
                    AssociatedTypeDeclSyntax.self
                ),
                let genericWhereClause = associatedTypeDeclaration.genericWhereClause
            else {
                continue
            }

            genericWhereClauses.append(genericWhereClause)
        }

        return genericWhereClauses
    }
}
