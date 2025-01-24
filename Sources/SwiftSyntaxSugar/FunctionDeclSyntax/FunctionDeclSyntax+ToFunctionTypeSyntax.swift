//
//  FunctionDeclSyntax+ToFunctionTypeSyntax.swift
//
//  Created by Gray Campbell.
//  Copyright © 2025 Fetch.
//

public import SwiftSyntax

extension FunctionDeclSyntax {

    /// Returns the function declaration as a type.
    ///
    /// Given a `FunctionDeclSyntax` for the following function:
    /// ```swift
    /// public func user(id: String) async throws -> User
    /// ```
    /// converting the `FunctionDeclSyntax` to `FunctionTypeSyntax`:
    /// ```swift
    /// functionDeclaration.toFunctionTypeSyntax()
    /// ```
    /// would result in a `FunctionTypeSyntax` for the following type:
    /// ```swift
    /// (String) async throws -> User
    /// ```
    ///
    /// - Returns: The function declaration as a type.
    public func toFunctionTypeSyntax() -> FunctionTypeSyntax {
        FunctionTypeSyntax(
            parameters: TupleTypeElementListSyntax {
                for parameter in self.signature.parameterClause.parameters {
                    if let attributedType = parameter.type.as(AttributedTypeSyntax.self) {
                        TupleTypeElementSyntax(type: attributedType.baseType)
                    } else {
                        TupleTypeElementSyntax(type: parameter.type)
                    }
                }
            },
            effectSpecifiers: self.signature.effectSpecifiers.map {
                effectSpecifiers in
                TypeEffectSpecifiersSyntax(
                    asyncSpecifier: effectSpecifiers.asyncSpecifier,
                    throwsClause: effectSpecifiers.throwsClause
                )
            },
            returnClause: self.signature.returnClause
                ?? ReturnClauseSyntax(type: .void)
        )
    }
}
