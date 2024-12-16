//
//  FunctionDeclSyntax_ParametersTests.swift
//  SwiftSyntaxSugarTests
//
//  Created by Gray Campbell on 11/4/23.
//

import SwiftSyntax
import Testing
@testable import SwiftSyntaxSugar

struct FunctionDeclSyntax_ParametersTests {

    // MARK: Typealiases

    typealias SUT = FunctionDeclSyntax

    // MARK: Parameter Variable Names Tests

    @Test
    func parameterVariableNamesWithEmptyParameters() throws {
        let sut = SUT(
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {}
            )
        )

        #expect(sut.parameterVariableNames.isEmpty)
    }

    @Test
    func parameterVariableNamesWithNonEmptyParameters() throws {
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

        let parameterVariableNames = try #require(sut.parameterVariableNames)
        let firstParameterVariableName = try #require(
            parameterVariableNames.first
        )
        let lastParameterVariableName = try #require(
            parameterVariableNames.last
        )

        #expect(firstParameterVariableName.tokenKind == .identifier("increment"))
        #expect(lastParameterVariableName.tokenKind == .identifier("limit"))
    }
}
