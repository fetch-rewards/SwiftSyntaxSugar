//
//  FunctionParameterListSyntax_ToTupleTypeSyntaxTests.swift
//  SwiftSyntaxSugarTests
//
//  Created by Gray Campbell on 11/4/23.
//

import SwiftSyntax
import XCTest

@testable import SwiftSyntaxSugar

final class FunctionParameterListSyntax_ToTupleTypeSyntaxTests: XCTestCase {

    // MARK: Typealiases

    typealias SUT = FunctionParameterListSyntax

    // MARK: To TupleTypeSyntax Tests

    func testToTupleTypeSyntaxWithOneParameters() throws {
        let sut = SUT {
            FunctionParameterSyntax(
                firstName: "integer",
                type: IdentifierTypeSyntax(name: "Int")
            )
        }

        let tupleTypeSyntax = try XCTUnwrap(sut.toTupleTypeSyntax())

        XCTAssertEqual(
            tupleTypeSyntax.description,
            "(Int)"
        )
    }

    func testToTupleTypeSyntaxWithMultipleParameters() throws {
        let sut = SUT {
            FunctionParameterSyntax(
                firstName: "integer",
                type: IdentifierTypeSyntax(name: "Int")
            )
            FunctionParameterSyntax(
                firstName: "closure",
                type: FunctionTypeSyntax(
                    parameters: TupleTypeElementListSyntax {
                        TupleTypeElementSyntax(
                            type: IdentifierTypeSyntax(name: "String")
                        )
                        TupleTypeElementSyntax(
                            type: IdentifierTypeSyntax(name: "Bool")
                        )
                    },
                    returnClause: ReturnClauseSyntax(type: .void)
                )
            )
        }

        let tupleTypeSyntax = try XCTUnwrap(sut.toTupleTypeSyntax())

        XCTAssertEqual(
            tupleTypeSyntax.description,
            "(integer:Int,closure:(String,Bool)->Void)"
        )
    }

    func testToTupleTypeSyntaxWithAttributedParameters() throws {
        let sut = SUT {
            FunctionParameterSyntax(
                firstName: "integer",
                type: IdentifierTypeSyntax(name: "Int")
            )
            FunctionParameterSyntax(
                firstName: "closure",
                type: AttributedTypeSyntax(
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
                            TupleTypeElementSyntax(
                                type: IdentifierTypeSyntax(
                                    name: "String"
                                )
                            )
                            TupleTypeElementSyntax(
                                type: IdentifierTypeSyntax(name: "Bool")
                            )
                        },
                        returnClause: ReturnClauseSyntax(type: .void)
                    )
                )
            )
        }

        let tupleTypeSyntax = try XCTUnwrap(sut.toTupleTypeSyntax())

        XCTAssertEqual(
            tupleTypeSyntax.description,
            "(integer:Int,closure:(String,Bool)->Void)"
        )
    }

    func testToFunctionTypeSyntaxWithoutParameters() {
        let sut = SUT()

        XCTAssertNil(sut.toTupleTypeSyntax())
    }
}
