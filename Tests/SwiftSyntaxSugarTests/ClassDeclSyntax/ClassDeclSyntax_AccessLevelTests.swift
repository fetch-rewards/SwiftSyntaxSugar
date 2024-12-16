//
//  ClassDeclSyntax_AccessLevelTests.swift
//
//  Created by Gray Campbell.
//  Copyright © 2024 Fetch.
//

import SwiftSyntax
import Testing
@testable import SwiftSyntaxSugar

struct ClassDeclSyntax_AccessLevelTests {

    // MARK: Typealiases

    typealias SUT = ClassDeclSyntax

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
