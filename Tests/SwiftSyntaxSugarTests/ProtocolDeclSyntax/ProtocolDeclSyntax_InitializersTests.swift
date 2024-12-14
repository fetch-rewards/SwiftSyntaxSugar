//
//  ProtocolDeclSyntax_InitializersTests.swift
//
//  Created by Gray Campbell.
//  Copyright © 2024 Fetch.
//

import SwiftSyntax
import Testing
@testable import SwiftSyntaxSugar

struct ProtocolDeclSyntax_InitializersTests {

    // MARK: Typealiases

    typealias SUT = ProtocolDeclSyntax

    // MARK: Initializer Declarations Tests

    @Test
    func initializerDeclarations() {
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

        #expect(sut.initializerDeclarations.count == 6)
    }
}

// MARK: - Helpers

extension ProtocolDeclSyntax_InitializersTests {
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
