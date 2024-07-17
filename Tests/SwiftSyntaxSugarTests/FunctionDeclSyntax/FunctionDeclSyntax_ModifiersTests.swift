//
//  FunctionDeclSyntax_ModifiersTests.swift
//  SwiftSyntaxSugarTests
//
//  Created by Gray Campbell on 7/17/24.
//

import SwiftSyntax
import XCTest
@testable import SwiftSyntaxSugar

final class FunctionDeclSyntax_ModifiersTests: XCTestCase {

    // MARK: Typealiases

    typealias SUT = FunctionDeclSyntax

    // MARK: With Modifiers Tests

    func testWithModifiers() {
        let sut = SUT(
            modifiers: DeclModifierListSyntax {
                DeclModifierSyntax(name: .keyword(.public))
                DeclModifierSyntax(name: .keyword(.static))
            },
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {}
            )
        )
        .withModifiers(DeclModifierListSyntax {
            DeclModifierSyntax(name: .keyword(.private))
            DeclModifierSyntax(name: .keyword(.mutating))
        })

        XCTAssertEqual(sut.modifiers.count, 2)
        XCTAssertEqual(sut.modifiers.first?.name.tokenKind, .keyword(.private))
        XCTAssertEqual(sut.modifiers.last?.name.tokenKind, .keyword(.mutating))
    }

    func testWithModifiersBuilder() throws {
        let sut = try SUT(
            modifiers: DeclModifierListSyntax {
                DeclModifierSyntax(name: .keyword(.public))
                DeclModifierSyntax(name: .keyword(.static))
            },
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {}
            )
        )
        .withModifiers {
            DeclModifierSyntax(name: .keyword(.private))
            DeclModifierSyntax(name: .keyword(.mutating))
        }

        XCTAssertEqual(sut.modifiers.count, 2)
        XCTAssertEqual(sut.modifiers.first?.name.tokenKind, .keyword(.private))
        XCTAssertEqual(sut.modifiers.last?.name.tokenKind, .keyword(.mutating))
    }
}
