//
//  FunctionDeclSyntax_AccessLevelTests.swift
//  SwiftSyntaxSugarTests
//
//  Created by Gray Campbell on 11/4/23.
//

import SwiftSyntax
import XCTest
@testable import SwiftSyntaxSugar

final class FunctionDeclSyntax_AccessLevelTests: XCTestCase {

    // MARK: Typealiases

    typealias SUT = FunctionDeclSyntax

    // MARK: Access Level Tests

    func testAccessLevelWithExplicitAccessLevels() {
        for accessLevel in AccessLevelSyntax.allCases {
            let sut = SUT(
                modifiers: DeclModifierListSyntax { accessLevel.modifier },
                name: "sut",
                signature: FunctionSignatureSyntax(
                    parameterClause: FunctionParameterClauseSyntax {}
                )
            )

            XCTAssertEqual(sut.accessLevel, accessLevel)
        }
    }

    func testAccessLevelWithImplicitInternalAccessLevel() {
        let sut = SUT(
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {}
            )
        )

        XCTAssertEqual(sut.accessLevel, .internal)
    }

    // MARK: With Access Level Tests

    func testWithAccessLevelWithExplicitAccessLevels() throws {
        for oldAccessLevel in AccessLevelSyntax.allCases {
            for newAccessLevel in AccessLevelSyntax.allCases {
                let sut = try SUT(
                    modifiers: DeclModifierListSyntax {
                        oldAccessLevel.modifier
                        DeclModifierSyntax(name: .keyword(.static))
                    },
                    name: "sut",
                    signature: FunctionSignatureSyntax(
                        parameterClause: FunctionParameterClauseSyntax {}
                    )
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

    func testWithAccessLevelWithImplicitInternalAccessLevel() throws {
        for newAccessLevel in AccessLevelSyntax.allCases {
            let sut = try SUT(
                modifiers: DeclModifierListSyntax {
                    DeclModifierSyntax(name: .keyword(.static))
                },
                name: "sut",
                signature: FunctionSignatureSyntax(
                    parameterClause: FunctionParameterClauseSyntax {}
                )
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
