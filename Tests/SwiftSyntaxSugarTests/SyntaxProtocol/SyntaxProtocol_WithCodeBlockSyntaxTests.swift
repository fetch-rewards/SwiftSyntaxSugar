//
//  SyntaxProtocol_WithCodeBlockSyntaxTests.swift
//  SwiftSyntaxSugarTests
//
//  Created by Gray Campbell on 7/17/24.
//

import SwiftSyntax
import XCTest
@testable import SwiftSyntaxSugar

final class SyntaxProtocol_WithCodeBlockSyntaxTests: XCTestCase {

    // MARK: Typealiases

    typealias SUT = FunctionDeclSyntax

    // MARK: With CodeBlockSyntax Tests

    func testWithCodeBlockSyntax() throws {
        let sut = try SUT(
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {}
            )
        )
        .with(\.body) {}

        XCTAssertNotNil(sut.body)
    }
}
