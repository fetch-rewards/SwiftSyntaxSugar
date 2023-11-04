//
//  FunctionDeclSyntax_ParametersTests.swift
//  SwiftSyntaxSugarTests
//
//  Created by Gray Campbell on 11/4/23.
//

import SwiftSyntax
import XCTest

@testable import SwiftSyntaxSugar

final class FunctionDeclSyntax_ParametersTests: XCTestCase {

    // MARK: Typealiases

    typealias SUT = FunctionDeclSyntax

    // MARK: Parameter Variable Names Tests

    func testParameterVariableNamesWithEmptyParameters() throws {
        let sut = SUT(
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {}
            )
        )

        XCTAssertNil(sut.parameterVariableNames)
    }

    func testParameterVariableNamesWithNonEmptyParameters() throws {
        let sut = SUT(
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {
                    FunctionParameterSyntax(
                        firstName: "by",
                        secondName: "increment",
                        type: .int
                    )
                    FunctionParameterSyntax(
                        firstName: "limit",
                        type: .int
                    )
                }
            )
        )

        let parameterVariableNames = try XCTUnwrap(sut.parameterVariableNames)
        let firstParameterVariableName = try XCTUnwrap(parameterVariableNames.first)
        let lastParameterVariableName = try XCTUnwrap(parameterVariableNames.last)

        XCTAssertEqual(firstParameterVariableName.text, "increment")
        XCTAssertEqual(lastParameterVariableName.text, "limit")
    }
}
