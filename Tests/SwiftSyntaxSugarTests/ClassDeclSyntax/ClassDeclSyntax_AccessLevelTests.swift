//
//  ClassDeclSyntax_AccessLevelTests.swift
//  SwiftSyntaxSugarTests
//
//  Created by Gray Campbell on 11/4/23.
//

import SwiftSyntax
import XCTest

@testable import SwiftSyntaxSugar

final class ClassDeclSyntax_AccessLevelTests: XCTestCase {

    // MARK: Typealiases

    typealias SUT = ClassDeclSyntax

    // MARK: Access Level Tests

    func testAccessLevelWithExplicitAccessLevels() {
        for accessLevel in AccessLevelSyntax.allCases {
            let modifiers = DeclModifierListSyntax {
                accessLevel.modifier
                DeclModifierSyntax(name: .keyword(.final))
            }
            let sut = SUT(modifiers: modifiers, name: "SUT") {}

            XCTAssertEqual(sut.accessLevel, accessLevel)
        }
    }

    func testAccessLevelWithImplicitInternalAccessLevel() {
        let modifiers = DeclModifierListSyntax {
            DeclModifierSyntax(name: .keyword(.final))
        }
        let sut = SUT(modifiers: modifiers, name: "SUT") {}

        XCTAssertEqual(sut.accessLevel, .internal)
    }
}
