//
//  DeclModifierListSyntax_AccessLevelTests.swift
//  SwiftSyntaxSugarTests
//
//  Created by Gray Campbell on 11/4/23.
//

import SwiftSyntax
import Testing
@testable import SwiftSyntaxSugar

struct DeclModifierListSyntax_AccessLevelTests {

    // MARK: Typealiases

    typealias SUT = DeclModifierListSyntax

    // MARK: Access Level Tests

    @Test(arguments: AccessLevelSyntax.allCases)
    func accessLevelWithExplicitAccessLevelModifier(
        from accessLevel: AccessLevelSyntax
    ) {
        let sut = SUT {
            accessLevel.modifier
            DeclModifierSyntax(name: .keyword(.static))
        }

        #expect(sut.accessLevel == accessLevel)
    }

    @Test
    func accessLevelWithImplicitInternalAccessLevelModifier() {
        let sut = SUT {
            DeclModifierSyntax(name: .keyword(.static))
        }

        #expect(sut.accessLevel == .internal)
    }
}
