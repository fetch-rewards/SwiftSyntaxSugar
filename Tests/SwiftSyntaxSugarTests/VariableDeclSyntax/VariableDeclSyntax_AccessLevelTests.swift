//
//  VariableDeclSyntax_AccessLevelTests.swift
//  SwiftSyntaxSugarTests
//
//  Created by Gray Campbell on 11/4/23.
//

import SwiftSyntax
import XCTest
@testable import SwiftSyntaxSugar

final class VariableDeclSyntax_AccessLevelTests: XCTestCase {

    // MARK: Typealiases

    typealias SUT = VariableDeclSyntax

    // MARK: Access Level Tests

    func testAccessLevelWithExplicitAccessLevels() {
        for accessLevel in AccessLevelSyntax.allCases {
            let sut = SUT(
                modifiers: DeclModifierListSyntax { accessLevel.modifier },
                .var,
                name: "sut"
            )

            XCTAssertEqual(sut.accessLevel, accessLevel)
        }
    }

    func testAccessLevelWithImplicitInternalAccessLevel() {
        let sut = SUT(.var, name: "sut")

        XCTAssertEqual(sut.accessLevel, .internal)
    }

    // MARK: With Access Level Tests

    func testWithAccessLevelWithExplicitAccessLevels() {
        for oldAccessLevel in AccessLevelSyntax.allCases {
            for newAccessLevel in AccessLevelSyntax.allCases {
                let sut = SUT(
                    modifiers: DeclModifierListSyntax {
                        oldAccessLevel.modifier
                        DeclModifierSyntax(name: .keyword(.static))
                    },
                    .var,
                    name: "sut"
                )
                .withAccessLevel(newAccessLevel)

                XCTAssertEqual(sut.accessLevel, newAccessLevel)
                XCTAssertEqual(
                    sut.modifiers.count,
                    newAccessLevel == .internal ? 1 : 2
                )
            }
        }
    }

    func testWithAccessLevelWithImplicitInternalAccessLevel() {
        for newAccessLevel in AccessLevelSyntax.allCases {
            let sut = SUT(
                modifiers: DeclModifierListSyntax {
                    DeclModifierSyntax(name: .keyword(.static))
                },
                .var,
                name: "sut"
            )
            .withAccessLevel(newAccessLevel)

            XCTAssertEqual(sut.accessLevel, newAccessLevel)
            XCTAssertEqual(
                sut.modifiers.count,
                newAccessLevel == .internal ? 1 : 2
            )
        }
    }
}
