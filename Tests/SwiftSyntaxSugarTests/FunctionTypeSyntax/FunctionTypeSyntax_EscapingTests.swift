//
//  FunctionTypeSyntax_EscapingTests.swift
//  SwiftSyntaxSugarTests
//
//  Created by Gray Campbell on 11/4/23.
//

import SwiftSyntax
import Testing
@testable import SwiftSyntaxSugar

struct FunctionTypeSyntax_EscapingTests {

    // MARK: Typealiases

    typealias SUT = FunctionTypeSyntax

    // MARK: Escaping Tests

    @Test
    func escaping() {
        let sut = SUT(
            parameters: TupleTypeElementListSyntax(),
            returnClause: ReturnClauseSyntax(type: .bool)
        )

        let sutEscaping = sut.escaping()
        let expectedDescription = "@escaping()->Bool"

        #expect(sutEscaping.description == expectedDescription)
    }
}
