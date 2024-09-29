//
//  FunctionDeclSyntax_ToFunctionTypeSyntaxTests.swift
//  SwiftSyntaxSugarTests
//
//  Created by Gray Campbell on 11/4/23.
//

import SwiftSyntax
import XCTest
@testable import SwiftSyntaxSugar

final class FunctionDeclSyntax_ToFunctionTypeSyntaxTests: XCTestCase {

    // MARK: Typealiases

    typealias SUT = FunctionDeclSyntax

    // MARK: To FunctionTypeSyntax Tests

    func testToFunctionTypeSyntaxWithParameters() {
        let sut = SUT(
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {
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
            )
        )

        XCTAssertEqual(
            sut.toFunctionTypeSyntax().description,
            "(Int,(String,Bool)->Void)->Void"
        )
    }

    func testToFunctionTypeSyntaxWithAttributedParameters() {
        // TODO: Remove AttributedTypeSyntax specifiers argument when deprecated init is removed.
        let sut = SUT(
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {
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
            )
        )

        XCTAssertEqual(
            sut.toFunctionTypeSyntax().description,
            "(Int,(String,Bool)->Void)->Void"
        )
    }

    func testToFunctionTypeSyntaxWithoutParameters() {
        let sut = SUT(
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {}
            )
        )

        XCTAssertEqual(
            sut.toFunctionTypeSyntax().description,
            "()->Void"
        )
    }

    func testToFunctionTypeSyntaxWithAsyncSpecifier() {
        let sut = SUT(
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {},
                effectSpecifiers: FunctionEffectSpecifiersSyntax(
                    asyncSpecifier: .keyword(.async)
                )
            )
        )

        XCTAssertEqual(
            sut.toFunctionTypeSyntax().description,
            "()async->Void"
        )
    }

    func testToFunctionTypeSyntaxWithThrowsSpecifier() {
        let sut = SUT(
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {},
                effectSpecifiers: FunctionEffectSpecifiersSyntax(
                    throwsClause: ThrowsClauseSyntax(
                        throwsSpecifier: .keyword(.throws)
                    )
                )
            )
        )

        XCTAssertEqual(
            sut.toFunctionTypeSyntax().description,
            "()throws->Void"
        )
    }

    func testToFunctionTypeSyntaxWithAsyncAndThrowsSpecifiers() {
        let sut = SUT(
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {},
                effectSpecifiers: FunctionEffectSpecifiersSyntax(
                    asyncSpecifier: .keyword(.async),
                    throwsClause: ThrowsClauseSyntax(
                        throwsSpecifier: .keyword(.throws)
                    )
                )
            )
        )

        XCTAssertEqual(
            sut.toFunctionTypeSyntax().description,
            "()asyncthrows->Void"
        )
    }

    func testToFunctionTypeSyntaxWithReturnValue() {
        let sut = SUT(
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {},
                returnClause: ReturnClauseSyntax(type: .bool)
            )
        )

        XCTAssertEqual(
            sut.toFunctionTypeSyntax().description,
            "()->Bool"
        )
    }

    func testToFunctionTypeSyntaxWithoutReturnValue() {
        let sut = SUT(
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {}
            )
        )

        XCTAssertEqual(
            sut.toFunctionTypeSyntax().description,
            "()->Void"
        )
    }
}
