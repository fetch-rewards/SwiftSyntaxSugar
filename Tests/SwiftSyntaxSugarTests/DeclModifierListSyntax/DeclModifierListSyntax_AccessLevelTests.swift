//
//  DeclModifierListSyntax_AccessLevelTests.swift
//  SwiftSyntaxSugarTests
//
//  Created by Gray Campbell on 11/4/23.
//

import SwiftSyntax
import XCTest

@testable import SwiftSyntaxSugar

final class DeclModifierListSyntax_AccessLevelTests: XCTestCase {

    // MARK: Typealiases

    typealias SUT = DeclModifierListSyntax

    // MARK: Access Level Tests

    func testAccessLevelForExplicitAccessLevels() {
        for accessLevel in AccessLevelSyntax.allCases {
            let sut = SUT {
                accessLevel.modifier
                DeclModifierSyntax(name: .keyword(.static))
            }

            XCTAssertEqual(sut.accessLevel, accessLevel)
        }
    }

    func testAccessLevelForImplicitInternalAccessLevel() {
        let sut = SUT {
            DeclModifierSyntax(name: .keyword(.static))
        }

        XCTAssertEqual(sut.accessLevel, .internal)
    }
}
