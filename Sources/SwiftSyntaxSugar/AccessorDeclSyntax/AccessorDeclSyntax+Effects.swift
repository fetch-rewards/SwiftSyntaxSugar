//
//  AccessorDeclSyntax+Effects.swift
//  SwiftSyntaxSugar
//
//  Created by Gray Campbell on 11/3/23.
//

import SwiftSyntax

extension AccessorDeclSyntax {

    /// A boolean indicating if the accessor is asynchronous.
    public var isAsync: Bool {
        self.effectSpecifiers?.asyncSpecifier != nil
    }

    /// A boolean indicating if the accessor is throwing.
    public var isThrowing: Bool {
        self.effectSpecifiers?.throwsSpecifier != nil
    }

    /// The keywords needed to invoke the accessor (i.e. `try` and/or `await`).
    public var invocationKeywordTokens: [TokenSyntax]? {
        var keywordTokens: [TokenSyntax] = []

        if self.isThrowing {
            keywordTokens.append(.keyword(.try))
        }

        if self.isAsync {
            keywordTokens.append(.keyword(.await))
        }

        return keywordTokens.isEmpty ? nil : keywordTokens
    }
}
