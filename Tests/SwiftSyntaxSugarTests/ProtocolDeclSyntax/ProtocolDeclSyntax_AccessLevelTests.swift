//
//  ProtocolDeclSyntax_AccessLevelTests.swift
//  SwiftSyntaxSugarTests
//
//  Created by Gray Campbell on 11/8/23.
//

import SwiftSyntax
import XCTest
@testable import SwiftSyntaxSugar

final class ProtocolDeclSyntax_AccessLevelTests: XCTestCase {

    // MARK: Typealiases

    typealias SUT = ProtocolDeclSyntax

    // MARK: Access Level Tests

    func testAccessLevelWithExplicitAccessLevels() {
        for accessLevel in AccessLevelSyntax.allCases {
            let sut = SUT(
                modifiers: DeclModifierListSyntax {
                    accessLevel.modifier
                    DeclModifierSyntax(name: .keyword(.static))
                },
                name: "SUT"
            ) {}

            XCTAssertEqual(sut.accessLevel, accessLevel)
        }
    }

    func testAccessLevelWithImplicitInternalAccessLevel() {
        let sut = SUT(
            modifiers: DeclModifierListSyntax {
                DeclModifierSyntax(name: .keyword(.static))
            },
            name: "SUT"
        ) {}

        XCTAssertEqual(sut.accessLevel, .internal)
    }

    // MARK: Minimum Conforming Access Level Tests

    func testMinimumConformingAccessLevelWithExplicitAccessLevels() {
        for accessLevel in AccessLevelSyntax.allCases {
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

            XCTAssertEqual(
                sut.minimumConformingAccessLevel,
                expectedMinimumConformingAccessLevel
            )
        }
    }

    func testMinimumConformingAccessLevelWithImplicitInternalAccessLevel() {
        let sut = SUT(
            modifiers: DeclModifierListSyntax {
                DeclModifierSyntax(name: .keyword(.static))
            },
            name: "SUT"
        ) {}

        XCTAssertEqual(sut.minimumConformingAccessLevel, .internal)
    }
}
