//
//  AccessorBlockSyntax+Accessors.swift
//  SwiftSyntaxSugar
//
//  Created by Gray Campbell on 11/3/23.
//

import SwiftSyntax

extension AccessorBlockSyntax {

    // MARK: Accessors

    /// The accessor block's `get` accessor declaration, if there is one.
    public var getAccessorDeclaration: AccessorDeclSyntax? {
        guard case let .accessors(accessorDeclarations) = self.accessors else {
            return nil
        }

        return accessorDeclarations.first { accessorDeclaration in
            let getToken: TokenSyntax = .keyword(.get)
            let accessorSpecifier = accessorDeclaration.accessorSpecifier

            return accessorSpecifier.text == getToken.text
        }
    }

    /// The accessor block's `set` accessor declaration, if there is one.
    public var setAccessorDeclaration: AccessorDeclSyntax? {
        guard case let .accessors(accessorDeclarations) = self.accessors else {
            return nil
        }

        return accessorDeclarations.first { accessorDeclaration in
            let setToken: TokenSyntax = .keyword(.set)
            let accessorSpecifier = accessorDeclaration.accessorSpecifier

            return accessorSpecifier.text == setToken.text
        }
    }

    // MARK: Contains

    /// A boolean indicating if the accessor block contains a `get` accessor
    /// declaration.
    public var containsGetAccessor: Bool {
        self.getAccessorDeclaration != nil
    }

    /// A boolean indicating if the accessor block contains a `get throws`
    /// accessor declaration.
    public var containsThrowingGetAccessor: Bool {
        guard let getAccessorDeclaration = self.getAccessorDeclaration else {
            return false
        }

        return getAccessorDeclaration.effectSpecifiers?.throwsSpecifier != nil
    }

    /// A boolean indicating if the accessor block contains a `set` accessor
    /// declaration.
    public var containsSetAccessor: Bool {
        self.setAccessorDeclaration != nil
    }
}
