//
//  VariableDeclSyntax_AccessLevelTests.swift
//
//  Copyright © 2025 Fetch.
//

import SwiftSyntax
import Testing
@testable import SwiftSyntaxSugar

struct VariableDeclSyntax_AccessLevelTests {

    // MARK: Typealiases

    typealias SUT = VariableDeclSyntax

    // MARK: Access Level Tests

    @Test(arguments: AccessLevelSyntax.allCases)
    func accessLevelWithExplicitAccessLevelModifier(
        from accessLevel: AccessLevelSyntax
    ) {
        let sut = SUT(
            modifiers: DeclModifierListSyntax { accessLevel.modifier },
            .var,
            name: "sut"
        )

        #expect(sut.accessLevel == accessLevel)
    }

    @Test
    func accessLevelWithImplicitInternalAccessLevelModifier() {
        let sut = SUT(.var, name: "sut")

        #expect(sut.accessLevel == .internal)
    }

    // MARK: With Access Level Tests

    @Test(arguments: AccessLevelSyntax.allCases, AccessLevelSyntax.allCases)
    func withAccessLevelWithExplicitAccessLevelModifier(
        oldAccessLevel: AccessLevelSyntax,
        newAccessLevel: AccessLevelSyntax
    ) throws {
        let sut = try SUT(
            modifiers: DeclModifierListSyntax {
                oldAccessLevel.modifier
                DeclModifierSyntax(name: .keyword(.static))
            },
            .var,
            name: "sut"
        )
        .withAccessLevel(newAccessLevel)

        let expectedModifierCount = newAccessLevel == .internal ? 1 : 2

        #expect(sut.accessLevel == newAccessLevel)
        #expect(sut.modifiers.count == expectedModifierCount)
    }

    @Test(arguments: AccessLevelSyntax.allCases)
    func withAccessLevelWithImplicitInternalAccessLevelModifier(
        newAccessLevel: AccessLevelSyntax
    ) throws {
        let sut = try SUT(
            modifiers: DeclModifierListSyntax {
                DeclModifierSyntax(name: .keyword(.static))
            },
            .var,
            name: "sut"
        )
        .withAccessLevel(newAccessLevel)

        let expectedModifierCount = newAccessLevel == .internal ? 1 : 2

        #expect(sut.accessLevel == newAccessLevel)
        #expect(sut.modifiers.count == expectedModifierCount)
    }
}
