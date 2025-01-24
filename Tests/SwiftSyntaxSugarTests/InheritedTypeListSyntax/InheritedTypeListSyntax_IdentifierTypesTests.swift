//
//  InheritedTypeListSyntax_IdentifierTypesTests.swift
//
//  Created by Gray Campbell.
//  Copyright © 2025 Fetch.
//

import SwiftSyntax
import Testing
@testable import SwiftSyntaxSugar

struct InheritedTypeListSyntax_IdentifierTypesTests {

    // MARK: Typealiases

    typealias SUT = InheritedTypeListSyntax

    // MARK: Identifier Types Tests

    @Test
    func identifierTypes() {
        let sut = SUT {
            InheritedTypeSyntax(
                type: IdentifierTypeSyntax(name: "Hashable")
            )
            InheritedTypeSyntax(
                type: IdentifierTypeSyntax(name: "Identifiable")
            )
        }

        let identifierTypes = sut.identifierTypes
        let identifierTypeTokenKinds = identifierTypes.map(\.name.tokenKind)
        let expectedIdentifierTypeTokenKinds: [TokenKind] = [
            .identifier("Hashable"),
            .identifier("Identifiable"),
        ]

        #expect(identifierTypeTokenKinds == expectedIdentifierTypeTokenKinds)
    }
}
