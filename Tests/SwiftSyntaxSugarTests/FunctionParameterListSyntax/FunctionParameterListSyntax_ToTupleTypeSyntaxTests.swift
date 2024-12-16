//
//  FunctionParameterListSyntax_ToTupleTypeSyntaxTests.swift
//
//  Created by Gray Campbell.
//  Copyright © 2024 Fetch.
//

import SwiftSyntax
import Testing
@testable import SwiftSyntaxSugar

struct FunctionParameterListSyntax_ToTupleTypeSyntaxTests {

    // MARK: Typealiases

    typealias SUT = FunctionParameterListSyntax

    // MARK: To TupleTypeSyntax Tests

    @Test
    func toTupleTypeSyntaxWithOneParameter() throws {
        let sut = SUT {
            FunctionParameterSyntax(firstName: "integer", type: .int)
        }

        let tupleTypeSyntax = try #require(sut.toTupleTypeSyntax())
        let expectedDescription = "(Int)"

        #expect(tupleTypeSyntax.description == expectedDescription)
    }

    @Test
    func toTupleTypeSyntaxWithMultipleParameters() throws {
        let sut = SUT {
            FunctionParameterSyntax(firstName: "integer", type: .int)
            FunctionParameterSyntax(
                firstName: "closure",
                type: FunctionTypeSyntax(
                    parameters: TupleTypeElementListSyntax {
                        TupleTypeElementSyntax(type: .string)
                        TupleTypeElementSyntax(type: .bool)
                    },
                    returnClause: ReturnClauseSyntax(type: .void)
                )
            )
        }

        let tupleTypeSyntax = try #require(sut.toTupleTypeSyntax())
        let expectedDescription = "(integer:Int,closure:(String,Bool)->Void)"

        #expect(tupleTypeSyntax.description == expectedDescription)
    }

    @Test
    func toTupleTypeSyntaxWithAttributedParameters() throws {
        // TODO: Remove AttributedTypeSyntax specifiers argument when deprecated init is removed.
        let sut = SUT {
            FunctionParameterSyntax(firstName: "integer", type: .int)
            FunctionParameterSyntax(
                firstName: "closure",
                type: AttributedTypeSyntax(
                    specifiers: [],
                    attributes: AttributeListSyntax {
                        AttributeSyntax(
                            atSign: .atSignToken(),
                            attributeName: IdentifierTypeSyntax(
                                name: .keyword(.escaping)
                            )
                        )
                    },
                    baseType: FunctionTypeSyntax(
                        parameters: TupleTypeElementListSyntax {
                            TupleTypeElementSyntax(type: .string)
                            TupleTypeElementSyntax(type: .bool)
                        },
                        returnClause: ReturnClauseSyntax(type: .void)
                    )
                )
            )
        }

        let tupleTypeSyntax = try #require(sut.toTupleTypeSyntax())
        let expectedDescription = "(integer:Int,closure:(String,Bool)->Void)"

        #expect(tupleTypeSyntax.description == expectedDescription)
    }

    @Test
    func toTupleTypeSyntaxWithVariadicParameter() throws {
        let sut = SUT {
            FunctionParameterSyntax(
                firstName: "integer",
                type: .int,
                ellipsis: .ellipsisToken()
            )
        }

        let tupleTypeSyntax = try #require(sut.toTupleTypeSyntax())
        let expectedDescription = "([Int])"

        #expect(tupleTypeSyntax.description == expectedDescription)
    }

    @Test
    func toTupleTypeSyntaxWithoutParameters() {
        let sut = SUT()

        #expect(sut.toTupleTypeSyntax() == nil)
    }
}
