//
//  SyntaxProtocol_WithDeclModifierListSyntax.swift
//  SwiftSyntaxSugarTests
//
//  Created by Gray Campbell on 7/17/24.
//

import SwiftSyntax
import XCTest
@testable import SwiftSyntaxSugar

final class SyntaxProtocol_WithDeclModifierListSyntax: XCTestCase {

    // MARK: Typealiases

    typealias SUT = FunctionDeclSyntax

    // MARK: With DeclModifierListSyntax Tests

    func testWithDeclModifierListSyntax() throws {
        let sut = try SUT(
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {}
            )
        )
        .with(\.modifiers) {
            DeclModifierSyntax(name: .keyword(.private))
            DeclModifierSyntax(name: .keyword(.static))
        }

        let modifier1 = try XCTUnwrap(sut.modifiers.first)
        let modifier2 = try XCTUnwrap(sut.modifiers.last)

        XCTAssertEqual(sut.modifiers.count, 2)
        XCTAssertEqual(modifier1.name.tokenKind, .keyword(.private))
        XCTAssertEqual(modifier2.name.tokenKind, .keyword(.static))
    }

    func testWithDeclModifierListSyntaxWithClosureParameter() throws {
        let sut = try SUT(
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {}
            )
        )
        .with(\.modifiers) { _ in
            DeclModifierSyntax(name: .keyword(.private))
            DeclModifierSyntax(name: .keyword(.static))
        }

        let modifier1 = try XCTUnwrap(sut.modifiers.first)
        let modifier2 = try XCTUnwrap(sut.modifiers.last)

        XCTAssertEqual(sut.modifiers.count, 2)
        XCTAssertEqual(modifier1.name.tokenKind, .keyword(.private))
        XCTAssertEqual(modifier2.name.tokenKind, .keyword(.static))
    }
}
