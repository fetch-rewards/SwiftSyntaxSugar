//
//  FunctionParameterSyntax+IsVariadic.swift
//  SwiftSyntaxSugar
//
//  Created by Gray Campbell on 12/3/24.
//

public import SwiftSyntax

extension FunctionParameterSyntax {

    /// A Boolean value indicating whether the parameter is a variadic
    /// parameter.
    public var isVariadic: Bool {
        self.ellipsis != nil
    }
}
