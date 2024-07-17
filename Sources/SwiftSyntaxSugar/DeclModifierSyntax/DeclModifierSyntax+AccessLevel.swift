//
//  DeclModifierSyntax+AccessLevel.swift
//  SwiftSyntaxSugar
//
//  Created by Gray Campbell on 11/4/23.
//

import SwiftSyntax

extension DeclModifierSyntax {

    /// A boolean indicating if the modifier is an access level modifier.
    public var isAccessLevel: Bool {
        AccessLevelSyntax.allCases.contains { accessLevel in
            self.name.tokenKind == accessLevel.tokenKind
        }
    }
}
