//
//  AccessLevelSyntax.swift
//  SwiftSyntaxSugar
//
//  Created by Gray Campbell on 11/3/23.
//

import SwiftSyntax

/// An access level.
public enum AccessLevelSyntax: String, CaseIterable, Hashable {

    // MARK: Cases

    /// The `fileprivate` access level.
    case `fileprivate`

    /// The `internal` access level.
    case `internal`

    /// The `open` access level.
    case `open`

    /// The `package` access level.
    case `package`

    /// The `private` access level.
    case `private`

    /// The `public` access level.
    case `public`

    // MARK: Properties

    /// The access level's raw value.
    public var rawValue: String {
        self.token.text
    }

    /// The access level as a keyword.
    public var keyword: Keyword {
        switch self {
        case .fileprivate: .fileprivate
        case .internal: .internal
        case .open: .open
        case .package: .package
        case .private: .private
        case .public: .public
        }
    }

    /// The access level as a token.
    public var token: TokenSyntax {
        .keyword(self.keyword)
    }

    /// The access level as a modifier.
    public var modifier: DeclModifierSyntax {
        DeclModifierSyntax(name: self.token)
    }

    // MARK: Initializers

    /// Creates an access level with the specified raw value.
    ///
    /// If there is no access level that corresponds to the specified raw value,
    /// this initializer returns `nil`.
    ///
    /// - Parameter rawValue: The access level's raw value.
    public init?(rawValue: String) {
        let accessLevel = Self.allCases.first { $0.rawValue == rawValue }

        guard let accessLevel else {
            return nil
        }

        self = accessLevel
    }
}

