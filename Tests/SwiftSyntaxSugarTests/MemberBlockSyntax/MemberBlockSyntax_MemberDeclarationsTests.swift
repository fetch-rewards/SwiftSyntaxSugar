//
//  MemberBlockSyntax_MemberDeclarationsTests.swift
//
//  Copyright © 2025 Fetch.
//

import SwiftSyntax
import Testing
@testable import SwiftSyntaxSugar

struct MemberBlockSyntax_MemberDeclarationsTests {

    // MARK: Typealiases

    typealias SUT = ProtocolDeclSyntax

    // MARK: Associated Type Declarations Tests

    @Test
    func associatedTypeDeclarationsWithEmptyMemberBlock() {
        let sut = SUT(name: "SUT") {}
        let associatedTypeDeclarations = sut.memberBlock.memberDeclarations(
            ofType: AssociatedTypeDeclSyntax.self
        )

        #expect(associatedTypeDeclarations.isEmpty)
    }

    @Test
    func associatedTypeDeclarationsWithNonEmptyMemberBlockWithAssociatedTypes() {
        let sut = SUT(name: "SUT") {
            self.propertyDeclaration(name: "a")
            self.associatedTypeDeclaration(name: "A")
            self.propertyDeclaration(name: "b")
            self.associatedTypeDeclaration(name: "B")
        }
        let associatedTypeDeclarations = sut.memberBlock.memberDeclarations(
            ofType: AssociatedTypeDeclSyntax.self
        )

        #expect(associatedTypeDeclarations.count == 2)
    }

    @Test
    func associatedTypeDeclarationsWithNonEmptyMemberBlockWithoutAssociatedTypes() {
        let sut = SUT(name: "SUT") {
            self.propertyDeclaration(name: "a")
            self.propertyDeclaration(name: "b")
        }
        let associatedTypeDeclarations = sut.memberBlock.memberDeclarations(
            ofType: AssociatedTypeDeclSyntax.self
        )

        #expect(associatedTypeDeclarations.isEmpty)
    }

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
        let functionDeclarations = sut.memberBlock.memberDeclarations(
            ofType: FunctionDeclSyntax.self
        )

        #expect(functionDeclarations.count == 2)
    }

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
        let initializerDeclarations = sut.memberBlock.memberDeclarations(
            ofType: InitializerDeclSyntax.self
        )

        #expect(initializerDeclarations.count == 6)
    }

    // MARK: Variable Declarations Tests

    @Test
    func variableDeclarations() {
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
        let variableDeclarations = sut.memberBlock.memberDeclarations(
            ofType: VariableDeclSyntax.self
        )

        #expect(variableDeclarations.count == 3)
    }
}

// MARK: - Helpers

extension MemberBlockSyntax_MemberDeclarationsTests {
    private func associatedTypeDeclaration(
        name: TokenSyntax
    ) -> AssociatedTypeDeclSyntax {
        AssociatedTypeDeclSyntax(name: name)
    }

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
