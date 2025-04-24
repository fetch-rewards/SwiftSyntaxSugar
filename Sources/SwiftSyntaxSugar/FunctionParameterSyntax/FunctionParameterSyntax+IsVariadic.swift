//
//  FunctionParameterSyntax+IsVariadic.swift
//
//  Copyright © 2025 Fetch.
//

public import SwiftSyntax

extension FunctionParameterSyntax {

    /// A Boolean value indicating whether the parameter is a variadic
    /// parameter.
    public var isVariadic: Bool {
        self.ellipsis != nil
    }
}
