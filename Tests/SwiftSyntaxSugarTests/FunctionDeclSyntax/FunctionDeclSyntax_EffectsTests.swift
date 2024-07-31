//
//  FunctionDeclSyntax_EffectsTests.swift
//  SwiftSyntaxSugarTests
//
//  Created by Gray Campbell on 11/4/23.
//

import SwiftSyntax
import XCTest
@testable import SwiftSyntaxSugar

final class FunctionDeclSyntax_EffectsTests: XCTestCase {

    // MARK: Typealiases

    typealias SUT = FunctionDeclSyntax

    // MARK: Is Async Tests

    func testIsAsyncWithNilAsyncSpecifier() {
        let sut = SUT(
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {},
                effectSpecifiers: FunctionEffectSpecifiersSyntax()
            )
        )

        XCTAssertFalse(sut.isAsync)
    }

    func testIsAsyncWithNonNilAsyncSpecifier() {
        let sut = SUT(
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {},
                effectSpecifiers: FunctionEffectSpecifiersSyntax(
                    asyncSpecifier: .keyword(.async)
                )
            )
        )

        XCTAssertTrue(sut.isAsync)
    }

    func testIsAsyncWithNilEffectSpecifiers() {
        let sut = SUT(
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {}
            )
        )

        XCTAssertFalse(sut.isAsync)
    }

    // MARK: Is Throwing Tests

    func testIsThrowingWithNilThrowsSpecifier() {
        let sut = SUT(
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {},
                effectSpecifiers: FunctionEffectSpecifiersSyntax()
            )
        )

        XCTAssertFalse(sut.isThrowing)
    }

    func testIsThrowingWithNonNilThrowsSpecifier() {
        let sut = SUT(
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {},
                effectSpecifiers: FunctionEffectSpecifiersSyntax(
                    throwsSpecifier: .keyword(.throws)
                )
            )
        )

        XCTAssertTrue(sut.isThrowing)
    }

    func testIsThrowingWithNilEffectSpecifiers() {
        let sut = SUT(
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {}
            )
        )

        XCTAssertFalse(sut.isThrowing)
    }

    // MARK: Invocation Keyword Tokens Tests

    func testInvocationKeywordTokensWithNonNilAsyncSpecifier() throws {
        let sut = SUT(
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {},
                effectSpecifiers: FunctionEffectSpecifiersSyntax(
                    asyncSpecifier: .keyword(.async)
                )
            )
        )

        let invocationKeywordTokens = try XCTUnwrap(sut.invocationKeywordTokens)
        let awaitKeywordToken = try XCTUnwrap(invocationKeywordTokens.first)

        XCTAssertEqual(invocationKeywordTokens.count, 1)
        XCTAssertEqual(awaitKeywordToken.text, "await")
    }

    func testInvocationKeywordTokensWithNonNilThrowsSpecifier() throws {
        let sut = SUT(
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {},
                effectSpecifiers: FunctionEffectSpecifiersSyntax(
                    throwsSpecifier: .keyword(.throws)
                )
            )
        )

        let invocationKeywordTokens = try XCTUnwrap(sut.invocationKeywordTokens)
        let tryKeywordToken = try XCTUnwrap(invocationKeywordTokens.first)

        XCTAssertEqual(invocationKeywordTokens.count, 1)
        XCTAssertEqual(tryKeywordToken.text, "try")
    }

    func testInvocationKeywordTokensWithNilAsyncAndThrowsSpecifiers() {
        let sut = SUT(
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {},
                effectSpecifiers: FunctionEffectSpecifiersSyntax()
            )
        )

        XCTAssertNil(sut.invocationKeywordTokens)
    }

    func testInvocationKeywordTokensWithNonNilAsyncAndThrowsSpecifiers() throws {
        let sut = SUT(
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {},
                effectSpecifiers: FunctionEffectSpecifiersSyntax(
                    asyncSpecifier: .keyword(.async),
                    throwsSpecifier: .keyword(.throws)
                )
            )
        )

        let invocationKeywordTokens = try XCTUnwrap(sut.invocationKeywordTokens)
        let tryKeywordToken = try XCTUnwrap(invocationKeywordTokens.first)
        let awaitKeywordToken = try XCTUnwrap(invocationKeywordTokens.last)

        XCTAssertEqual(invocationKeywordTokens.count, 2)
        XCTAssertEqual(tryKeywordToken.text, "try")
        XCTAssertEqual(awaitKeywordToken.text, "await")
    }

    func testInvocationKeywordTokensWithNilEffectSpecifiers() {
        let sut = SUT(
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {}
            )
        )

        XCTAssertNil(sut.invocationKeywordTokens)
    }
}
