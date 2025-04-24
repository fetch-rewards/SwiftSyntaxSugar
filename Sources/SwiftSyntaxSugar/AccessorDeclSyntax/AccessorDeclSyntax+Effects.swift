//
//  AccessorDeclSyntax+Effects.swift
//
//  Copyright © 2025 Fetch.
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
}
