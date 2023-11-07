//
//  TypeSyntax_DescribingTests.swift
//  SwiftSyntaxSugarTests
//
//  Created by Gray Campbell on 11/4/23.
//

import SwiftSyntax
import XCTest
@testable import SwiftSyntaxSugar

final class TypeSyntax_DescribingTests: XCTestCase {

    // MARK: Typealiases

    typealias SUT = TypeSyntax

    // MARK: Initializer Tests

    func testInitDescribingSubject() {
        let sut = SUT(describing: Int.self)

        XCTAssertEqual(sut.description, "Int")
    }

    // MARK: Static Property Tests

    func testStaticProperties() {
        XCTAssertEqual(SUT.bool.description, "Bool")
        XCTAssertEqual(SUT.int.description, "Int")
        XCTAssertEqual(SUT.string.description, "String")
        XCTAssertEqual(SUT.void.description, "Void")
    }
}
