//
//  AccessorDeclSyntax_EffectsTests.swift
//  SwiftSyntaxSugarTests
//
//  Created by Gray Campbell on 11/3/23.
//

import SwiftSyntax
import XCTest

@testable import SwiftSyntaxSugar

final class AccessorDeclSyntax_EffectsTests: XCTestCase {

    // MARK: Typealiases

    typealias SUT = AccessorDeclSyntax

    // MARK: Is Async Tests

    func testIsAsyncForNilAsyncSpecifier() {
        let sut = SUT(accessorSpecifier: .keyword(.get))

        XCTAssertFalse(sut.isAsync)
    }

    func testIsAsyncForNonNilAsyncSpecifier() {
        let sut = SUT(
            accessorSpecifier: .keyword(.get),
            effectSpecifiers: AccessorEffectSpecifiersSyntax(
                asyncSpecifier: .keyword(.async)
            )
        )

        XCTAssertTrue(sut.isAsync)
    }

    // MARK: Is Throwing Tests

    func testIsThrowingForNilThrowsSpecifier() {
        let sut = SUT(accessorSpecifier: .keyword(.get))

        XCTAssertFalse(sut.isThrowing)
    }

    func testIsThrowingForNonNilThrowsSpecifier() {
        let sut = SUT(
            accessorSpecifier: .keyword(.get),
            effectSpecifiers: AccessorEffectSpecifiersSyntax(
                throwsSpecifier: .keyword(.throws)
            )
        )

        XCTAssertTrue(sut.isThrowing)
    }

    // MARK: Invocation Keyword Tokens Tests

    func testInvocationKeywordTokensForNonNilAsyncSpecifier() throws {
        let sut = SUT(
            accessorSpecifier: .keyword(.get),
            effectSpecifiers: AccessorEffectSpecifiersSyntax(
                asyncSpecifier: .keyword(.async)
            )
        )

        let invocationKeywordTokens = try XCTUnwrap(sut.invocationKeywordTokens)
        let awaitKeywordToken = try XCTUnwrap(invocationKeywordTokens.first)

        XCTAssertEqual(invocationKeywordTokens.count, 1)
        XCTAssertEqual(awaitKeywordToken.text, "await")
    }

    func testInvocationKeywordTokensForNonNilThrowsSpecifier() throws {
        let sut = SUT(
            accessorSpecifier: .keyword(.get),
            effectSpecifiers: AccessorEffectSpecifiersSyntax(
                throwsSpecifier: .keyword(.throws)
            )
        )

        let invocationKeywordTokens = try XCTUnwrap(sut.invocationKeywordTokens)
        let tryKeywordToken = try XCTUnwrap(invocationKeywordTokens.first)

        XCTAssertEqual(invocationKeywordTokens.count, 1)
        XCTAssertEqual(tryKeywordToken.text, "try")
    }

    func testInvocationKeywordTokensForNonNilAsyncAndThrowsSpecifiers() throws {
        let sut = SUT(
            accessorSpecifier: .keyword(.get),
            effectSpecifiers: AccessorEffectSpecifiersSyntax(
                asyncSpecifier: .keyword(.async),
                throwsSpecifier: .keyword(.throws)
            )
        )

        let invocationKeywordTokens = try XCTUnwrap(sut.invocationKeywordTokens)
        let tryKeywordToken = try XCTUnwrap(invocationKeywordTokens.first)
        let awaitKeywordToken = try XCTUnwrap(invocationKeywordTokens.last)

        XCTAssertEqual(invocationKeywordTokens.count, 2)
        XCTAssertEqual(tryKeywordToken.text, "try")
        XCTAssertEqual(awaitKeywordToken.text, "await")
    }

    func testInvocationKeywordTokensForNilAsyncAndThrowsSpecifiers() {
        let sut = SUT(accessorSpecifier: .keyword(.get))

        XCTAssertNil(sut.invocationKeywordTokens)
    }
}
