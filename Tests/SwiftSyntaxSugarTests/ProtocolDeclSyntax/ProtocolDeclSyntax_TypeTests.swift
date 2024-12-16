//
//  ProtocolDeclSyntax_TypeTests.swift
//  SwiftSyntaxSugarTests
//
//  Created by Gray Campbell on 11/8/23.
//

import SwiftSyntax
import Testing
@testable import SwiftSyntaxSugar

struct ProtocolDeclSyntax_TypeTests {

    // MARK: Typealiases

    typealias SUT = ProtocolDeclSyntax

    // MARK: Type Tests

    @Test
    func type() throws {
        let sut = SUT(name: "SUT") {}

        let type = sut.type
        let identifierType = try #require(type.as(IdentifierTypeSyntax.self))
        let identifierTypeTokenKind = identifierType.name.tokenKind
        let expectedIdentifierTypeTokenKind: TokenKind = .identifier("SUT")

        #expect(identifierTypeTokenKind == expectedIdentifierTypeTokenKind)
    }
}
