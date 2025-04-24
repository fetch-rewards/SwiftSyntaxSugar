//
//  InheritanceClauseSyntax_InheritedTypesTests.swift
//
//  Copyright © 2025 Fetch.
//

import SwiftSyntax
import Testing
@testable import SwiftSyntaxSugar

struct InheritanceClauseSyntax_InheritedTypesTests {

    // MARK: Typealiases

    typealias SUT = InheritanceClauseSyntax

    // MARK: Identifier Types Tests

    @Test
    func identifierTypes() {
        let sut = SUT {
            InheritedTypeSyntax(
                type: IdentifierTypeSyntax(name: "Hashable")
            )
            InheritedTypeSyntax(
                type: ArrayTypeSyntax(
                    element: IdentifierTypeSyntax(name: "String")
                )
            )
            InheritedTypeSyntax(
                type: IdentifierTypeSyntax(name: "Identifiable")
            )
        }

        let identifierTypes = sut.inheritedTypes(ofType: IdentifierTypeSyntax.self)
        let identifierTypeTokenKinds = identifierTypes.map(\.name.tokenKind)
        let expectedIdentifierTypeTokenKinds: [TokenKind] = [
            .identifier("Hashable"),
            .identifier("Identifiable"),
        ]

        #expect(identifierTypeTokenKinds == expectedIdentifierTypeTokenKinds)
    }
}
