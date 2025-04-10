//
//  FunctionDeclSyntax+Effects.swift
//
//  Created by Gray Campbell.
//  Copyright © 2025 Fetch.
//

public import SwiftSyntax

extension FunctionDeclSyntax {

    /// A boolean indicating if the function is asynchronous.
    public var isAsync: Bool {
        self.signature.effectSpecifiers?.asyncSpecifier != nil
    }

    /// A boolean indicating if the function is throwing.
    public var isThrowing: Bool {
        self.signature.effectSpecifiers?.throwsClause != nil
    }
}
