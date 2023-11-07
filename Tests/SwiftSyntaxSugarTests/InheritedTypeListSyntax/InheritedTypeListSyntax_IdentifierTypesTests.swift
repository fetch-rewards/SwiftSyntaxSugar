//
//  InheritedTypeListSyntax_IdentifierTypesTests.swift
//  SwiftSyntaxSugarTests
//
//  Created by Gray Campbell on 11/4/23.
//

import SwiftSyntax
import XCTest
@testable import SwiftSyntaxSugar

final class InheritedTypeListSyntax_IdentifierTypesTests: XCTestCase {

    // MARK: Typealiases

    typealias SUT = InheritedTypeListSyntax

    // MARK: Identifier Types Tests

    func testIdentifierTypes() {
        let sut = SUT {
            InheritedTypeSyntax(
                type: IdentifierTypeSyntax(name: "Hashable")
            )
            InheritedTypeSyntax(
                type: IdentifierTypeSyntax(name: "Identifiable")
            )
        }

        XCTAssertEqual(
            sut.identifierTypes.map(\.name.text),
            ["Hashable", "Identifiable"]
        )
    }
}
