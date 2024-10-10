//
//  ProtocolDeclSyntax+Type.swift
//  SwiftSyntaxSugar
//
//  Created by Gray Campbell on 11/4/23.
//

public import SwiftSyntax

extension ProtocolDeclSyntax {

    /// The protocol as a type.
    public var type: TypeSyntax {
        TypeSyntax(stringLiteral: self.name.text)
    }
}
