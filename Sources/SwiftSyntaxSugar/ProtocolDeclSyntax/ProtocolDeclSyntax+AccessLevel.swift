//
//  ProtocolDeclSyntax+AccessLevel.swift
//  SwiftSyntaxSugar
//
//  Created by Gray Campbell on 11/4/23.
//

public import SwiftSyntax

extension ProtocolDeclSyntax {

    /// The protocol declaration's access level.
    public var accessLevel: AccessLevelSyntax {
        self.modifiers.accessLevel
    }

    /// The minimum access level required for types conforming to the protocol.
    public var minimumConformingAccessLevel: AccessLevelSyntax {
        let accessLevel = self.accessLevel

        return accessLevel == .private ? .fileprivate : accessLevel
    }
}
