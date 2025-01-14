//
//  SyntaxProtocol_WithAttributeListSyntaxTests.swift
//  SwiftSyntaxSugar
//
//  Created by Gray Campbell on 1/14/25.
//

import SwiftSyntax
import Testing
@testable import SwiftSyntaxSugar

struct SyntaxProtocol_WithAttributeListSyntaxTests {

    // MARK: With Optional AttributeListSyntax Tests

    @Test
    func withOptionalAttributeListSyntax() throws {
        let sut = try FunctionDeclSyntax(
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {}
            )
        )
        .with(\.attributes) {
            AttributeSyntax(
                atSign: .atSignToken(),
                attributeName: IdentifierTypeSyntax(
                    name: .identifier("MainActor")
                )
            )
        }

        let attribute = try #require(sut.attributes.first)

        guard case let .attribute(attribute) = attribute else {
            Issue.record("Expected .attribute")
            return
        }

        let attributeName = try #require(
            attribute.attributeName.as(IdentifierTypeSyntax.self)
        )

        #expect(sut.attributes.count == 1)
        #expect(attribute.atSign.tokenKind == .atSign)
        #expect(attributeName.name.tokenKind == .identifier("MainActor"))
    }

    @Test
    func withOptionalAttributeListSyntaxWithClosureParameter() throws {
        let sut = try FunctionDeclSyntax(
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {}
            )
        )
        .with(\.attributes) { _ in
            AttributeSyntax(
                atSign: .atSignToken(),
                attributeName: IdentifierTypeSyntax(
                    name: .identifier("MainActor")
                )
            )
        }

        let attribute = try #require(sut.attributes.first)

        guard case let .attribute(attribute) = attribute else {
            Issue.record("Expected .attribute")
            return
        }

        let attributeName = try #require(
            attribute.attributeName.as(IdentifierTypeSyntax.self)
        )

        #expect(sut.attributes.count == 1)
        #expect(attribute.atSign.tokenKind == .atSign)
        #expect(attributeName.name.tokenKind == .identifier("MainActor"))
    }
}
