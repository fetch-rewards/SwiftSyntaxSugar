//
//  ProtocolDeclSyntax_AccessLevelTests.swift
//
//  Created by Gray Campbell.
//  Copyright © 2025 Fetch.
//

import SwiftSyntax
import Testing
@testable import SwiftSyntaxSugar

struct ProtocolDeclSyntax_AccessLevelTests {

    // MARK: Typealiases

    typealias SUT = ProtocolDeclSyntax

    // MARK: Access Level Tests

    @Test(arguments: AccessLevelSyntax.allCases)
    func accessLevelWithExplicitAccessLevelModifier(
        from accessLevel: AccessLevelSyntax
    ) {
        let sut = SUT(
            modifiers: DeclModifierListSyntax {
                accessLevel.modifier
                DeclModifierSyntax(name: .keyword(.static))
            },
            name: "SUT"
        ) {}

        #expect(sut.accessLevel == accessLevel)
    }

    @Test
    func accessLevelWithImplicitInternalAccessLevelModifier() {
        let sut = SUT(
            modifiers: DeclModifierListSyntax {
                DeclModifierSyntax(name: .keyword(.static))
            },
            name: "SUT"
        ) {}

        #expect(sut.accessLevel == .internal)
    }

    // MARK: Minimum Conforming Access Level Tests

    @Test(arguments: AccessLevelSyntax.allCases)
    func minimumConformingAccessLevelWithExplicitAccessLevelModifier(
        from accessLevel: AccessLevelSyntax
    ) {
        let sut = SUT(
            modifiers: DeclModifierListSyntax {
                accessLevel.modifier
                DeclModifierSyntax(name: .keyword(.static))
            },
            name: "SUT"
        ) {}

        let expectedMinimumConformingAccessLevel: AccessLevelSyntax = switch accessLevel {
        case .fileprivate, .private: .fileprivate
        case .internal, .open, .package, .public: accessLevel
        }

        #expect(
            sut.minimumConformingAccessLevel == expectedMinimumConformingAccessLevel
        )
    }

    @Test
    func minimumConformingAccessLevelWithImplicitInternalAccessLevelModifier() {
        let sut = SUT(
            modifiers: DeclModifierListSyntax {
                DeclModifierSyntax(name: .keyword(.static))
            },
            name: "SUT"
        ) {}

        #expect(sut.minimumConformingAccessLevel == .internal)
    }
}
