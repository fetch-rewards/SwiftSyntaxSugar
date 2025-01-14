//
//  AccessorBlockSyntax+Accessors.swift
//
//  Created by Gray Campbell.
//  Copyright © 2025 Fetch.
//

public import SwiftSyntax

extension AccessorBlockSyntax {

    // MARK: Accessors

    /// The accessor block's `get` accessor declaration, if there is one.
    public var getAccessorDeclaration: AccessorDeclSyntax? {
        guard case let .accessors(accessorDeclarations) = self.accessors else {
            return nil
        }

        return accessorDeclarations.first { accessorDeclaration in
            accessorDeclaration.accessorSpecifier.tokenKind == .keyword(.get)
        }
    }

    /// The accessor block's `set` accessor declaration, if there is one.
    public var setAccessorDeclaration: AccessorDeclSyntax? {
        guard case let .accessors(accessorDeclarations) = self.accessors else {
            return nil
        }

        return accessorDeclarations.first { accessorDeclaration in
            accessorDeclaration.accessorSpecifier.tokenKind == .keyword(.set)
        }
    }

    // MARK: Contains

    /// A boolean indicating if the accessor block contains a `get` accessor
    /// declaration.
    public var containsGetAccessor: Bool {
        self.getAccessorDeclaration != nil
    }

    /// A boolean indicating if the accessor block contains a `set` accessor
    /// declaration.
    public var containsSetAccessor: Bool {
        self.setAccessorDeclaration != nil
    }
}
