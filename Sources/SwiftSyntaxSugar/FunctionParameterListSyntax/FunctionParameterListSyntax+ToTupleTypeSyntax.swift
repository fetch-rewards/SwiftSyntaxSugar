//
//  FunctionParameterListSyntax+ToTupleTypeSyntax.swift
//  SwiftSyntaxSugar
//
//  Created by Gray Campbell on 11/4/23.
//

import SwiftSyntax
import SwiftSyntaxBuilder

extension FunctionParameterListSyntax {

    /// Returns the function parameter list as a tuple.
    ///
    /// Given a `FunctionParameterListSyntax` for the following single-parameter
    /// function:
    /// ```swift
    /// public func user(id: String) async throws -> User
    /// ```
    /// converting the `FunctionParameterListSyntax` to `TupleTypeSyntax`:
    /// ```swift
    /// parameterList.toTupleTypeSyntax()
    /// ```
    /// would result in a `TupleTypeSyntax` for the following type:
    /// ```swift
    /// (String)
    /// ```
    ///
    /// And given a `FunctionParameterListSyntax` for the following
    /// multi-parameter function:
    /// ```swift
    /// public func user(named name: String, age: Int) -> User
    /// ```
    /// converting the `FunctionParameterListSyntax` to `TupleTypeSyntax`:
    /// ```swift
    /// parameterList.toTupleTypeSyntax()
    /// ```
    /// would result in a `TupleTypeSyntax` for the following type:
    /// ```swift
    /// (name: String, age: Int)
    /// ```
    ///
    /// - Returns: The function parameter list as a tuple.
    func toTupleTypeSyntax() -> TupleTypeSyntax? {
        guard !self.isEmpty else {
            return nil
        }

        return TupleTypeSyntax(
            elements: TupleTypeElementListSyntax {
                for parameter in self {
                    let attributedType = parameter.type.as(
                        AttributedTypeSyntax.self
                    )
                    let type = attributedType?.baseType ?? parameter.type

                    if self.count == 1 {
                        TupleTypeElementSyntax(type: type)
                    } else {
                        let name = parameter.secondName ?? parameter.firstName

                        TupleTypeElementSyntax(
                            firstName: name,
                            colon: .colonToken(),
                            type: type
                        )
                    }
                }
            }
        )
    }
}
