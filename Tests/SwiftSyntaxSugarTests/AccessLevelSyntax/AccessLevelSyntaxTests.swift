//
//  AccessLevelSyntaxTests.swift
//  SwiftSyntaxSugarTests
//
//  Created by Gray Campbell on 11/3/23.
//

import SwiftSyntax
import Testing
@testable import SwiftSyntaxSugar

struct AccessLevelSyntaxTests {

    // MARK: Typealiases

    typealias SUT = AccessLevelSyntax

    // MARK: Property Tests

    @Test(arguments: SUT.allCases)
    func rawValue(sut: SUT) {
        let expectedRawValue = switch sut {
        case .fileprivate: "fileprivate"
        case .internal: "internal"
        case .open: "open"
        case .package: "package"
        case .private: "private"
        case .public: "public"
        }

        #expect(sut.rawValue == expectedRawValue)
    }

    @Test(arguments: SUT.allCases)
    func keyword(sut: SUT) {
        let expectedKeyword: Keyword = switch sut {
        case .fileprivate: .fileprivate
        case .internal: .internal
        case .open: .open
        case .package: .package
        case .private: .private
        case .public: .public
        }

        #expect(sut.keyword == expectedKeyword)
    }

    @Test(arguments: SUT.allCases)
    func token(sut: SUT) {
        let expectedTokenKind: TokenKind = switch sut {
        case .fileprivate: .keyword(.fileprivate)
        case .internal: .keyword(.internal)
        case .open: .keyword(.open)
        case .package: .keyword(.package)
        case .private: .keyword(.private)
        case .public: .keyword(.public)
        }

        #expect(sut.token.tokenKind == expectedTokenKind)
    }

    @Test(arguments: SUT.allCases)
    func modifier(sut: SUT) {
        let expectedModifierTokenKind: TokenKind = switch sut {
        case .fileprivate: .keyword(.fileprivate)
        case .internal: .keyword(.internal)
        case .open: .keyword(.open)
        case .package: .keyword(.package)
        case .private: .keyword(.private)
        case .public: .keyword(.public)
        }

        #expect(sut.modifier.name.tokenKind == expectedModifierTokenKind)
    }

    // MARK: Raw Value Initializer Tests

    @Test(arguments: SUT.allCases)
    func initWithRawValueWithValidRawValue(from sut: SUT) {
        #expect(SUT(rawValue: sut.rawValue) == sut)
    }

    @Test
    func initWithRawValueWithInvalidRawValue() {
        let sut = SUT(rawValue: "sut")

        #expect(sut == nil)
    }

    // MARK: Token Initializer Tests

    @Test(arguments: SUT.allCases)
    func initWithTokenWithValidToken(from sut: SUT) {
        #expect(SUT(token: sut.token) == sut)
    }

    @Test
    func initWithTokenWithInvalidToken() {
        let sut = SUT(token: "sut")

        #expect(sut == nil)
    }

    // MARK: Modifier Initializer Tests

    @Test(arguments: SUT.allCases)
    func initWithModifierWithValidModifier(from sut: SUT) {
        #expect(SUT(modifier: sut.modifier) == sut)
    }

    @Test
    func initWithModifierWithInvalidModifier() {
        let sut = SUT(modifier: DeclModifierSyntax(name: .keyword(.static)))

        #expect(sut == nil)
    }
}
