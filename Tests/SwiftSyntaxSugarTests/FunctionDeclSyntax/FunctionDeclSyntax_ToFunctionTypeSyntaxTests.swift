//
//  FunctionDeclSyntax_ToFunctionTypeSyntaxTests.swift
//  SwiftSyntaxSugarTests
//
//  Created by Gray Campbell on 11/4/23.
//

import SwiftSyntax
import Testing
@testable import SwiftSyntaxSugar

struct FunctionDeclSyntax_ToFunctionTypeSyntaxTests {

    // MARK: Typealiases

    typealias SUT = FunctionDeclSyntax

    // MARK: To FunctionTypeSyntax Tests

    @Test
    func toFunctionTypeSyntaxWithParameters() {
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

        let functionTypeSyntax = sut.toFunctionTypeSyntax()
        let expectedDescription = "(Int,(String,Bool)->Void)->Void"

        #expect(functionTypeSyntax.description == expectedDescription)
    }

    @Test
    func toFunctionTypeSyntaxWithAttributedParameters() {
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

        let functionTypeSyntax = sut.toFunctionTypeSyntax()
        let expectedDescription = "(Int,(String,Bool)->Void)->Void"

        #expect(functionTypeSyntax.description == expectedDescription)
    }

    @Test
    func toFunctionTypeSyntaxWithoutParameters() {
        let sut = SUT(
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {}
            )
        )

        let functionTypeSyntax = sut.toFunctionTypeSyntax()
        let expectedDescription = "()->Void"

        #expect(functionTypeSyntax.description == expectedDescription)
    }

    @Test
    func toFunctionTypeSyntaxWithAsyncSpecifier() {
        let sut = SUT(
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {},
                effectSpecifiers: FunctionEffectSpecifiersSyntax(
                    asyncSpecifier: .keyword(.async)
                )
            )
        )

        let functionTypeSyntax = sut.toFunctionTypeSyntax()
        let expectedDescription = "()async->Void"

        #expect(functionTypeSyntax.description == expectedDescription)
    }

    @Test
    func toFunctionTypeSyntaxWithThrowsSpecifier() {
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

        let functionTypeSyntax = sut.toFunctionTypeSyntax()
        let expectedDescription = "()throws->Void"

        #expect(functionTypeSyntax.description == expectedDescription)
    }

    @Test
    func toFunctionTypeSyntaxWithAsyncAndThrowsSpecifiers() {
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

        let functionTypeSyntax = sut.toFunctionTypeSyntax()
        let expectedDescription = "()asyncthrows->Void"

        #expect(functionTypeSyntax.description == expectedDescription)
    }

    @Test
    func toFunctionTypeSyntaxWithReturnValue() {
        let sut = SUT(
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {},
                returnClause: ReturnClauseSyntax(type: .bool)
            )
        )

        let functionTypeSyntax = sut.toFunctionTypeSyntax()
        let expectedDescription = "()->Bool"

        #expect(functionTypeSyntax.description == expectedDescription)
    }

    @Test
    func toFunctionTypeSyntaxWithoutReturnValue() {
        let sut = SUT(
            name: "sut",
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {}
            )
        )

        let functionTypeSyntax = sut.toFunctionTypeSyntax()
        let expectedDescription = "()->Void"

        #expect(functionTypeSyntax.description == expectedDescription)
    }
}
