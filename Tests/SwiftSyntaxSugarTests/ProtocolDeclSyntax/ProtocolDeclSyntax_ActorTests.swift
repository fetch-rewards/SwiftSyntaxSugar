//
//  ProtocolDeclSyntax_ActorTests.swift
//  SwiftSyntaxSugarTests
//
//  Created by Gray Campbell on 11/8/23.
//

import SwiftSyntax
import XCTest
@testable import SwiftSyntaxSugar

final class ProtocolDeclSyntax_ActorTests: XCTestCase {

    // MARK: Typealiases

    typealias SUT = ProtocolDeclSyntax

    // MARK: Is Actor Constrained Tests

    func testIsActorConstrainedWithNilInheritanceClause() {
        let sut = SUT(name: "SUT") {}

        XCTAssertFalse(sut.isActorConstrained)
    }

    func testIsActorConstrainedWithNonNilInheritanceClauseWithActorConformance() {
        let sut = SUT(
            name: "SUT",
            inheritanceClause: InheritanceClauseSyntax {
                InheritedTypeSyntax(type: TypeSyntax(describing: (any Hashable).self))
                InheritedTypeSyntax(type: TypeSyntax(describing: (any Actor).self))
                InheritedTypeSyntax(type: TypeSyntax(describing: (any Identifiable).self))
            }
        ) {}

        XCTAssertTrue(sut.isActorConstrained)
    }

    func testIsActorConstrainedWithNonNilInheritanceClauseWithoutActorConformance() {
        let sut = SUT(
            name: "SUT",
            inheritanceClause: InheritanceClauseSyntax {
                InheritedTypeSyntax(type: TypeSyntax(describing: (any Hashable).self))
                InheritedTypeSyntax(type: TypeSyntax(describing: (any Identifiable).self))
            }
        ) {}

        XCTAssertFalse(sut.isActorConstrained)
    }
}
