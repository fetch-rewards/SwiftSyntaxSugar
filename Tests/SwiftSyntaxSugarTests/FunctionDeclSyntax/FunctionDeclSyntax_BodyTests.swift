//
//  FunctionDeclSyntax_BodyTests.swift
//  SwiftSyntaxSugarTests
//
//  Created by Gray Campbell on 11/4/23.
//

import SwiftSyntax
import XCTest
@testable import SwiftSyntaxSugar

final class FunctionDeclSyntax_BodyTests: XCTestCase {

    // MARK: Typealiases

    typealias SUT = FunctionDeclSyntax

    // MARK: With Body Tests

    func testWithBody() {
        let sut = SUT(
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {}
            )
        )
        .withBody(CodeBlockSyntax {})

        XCTAssertNotNil(sut.body)
    }

    func testWithBodyBuilder() throws {
        let sut = try SUT(
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {}
            )
        )
        .withBody {}

        XCTAssertNotNil(sut.body)
    }
}
