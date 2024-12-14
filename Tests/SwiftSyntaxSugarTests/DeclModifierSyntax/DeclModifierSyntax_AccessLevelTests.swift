//
//  DeclModifierSyntax_AccessLevelTests.swift
//
//  Created by Gray Campbell.
//  Copyright © 2024 Fetch.
//

import SwiftSyntax
import Testing
@testable import SwiftSyntaxSugar

struct DeclModifierSyntax_AccessLevelTests {

    // MARK: Typealiases

    typealias SUT = DeclModifierSyntax

    // MARK: Is Access Level Tests

    @Test(arguments: AccessLevelSyntax.allCases)
    func isAccessLevelWithAccessLevelModifier(
        from accessLevel: AccessLevelSyntax
    ) {
        let sut = SUT(name: accessLevel.token)

        #expect(sut.isAccessLevel)
    }

    @Test(arguments: [Keyword.class, Keyword.lazy, Keyword.static])
    func isAccessLevelWithNonAccessLevelModifier(keyword: Keyword) {
        let sut = SUT(name: .keyword(keyword))

        #expect(!sut.isAccessLevel)
    }
}
