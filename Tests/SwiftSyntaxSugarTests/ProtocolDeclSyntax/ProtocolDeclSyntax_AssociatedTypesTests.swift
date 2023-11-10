//
//  ProtocolDeclSyntax_AssociatedTypesTests.swift
//  SwiftSyntaxSugarTests
//
//  Created by Gray Campbell on 11/8/23.
//

import SwiftSyntax
import XCTest

@testable import SwiftSyntaxSugar

final class ProtocolDeclSyntax_AssociatedTypesTests: XCTestCase {

    // MARK: Typealiases

    typealias SUT = ProtocolDeclSyntax

    // MARK: Associated Type Declarations Tests

    func testAssociatedTypeDeclarationsWithEmptyMemberBlock() {
        let sut = SUT(name: "SUT") {}

        XCTAssertTrue(sut.associatedTypeDeclarations.isEmpty)
    }

    func testAssociatedTypeDeclarationsWithNonEmptyMemberBlockWithAssociatedTypes() {
        let sut = SUT(name: "SUT") {
            VariableDeclSyntax(.var, name: "a")
            AssociatedTypeDeclSyntax(name: "A")
            VariableDeclSyntax(.var, name: "b")
            AssociatedTypeDeclSyntax(name: "B")
        }

        XCTAssertEqual(sut.associatedTypeDeclarations.count, 2)
    }

    func testAssociatedTypeDeclarationsWithNonEmptyMemberBlockWithoutAssociatedTypes() {
        let sut = SUT(name: "SUT") {
            VariableDeclSyntax(.var, name: "a")
            VariableDeclSyntax(.var, name: "b")
        }

        XCTAssertTrue(sut.associatedTypeDeclarations.isEmpty)
    }
}
