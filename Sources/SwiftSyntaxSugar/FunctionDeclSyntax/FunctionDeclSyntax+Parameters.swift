//
//  FunctionDeclSyntax+Parameters.swift
//  SwiftSyntaxSugar
//
//  Created by Gray Campbell on 11/4/23.
//

public import SwiftSyntax

extension FunctionDeclSyntax {

    /// The names of the function declaration's parameters as they would be
    /// referenced inside the body of the function.
    ///
    /// Given a `FunctionDeclSyntax` for the following function:
    /// ```swift
    /// func increase(by increment: Int, limit: Int)
    /// ```
    /// the parameter variable names would be `increment` and `limit`.
    public var parameterVariableNames: [TokenSyntax] {
        self.signature.parameterClause.parameters.map { parameter in
            parameter.secondName ?? parameter.firstName
        }
    }
}
