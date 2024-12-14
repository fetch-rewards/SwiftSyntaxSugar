//
//  FunctionDeclSyntax_EffectsTests.swift
//  SwiftSyntaxSugarTests
//
//  Created by Gray Campbell on 11/4/23.
//

import SwiftSyntax
import Testing
@testable import SwiftSyntaxSugar

struct FunctionDeclSyntax_EffectsTests {

    // MARK: Typealiases

    typealias SUT = FunctionDeclSyntax

    // MARK: Is Async Tests

    @Test
    func isAsyncWithNilAsyncSpecifier() {
        let sut = SUT(
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {},
                effectSpecifiers: FunctionEffectSpecifiersSyntax()
            )
        )

        #expect(!sut.isAsync)
    }

    @Test
    func isAsyncWithNonNilAsyncSpecifier() {
        let sut = SUT(
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {},
                effectSpecifiers: FunctionEffectSpecifiersSyntax(
                    asyncSpecifier: .keyword(.async)
                )
            )
        )

        #expect(sut.isAsync)
    }

    @Test
    func isAsyncWithNilEffectSpecifiers() {
        let sut = SUT(
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {}
            )
        )

        #expect(!sut.isAsync)
    }

    // MARK: Is Throwing Tests

    @Test
    func isThrowingWithNilThrowsSpecifier() {
        let sut = SUT(
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {},
                effectSpecifiers: FunctionEffectSpecifiersSyntax()
            )
        )

        #expect(!sut.isThrowing)
    }

    @Test
    func isThrowingWithNonNilThrowsSpecifier() {
        let sut = SUT(
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {},
                effectSpecifiers: FunctionEffectSpecifiersSyntax(
                    throwsClause: ThrowsClauseSyntax(
                        throwsSpecifier: .keyword(.throws)
                    )
                )
            )
        )

        #expect(sut.isThrowing)
    }

    @Test
    func isThrowingWithNilEffectSpecifiers() {
        let sut = SUT(
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {}
            )
        )

        #expect(!sut.isThrowing)
    }

    // MARK: Invocation Keyword Tokens Tests

    @Test
    func invocationKeywordTokensWithNonNilAsyncSpecifier() throws {
        let sut = SUT(
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {},
                effectSpecifiers: FunctionEffectSpecifiersSyntax(
                    asyncSpecifier: .keyword(.async)
                )
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
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {},
                effectSpecifiers: FunctionEffectSpecifiersSyntax(
                    throwsClause: ThrowsClauseSyntax(
                        throwsSpecifier: .keyword(.throws)
                    )
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
        let sut = SUT(
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {},
                effectSpecifiers: FunctionEffectSpecifiersSyntax()
            )
        )

        #expect(sut.invocationKeywordTokens.isEmpty)
    }

    @Test
    func invocationKeywordTokensWithNonNilAsyncAndThrowsSpecifiers() throws {
        let sut = SUT(
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {},
                effectSpecifiers: FunctionEffectSpecifiersSyntax(
                    asyncSpecifier: .keyword(.async),
                    throwsClause: ThrowsClauseSyntax(
                        throwsSpecifier: .keyword(.throws)
                    )
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

    @Test
    func invocationKeywordTokensWithNilEffectSpecifiers() {
        let sut = SUT(
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {}
            )
        )

        #expect(sut.invocationKeywordTokens.isEmpty)
    }
}
