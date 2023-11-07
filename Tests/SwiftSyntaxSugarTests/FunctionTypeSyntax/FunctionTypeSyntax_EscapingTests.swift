//
//  FunctionTypeSyntax_EscapingTests.swift
//  SwiftSyntaxSugarTests
//
//  Created by Gray Campbell on 11/4/23.
//

import SwiftSyntax
import XCTest
@testable import SwiftSyntaxSugar

final class FunctionTypeSyntax_EscapingTests: XCTestCase {

    // MARK: Typealiases

    typealias SUT = FunctionTypeSyntax

    // MARK: Escaping Tests

    func testEscaping() {
        let sut = SUT(
            parameters: TupleTypeElementListSyntax(),
            returnClause: ReturnClauseSyntax(type: .bool)
        )

        XCTAssertEqual(
            sut.escaping().description,
            "@escaping()->Bool"
        )
    }
}
