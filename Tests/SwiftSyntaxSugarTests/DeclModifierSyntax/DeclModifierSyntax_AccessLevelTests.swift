//
//  DeclModifierSyntax_AccessLevelTests.swift
//  SwiftSyntaxSugarTests
//
//  Created by Gray Campbell on 11/4/23.
//

import SwiftSyntax
import XCTest
@testable import SwiftSyntaxSugar

final class DeclModifierSyntax_AccessLevelTests: XCTestCase {

    // MARK: Typealiases

    typealias SUT = DeclModifierSyntax

    // MARK: Is Access Level Tests

    func testIsAccessLevelWithAccessLevelModifiers() {
        for accessLevel in AccessLevelSyntax.allCases {
            let sut = SUT(name: accessLevel.token)

            XCTAssertTrue(sut.isAccessLevel)
        }
    }

    func testIsAccessLevelWithNonAccessLevelModifiers() {
        let keywords: [Keyword] = [.class, .lazy, .static]

        for keyword in keywords {
            let sut = SUT(name: .keyword(keyword))

            XCTAssertFalse(sut.isAccessLevel)
        }
    }
}
