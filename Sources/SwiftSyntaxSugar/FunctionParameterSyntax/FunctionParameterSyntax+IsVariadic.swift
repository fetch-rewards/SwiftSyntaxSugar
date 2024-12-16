//
//  FunctionParameterSyntax+IsVariadic.swift
//
//  Created by Gray Campbell.
//  Copyright © 2024 Fetch.
//

public import SwiftSyntax

extension FunctionParameterSyntax {

    /// A Boolean value indicating whether the parameter is a variadic
    /// parameter.
    public var isVariadic: Bool {
        self.ellipsis != nil
    }
}
