//
//  AccessorDeclSyntax+Effects.swift
//
//  Created by Gray Campbell.
//  Copyright © 2024 Fetch.
//

public import SwiftSyntax

extension AccessorDeclSyntax {

    /// A boolean indicating if the accessor is asynchronous.
    public var isAsync: Bool {
        self.effectSpecifiers?.asyncSpecifier != nil
    }

    /// A boolean indicating if the accessor is throwing.
    public var isThrowing: Bool {
        self.effectSpecifiers?.throwsClause != nil
    }

    /// The keywords needed to invoke the accessor (i.e. `try` and/or `await`).
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
