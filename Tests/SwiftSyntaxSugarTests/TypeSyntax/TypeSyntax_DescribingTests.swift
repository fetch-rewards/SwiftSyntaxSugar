//
//  TypeSyntax_DescribingTests.swift
//
//  Created by Gray Campbell.
//  Copyright © 2024 Fetch.
//

import SwiftSyntax
import Testing
@testable import SwiftSyntaxSugar

struct TypeSyntax_DescribingTests {

    // MARK: Typealiases

    typealias SUT = TypeSyntax

    // MARK: Initializer Tests

    @Test
    func initDescribingSubject() throws {
        let sut = SUT(describing: Int.self)

        let identifierType = try #require(sut.as(IdentifierTypeSyntax.self))
        let identifierTypeTokenKind = identifierType.name.tokenKind

        #expect(identifierTypeTokenKind == .identifier("Int"))
    }

    // MARK: Static Property Tests

    @Test(
        arguments: [
            (SUT.bool, "Bool"),
            (SUT.int, "Int"),
            (SUT.string, "String"),
            (SUT.void, "Void"),
        ]
    )
    func staticProperty(sut: SUT, expectedIdentifier: String) throws {
        let identifierType = try #require(sut.as(IdentifierTypeSyntax.self))
        let identifierTypeTokenKind = identifierType.name.tokenKind

        #expect(identifierTypeTokenKind == .identifier(expectedIdentifier))
    }
}
