//
//  AccessorDeclSyntax_EffectsTests.swift
//
//  Created by Gray Campbell.
//  Copyright © 2025 Fetch.
//

import SwiftSyntax
import Testing
@testable import SwiftSyntaxSugar

struct AccessorDeclSyntax_EffectsTests {

    // MARK: Typealiases

    typealias SUT = AccessorDeclSyntax

    // MARK: Is Async Tests

    @Test
    func isAsyncWithNilAsyncSpecifier() {
        let sut = SUT(accessorSpecifier: .keyword(.get))

        #expect(!sut.isAsync)
    }

    @Test
    func isAsyncWithNonNilAsyncSpecifier() {
        let sut = SUT(
            accessorSpecifier: .keyword(.get),
            effectSpecifiers: AccessorEffectSpecifiersSyntax(
                asyncSpecifier: .keyword(.async)
            )
        )

        #expect(sut.isAsync)
    }

    // MARK: Is Throwing Tests

    @Test
    func isThrowingWithNilThrowsSpecifier() {
        let sut = SUT(accessorSpecifier: .keyword(.get))

        #expect(!sut.isThrowing)
    }

    @Test
    func isThrowingWithNonNilThrowsSpecifier() {
        let sut = SUT(
            accessorSpecifier: .keyword(.get),
            effectSpecifiers: AccessorEffectSpecifiersSyntax(
                throwsClause: ThrowsClauseSyntax(
                    throwsSpecifier: .keyword(.throws)
                )
            )
        )

        #expect(sut.isThrowing)
    }

    // MARK: Invocation Keyword Tokens Tests

    @Test
    func invocationKeywordTokensWithNonNilAsyncSpecifier() throws {
        let sut = SUT(
            accessorSpecifier: .keyword(.get),
            effectSpecifiers: AccessorEffectSpecifiersSyntax(
                asyncSpecifier: .keyword(.async)
            )
        )

        let invocationKeywordTokens = try #require(sut.invocationKeywordTokens)
        let awaitKeywordToken = try #require(invocationKeywordTokens.first)

        #expect(invocationKeywordTokens.count == 1)
        #expect(awaitKeywordToken.tokenKind == .keyword(.await))
    }

    @Test
    func invocationKeywordTokensWithNonNilThrowsSpecifier() throws {
        let sut = SUT(
            accessorSpecifier: .keyword(.get),
            effectSpecifiers: AccessorEffectSpecifiersSyntax(
                throwsClause: ThrowsClauseSyntax(
                    throwsSpecifier: .keyword(.throws)
                )
            )
        )

        let invocationKeywordTokens = try #require(sut.invocationKeywordTokens)
        let tryKeywordToken = try #require(invocationKeywordTokens.first)

        #expect(invocationKeywordTokens.count == 1)
        #expect(tryKeywordToken.tokenKind == .keyword(.try))
    }

    @Test
    func invocationKeywordTokensWithNilAsyncAndThrowsSpecifiers() {
        let sut = SUT(accessorSpecifier: .keyword(.get))

        #expect(sut.invocationKeywordTokens.isEmpty)
    }

    @Test
    func invocationKeywordTokensWithNonNilAsyncAndThrowsSpecifiers() throws {
        let sut = SUT(
            accessorSpecifier: .keyword(.get),
            effectSpecifiers: AccessorEffectSpecifiersSyntax(
                asyncSpecifier: .keyword(.async),
                throwsClause: ThrowsClauseSyntax(
                    throwsSpecifier: .keyword(.throws)
                )
            )
        )

        let invocationKeywordTokens = try #require(sut.invocationKeywordTokens)
        let tryKeywordToken = try #require(invocationKeywordTokens.first)
        let awaitKeywordToken = try #require(invocationKeywordTokens.last)

        #expect(invocationKeywordTokens.count == 2)
        #expect(tryKeywordToken.tokenKind == .keyword(.try))
        #expect(awaitKeywordToken.tokenKind == .keyword(.await))
    }
}
