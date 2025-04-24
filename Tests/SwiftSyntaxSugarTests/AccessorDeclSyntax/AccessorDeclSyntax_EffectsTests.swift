//
//  AccessorDeclSyntax_EffectsTests.swift
//
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
}
