//
//  SyntaxProtocol_WithCodeBlockSyntaxTests.swift
//
//  Created by Gray Campbell.
//  Copyright © 2025 Fetch.
//

import SwiftSyntax
import Testing
@testable import SwiftSyntaxSugar

struct SyntaxProtocol_WithCodeBlockSyntaxTests {

    // MARK: With Optional CodeBlockSyntax Tests

    @Test
    func withOptionalCodeBlockSyntax() throws {
        let sut = try FunctionDeclSyntax(
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {}
            )
        )
        .with(\.body) {}

        #expect(sut.body != nil)
    }

    @Test
    func withOptionalCodeBlockSyntaxWithClosureParameter() throws {
        let sut = try FunctionDeclSyntax(
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {}
            )
        )
        .with(\.body) { _ in }

        #expect(sut.body != nil)
    }
}
