//
//  FunctionDeclSyntax_EffectsTests.swift
//
//  Copyright © 2025 Fetch.
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
}
