//
//  ProtocolDeclSyntax_ActorTests.swift
//  SwiftSyntaxSugarTests
//
//  Created by Gray Campbell on 11/8/23.
//

import SwiftSyntax
import Testing
@testable import SwiftSyntaxSugar

struct ProtocolDeclSyntax_ActorTests {

    // MARK: Typealiases

    typealias SUT = ProtocolDeclSyntax

    // MARK: Is Actor Constrained Tests

    @Test
    func isActorConstrainedWithNilInheritanceClause() {
        let sut = SUT(name: "SUT") {}

        #expect(!sut.isActorConstrained)
    }

    @Test
    func isActorConstrainedWithNonNilInheritanceClauseWithActorConformance() {
        let sut = SUT(
            name: "SUT",
            inheritanceClause: InheritanceClauseSyntax {
                InheritedTypeSyntax(type: TypeSyntax(describing: (any Hashable).self))
                InheritedTypeSyntax(type: TypeSyntax(describing: (any Actor).self))
                InheritedTypeSyntax(type: TypeSyntax(describing: (any Identifiable).self))
            }
        ) {}

        #expect(sut.isActorConstrained)
    }

    @Test
    func isActorConstrainedWithNonNilInheritanceClauseWithoutActorConformance() {
        let sut = SUT(
            name: "SUT",
            inheritanceClause: InheritanceClauseSyntax {
                InheritedTypeSyntax(type: TypeSyntax(describing: (any Hashable).self))
                InheritedTypeSyntax(type: TypeSyntax(describing: (any Identifiable).self))
            }
        ) {}

        #expect(!sut.isActorConstrained)
    }
}
