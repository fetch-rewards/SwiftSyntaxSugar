//
//  ProtocolDeclSyntax_AssociatedTypesTests.swift
//  SwiftSyntaxSugarTests
//
//  Created by Gray Campbell on 11/8/23.
//

import SwiftSyntax
import Testing
@testable import SwiftSyntaxSugar

struct ProtocolDeclSyntax_AssociatedTypesTests {

    // MARK: Typealiases

    typealias SUT = ProtocolDeclSyntax

    // MARK: Associated Type Declarations Tests

    @Test
    func associatedTypeDeclarationsWithEmptyMemberBlock() {
        let sut = SUT(name: "SUT") {}

        #expect(sut.associatedTypeDeclarations.isEmpty)
    }

    @Test
    func associatedTypeDeclarationsWithNonEmptyMemberBlockWithAssociatedTypes() {
        let sut = SUT(name: "SUT") {
            VariableDeclSyntax(.var, name: "a")
            AssociatedTypeDeclSyntax(name: "A")
            VariableDeclSyntax(.var, name: "b")
            AssociatedTypeDeclSyntax(name: "B")
        }

        #expect(sut.associatedTypeDeclarations.count == 2)
    }

    @Test
    func associatedTypeDeclarationsWithNonEmptyMemberBlockWithoutAssociatedTypes() {
        let sut = SUT(name: "SUT") {
            VariableDeclSyntax(.var, name: "a")
            VariableDeclSyntax(.var, name: "b")
        }

        #expect(sut.associatedTypeDeclarations.isEmpty)
    }
}
