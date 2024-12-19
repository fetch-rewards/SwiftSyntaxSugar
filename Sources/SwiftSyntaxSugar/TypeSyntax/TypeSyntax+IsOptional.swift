//
//  TypeSyntax+IsOptional.swift
//  SwiftSyntaxSugar
//
//  Created by Gray Campbell on 12/17/24.
//

public import SwiftSyntax

extension TypeSyntaxProtocol {
    public var isOptional: Bool {
        guard self.is(OptionalTypeSyntax.self) else {
            let identifierTypeSyntax = self.as(IdentifierTypeSyntax.self)
            let trimmedIdentifierName = identifierTypeSyntax?.name.trimmed

            return trimmedIdentifierName?.tokenKind == .identifier("Optional")
        }

        return true
    }
}
