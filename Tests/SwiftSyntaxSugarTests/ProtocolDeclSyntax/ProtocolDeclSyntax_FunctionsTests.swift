//
//  ProtocolDeclSyntax_FunctionsTests.swift
//
//  Created by Gray Campbell.
//  Copyright © 2025 Fetch.
//

import SwiftSyntax
import Testing
@testable import SwiftSyntaxSugar

struct ProtocolDeclSyntax_FunctionsTests {

    // MARK: Typealiases

    typealias SUT = ProtocolDeclSyntax

    // MARK: Function Declarations Tests

    @Test
    func functionDeclarations() {
        let sut = SUT(name: "SUT") {
            self.initializerDeclaration()
            self.propertyDeclaration(name: "property1")
            self.initializerDeclaration()
            self.methodDeclaration(name: "method1")
            self.initializerDeclaration()
            self.propertyDeclaration(name: "property2")
            self.initializerDeclaration()
            self.methodDeclaration(name: "method2")
            self.initializerDeclaration()
            self.propertyDeclaration(name: "property3")
            self.initializerDeclaration()
        }

        #expect(sut.functionDeclarations.count == 2)
    }
}

// MARK: - Helpers

extension ProtocolDeclSyntax_FunctionsTests {
    private func initializerDeclaration() -> InitializerDeclSyntax {
        InitializerDeclSyntax(
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {}
            )
        ) {}
    }

    private func methodDeclaration(name: String) -> FunctionDeclSyntax {
        FunctionDeclSyntax(
            name: .identifier(name),
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {}
            )
        ) {}
    }

    private func propertyDeclaration(name: PatternSyntax) -> VariableDeclSyntax {
        VariableDeclSyntax(.var, name: name)
    }
}
