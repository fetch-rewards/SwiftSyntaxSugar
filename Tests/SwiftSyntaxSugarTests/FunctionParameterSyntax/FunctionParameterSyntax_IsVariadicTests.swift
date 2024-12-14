//
//  FunctionParameterSyntax_IsVariadicTests.swift
//  SwiftSyntaxSugar
//
//  Created by Gray Campbell on 12/9/24.
//

import SwiftSyntax
import Testing
@testable import SwiftSyntaxSugar

struct FunctionParameterSyntax_IsVariadicTests {

    // MARK: Typealiases

    typealias SUT = FunctionParameterSyntax

    // MARK: Is Variadic Tests

    @Test
    func isVariadicWhenEllipsisIsNil() {
        let sut = SUT(
            firstName: "parameter",
            colon: .colonToken(),
            type: .int
        )

        #expect(!sut.isVariadic)
    }

    @Test
    func isVariadicWhenEllipsisIsNotNil() {
        let sut = SUT(
            firstName: "parameter",
            colon: .colonToken(),
            type: .int,
            ellipsis: .ellipsisToken()
        )

        #expect(sut.isVariadic)
    }
}
