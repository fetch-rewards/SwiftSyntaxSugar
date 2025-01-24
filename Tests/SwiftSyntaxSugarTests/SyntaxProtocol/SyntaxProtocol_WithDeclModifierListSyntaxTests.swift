//
//  SyntaxProtocol_WithDeclModifierListSyntaxTests.swift
//
//  Created by Gray Campbell.
//  Copyright © 2025 Fetch.
//

import SwiftSyntax
import Testing
@testable import SwiftSyntaxSugar

struct SyntaxProtocol_WithDeclModifierListSyntaxTests {

    // MARK: With Optional DeclModifierListSyntax Tests

    @Test
    func withOptionalDeclModifierListSyntax() throws {
        let sut = try FunctionDeclSyntax(
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {}
            )
        )
        .with(\.modifiers) {
            DeclModifierSyntax(name: .keyword(.private))
            DeclModifierSyntax(name: .keyword(.static))
        }

        let modifier1 = try #require(sut.modifiers.first)
        let modifier2 = try #require(sut.modifiers.last)

        #expect(sut.modifiers.count == 2)
        #expect(modifier1.name.tokenKind == .keyword(.private))
        #expect(modifier2.name.tokenKind == .keyword(.static))
    }

    @Test
    func withOptionalDeclModifierListSyntaxWithClosureParameter() throws {
        let sut = try FunctionDeclSyntax(
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {}
            )
        )
        .with(\.modifiers) { _ in
            DeclModifierSyntax(name: .keyword(.private))
            DeclModifierSyntax(name: .keyword(.static))
        }

        let modifier1 = try #require(sut.modifiers.first)
        let modifier2 = try #require(sut.modifiers.last)

        #expect(sut.modifiers.count == 2)
        #expect(modifier1.name.tokenKind == .keyword(.private))
        #expect(modifier2.name.tokenKind == .keyword(.static))
    }
}
