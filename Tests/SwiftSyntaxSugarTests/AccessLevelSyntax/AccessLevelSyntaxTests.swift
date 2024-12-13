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
    func rawValues(sut: SUT) {
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
    func keywords(sut: SUT) {
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
    func tokens(sut: SUT) {
        let expectedTokenText = switch sut {
        case .fileprivate: "fileprivate"
        case .internal: "internal"
        case .open: "open"
        case .package: "package"
        case .private: "private"
        case .public: "public"
        }

        #expect(sut.token.text == expectedTokenText)
    }

    @Test(arguments: SUT.allCases)
    func modifiers(sut: SUT) {
        let expectedModifierNameText = switch sut {
        case .fileprivate: "fileprivate"
        case .internal: "internal"
        case .open: "open"
        case .package: "package"
        case .private: "private"
        case .public: "public"
        }

        #expect(sut.modifier.name.text == expectedModifierNameText)
    }

    // MARK: Raw Value Initializer Tests

    @Test(arguments: SUT.allCases)
    func initWithRawValueWithValidRawValues(sut: SUT) {
        #expect(SUT(rawValue: sut.rawValue) == sut)
    }

    @Test
    func initWithRawValueWithInvalidRawValues() {
        let sut = SUT(rawValue: "sut")

        #expect(sut == nil)
    }

    // MARK: Token Initializer Tests

    @Test(arguments: SUT.allCases)
    func initWithTokenWithValidTokens(sut: SUT) {
        #expect(SUT(token: sut.token) == sut)
    }

    @Test
    func initWithTokenWithInvalidTokens() {
        let sut = SUT(token: "sut")

        #expect(sut == nil)
    }

    // MARK: Modifier Initializer Tests

    @Test(arguments: SUT.allCases)
    func initWithModifierWithValidModifiers(sut: SUT) {
        #expect(SUT(modifier: sut.modifier) == sut)
    }

    @Test
    func initWithModifierWithInvalidModifiers() {
        let sut = SUT(modifier: DeclModifierSyntax(name: .keyword(.static)))

        #expect(sut == nil)
    }
}
