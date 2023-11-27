//
//  FunctionDeclSyntax+Effects.swift
//  SwiftSyntaxSugar
//
//  Created by Gray Campbell on 11/4/23.
//

import SwiftSyntax

extension FunctionDeclSyntax {

    /// A boolean indicating if the function is asynchronous.
    public var isAsync: Bool {
        self.signature.effectSpecifiers?.asyncSpecifier != nil
    }

    /// A boolean indicating if the function is throwing.
    public var isThrowing: Bool {
        self.signature.effectSpecifiers?.throwsSpecifier != nil
    }

    /// The keywords needed to invoke the function (i.e. `try` and/or `await`).
    public var invocationKeywordTokens: [TokenSyntax] {
        var keywordTokens: [TokenSyntax] = []

        if self.isThrowing {
            keywordTokens.append(.keyword(.try))
        }

        if self.isAsync {
            keywordTokens.append(.keyword(.await))
        }

        return keywordTokens
    }
}
