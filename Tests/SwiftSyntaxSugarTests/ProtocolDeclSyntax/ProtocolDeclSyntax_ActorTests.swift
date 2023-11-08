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

        XCTAssertNil(sut.isActorConstrained)
    }

    func testIsActorConstrainedWithNonNilInheritanceClauseWithActorConformance() {

    }

    func testIsActorConstrainedWithNonNilInheritanceClauseWithoutActorConformance() {

    }
}
