//
//  MemberBlockSyntax+MemberDeclarations.swift
//
//  Copyright © 2025 Fetch.
//

public import SwiftSyntax

extension MemberBlockSyntax {

    /// Returns the member declarations of the provided `type` that are
    /// contained in the member block.
    ///
    /// - Parameter type: The type of member declarations to return.
    /// - Returns: The member declarations of the provided `type` that are
    ///   contained in the member block.
    public func memberDeclarations<Syntax: DeclSyntaxProtocol>(
        ofType type: Syntax.Type
    ) -> [Syntax] {
        self.members.compactMap { member in
            member.decl.as(type)
        }
    }
}
