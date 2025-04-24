//
//  ActorDeclSyntax_AccessLevelTests.swift
//
//  Copyright © 2025 Fetch.
//

import SwiftSyntax
import Testing
@testable import SwiftSyntaxSugar

struct ActorDeclSyntax_AccessLevelTests {

    // MARK: Typealiases

    typealias SUT = ActorDeclSyntax

    // MARK: Access Level Tests

    @Test(arguments: AccessLevelSyntax.allCases)
    func accessLevelWithExplicitAccessLevelModifier(
        from accessLevel: AccessLevelSyntax
    ) {
        let modifiers = DeclModifierListSyntax {
            accessLevel.modifier
            DeclModifierSyntax(name: .keyword(.final))
        }
        let sut = SUT(modifiers: modifiers, name: "SUT") {}

        #expect(sut.accessLevel == accessLevel)
    }

    @Test
    func accessLevelWithImplicitInternalAccessLevelModifier() {
        let modifiers = DeclModifierListSyntax {
            DeclModifierSyntax(name: .keyword(.final))
        }
        let sut = SUT(modifiers: modifiers, name: "SUT") {}

        #expect(sut.accessLevel == .internal)
    }
}
