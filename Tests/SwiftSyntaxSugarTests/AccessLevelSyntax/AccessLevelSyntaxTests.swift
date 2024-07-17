//
//  AccessLevelSyntaxTests.swift
//  SwiftSyntaxSugarTests
//
//  Created by Gray Campbell on 11/3/23.
//

import SwiftSyntax
import XCTest
@testable import SwiftSyntaxSugar

final class AccessLevelSyntaxTests: XCTestCase {

    // MARK: Typealiases

    typealias SUT = AccessLevelSyntax

    // MARK: Property Tests

    func testRawValues() {
        for sut in SUT.allCases {
            let expectedRawValue = switch sut {
            case .fileprivate: "fileprivate"
            case .internal: "internal"
            case .open: "open"
            case .package: "package"
            case .private: "private"
            case .public: "public"
            }

            XCTAssertEqual(sut.rawValue, expectedRawValue)
        }
    }

    func testKeywords() {
        for sut in SUT.allCases {
            let expectedKeyword: Keyword = switch sut {
            case .fileprivate: .fileprivate
            case .internal: .internal
            case .open: .open
            case .package: .package
            case .private: .private
            case .public: .public
            }

            XCTAssertEqual(sut.keyword, expectedKeyword)
        }
    }

    func testTokens() {
        for sut in SUT.allCases {
            let expectedTokenText = switch sut {
            case .fileprivate: "fileprivate"
            case .internal: "internal"
            case .open: "open"
            case .package: "package"
            case .private: "private"
            case .public: "public"
            }

            XCTAssertEqual(sut.token.text, expectedTokenText)
        }
    }

    func testModifiers() {
        for sut in SUT.allCases {
            let expectedModifierNameText = switch sut {
            case .fileprivate: "fileprivate"
            case .internal: "internal"
            case .open: "open"
            case .package: "package"
            case .private: "private"
            case .public: "public"
            }

            XCTAssertEqual(sut.modifier.name.text, expectedModifierNameText)
        }
    }

    // MARK: Raw Value Initializer Tests

    func testInitWithRawValueWithValidRawValues() {
        for sut in SUT.allCases {
            XCTAssertEqual(SUT(rawValue: sut.rawValue), sut)
        }
    }

    func testInitWithRawValueWithInvalidRawValues() {
        let sut = SUT(rawValue: "sut")

        XCTAssertNil(sut)
    }

    // MARK: Token Initializer Tests

    func testInitWithTokenWithValidTokens() {
        for sut in SUT.allCases {
            XCTAssertEqual(SUT(token: sut.token), sut)
        }
    }

    func testInitWithTokenWithInvalidTokens() {
        let sut = SUT(token: "sut")

        XCTAssertNil(sut)
    }

    // MARK: Modifier Initializer Tests

    func testInitWithModifierWithValidModifiers() {
        for sut in SUT.allCases {
            XCTAssertEqual(SUT(modifier: sut.modifier), sut)
        }
    }

    func testInitWithModifierWithInvalidModifiers() {
        let sut = SUT(modifier: DeclModifierSyntax(name: .keyword(.static)))

        XCTAssertNil(sut)
    }
}
