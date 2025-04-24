//
//  ProtocolDeclSyntax_GenericWhereClausesTests.swift
//
//  Copyright © 2025 Fetch.
//

import SwiftSyntax
import Testing
@testable import SwiftSyntaxSugar

struct ProtocolDeclSyntax_GenericWhereClausesTests {

    // MARK: Typealiases

    typealias SUT = ProtocolDeclSyntax

    // MARK: Generic Where Clauses Tests

    @Test
    func genericWhereClauses() throws {
        let sut = SUT(
            name: "SUT",
            genericWhereClause: GenericWhereClauseSyntax {}
        ) {
            AssociatedTypeDeclSyntax(
                name: "A",
                genericWhereClause: GenericWhereClauseSyntax {}
            )
            AssociatedTypeDeclSyntax(name: "B")
            AssociatedTypeDeclSyntax(
                name: "C",
                genericWhereClause: GenericWhereClauseSyntax {}
            )
        }

        #expect(sut.genericWhereClauses.count == 3)
    }
}
