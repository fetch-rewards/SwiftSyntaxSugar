//
//  ProtocolDeclSyntax+GenericWhereClauses.swift
//  SwiftSyntaxSugar
//
//  Created by Gray Campbell on 11/4/23.
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

        for associatedTypeDeclaration in self.associatedTypeDeclarations {
            guard
                let genericWhereClause = associatedTypeDeclaration.genericWhereClause
            else {
                continue
            }

            genericWhereClauses.append(genericWhereClause)
        }

        return genericWhereClauses
    }
}
