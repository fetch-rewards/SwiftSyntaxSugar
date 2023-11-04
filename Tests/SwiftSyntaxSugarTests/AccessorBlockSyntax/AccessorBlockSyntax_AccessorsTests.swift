//
//  AccessorBlockSyntax_AccessorsTests.swift
//  SwiftSyntaxSugarTests
//
//  Created by Gray Campbell on 11/3/23.
//

import SwiftSyntax
import SwiftSyntaxBuilder
import XCTest

@testable import SwiftSyntaxSugar

final class AccessorBlockSyntax_AccessorsTests: XCTestCase {

    // MARK: Typealiases

    typealias SUT = AccessorBlockSyntax

    // MARK: Get Accessor Declaration Tests

    func testGetAccessorDeclarationForAccessorsWithGetAccessor() {
        let accessor = AccessorDeclSyntax(accessorSpecifier: .keyword(.get))
        let accessors = AccessorDeclListSyntax { accessor }
        let sut = SUT(accessors: .accessors(accessors))

        XCTAssertNotNil(sut.getAccessorDeclaration)
    }

    func testGetAccessorDeclarationForAccessorsWithoutGetAccessor() {
        let accessor = AccessorDeclSyntax(accessorSpecifier: .keyword(.set))
        let accessors = AccessorDeclListSyntax { accessor }
        let sut = SUT(accessors: .accessors(accessors))

        XCTAssertNil(sut.getAccessorDeclaration)
    }

    func testGetAccessorDeclarationForGetter() {
        let sut = SUT(accessors: .getter(CodeBlockItemListSyntax()))

        XCTAssertNil(sut.getAccessorDeclaration)
    }

    // MARK: Set Accessor Declaration Tests

    func testSetAccessorDeclarationForAccessorsWithSetAccessor() {
        let accessor = AccessorDeclSyntax(accessorSpecifier: .keyword(.set))
        let accessors = AccessorDeclListSyntax { accessor }
        let sut = SUT(accessors: .accessors(accessors))

        XCTAssertNotNil(sut.setAccessorDeclaration)
    }

    func testSetAccessorDeclarationForAccessorsWithoutSetAccessor() {
        let accessor = AccessorDeclSyntax(accessorSpecifier: .keyword(.get))
        let accessors = AccessorDeclListSyntax { accessor }
        let sut = SUT(accessors: .accessors(accessors))

        XCTAssertNil(sut.setAccessorDeclaration)
    }

    func testSetAccessorDeclarationForGetter() {
        let sut = SUT(accessors: .getter(CodeBlockItemListSyntax()))

        XCTAssertNil(sut.setAccessorDeclaration)
    }

    // MARK: Contains Get Accessor Tests

    func testContainsGetAccessorForAccessorsWithGetAccessor() {
        let accessor = AccessorDeclSyntax(accessorSpecifier: .keyword(.get))
        let accessors = AccessorDeclListSyntax { accessor }
        let sut = SUT(accessors: .accessors(accessors))

        XCTAssertTrue(sut.containsGetAccessor)
    }

    func testContainsGetAccessorForAccessorsWithoutGetAccessor() {
        let accessor = AccessorDeclSyntax(accessorSpecifier: .keyword(.set))
        let accessors = AccessorDeclListSyntax { accessor }
        let sut = SUT(accessors: .accessors(accessors))

        XCTAssertFalse(sut.containsGetAccessor)
    }

    func testContainsGetAccessorForGetter() {
        let sut = SUT(accessors: .getter(CodeBlockItemListSyntax()))

        XCTAssertFalse(sut.containsGetAccessor)
    }

    // MARK: Contains Throwing Get Accessor Tests

    func testContainsThrowingGetAccessorForAccessorsWithThrowingGetAccessor() {
        let accessor = AccessorDeclSyntax(
            accessorSpecifier: .keyword(.get),
            effectSpecifiers: AccessorEffectSpecifiersSyntax(
                throwsSpecifier: .keyword(.throws)
            )
        )
        let accessors = AccessorDeclListSyntax { accessor }
        let sut = SUT(accessors: .accessors(accessors))

        XCTAssertTrue(sut.containsThrowingGetAccessor)
    }

    func testContainsThrowingGetAccessorForAccessorsWithNonThrowingGetAccessor()
    {
        let accessor = AccessorDeclSyntax(accessorSpecifier: .keyword(.get))
        let accessors = AccessorDeclListSyntax { accessor }
        let sut = SUT(accessors: .accessors(accessors))

        XCTAssertFalse(sut.containsThrowingGetAccessor)
    }

    func testContainsThrowingGetAccessorForAccessorsWithoutGetAccessor() {
        let accessor = AccessorDeclSyntax(accessorSpecifier: .keyword(.set))
        let accessors = AccessorDeclListSyntax { accessor }
        let sut = SUT(accessors: .accessors(accessors))

        XCTAssertFalse(sut.containsThrowingGetAccessor)
    }

    func testContainsThrowingGetAccessorForGetter() {
        let sut = SUT(accessors: .getter(CodeBlockItemListSyntax()))

        XCTAssertFalse(sut.containsThrowingGetAccessor)
    }

    // MARK: Contains Set Accessor Tests

    func testContainsSetAccessorForAccessorsWithSetAccessor() {
        let accessor = AccessorDeclSyntax(accessorSpecifier: .keyword(.set))
        let accessors = AccessorDeclListSyntax { accessor }
        let sut = SUT(accessors: .accessors(accessors))

        XCTAssertTrue(sut.containsSetAccessor)
    }

    func testContainsSetAccessorForAccessorsWithoutSetAccessor() {
        let accessor = AccessorDeclSyntax(accessorSpecifier: .keyword(.get))
        let accessors = AccessorDeclListSyntax { accessor }
        let sut = SUT(accessors: .accessors(accessors))

        XCTAssertFalse(sut.containsSetAccessor)
    }

    func testContainsSetAccessorForGetter() {
        let sut = SUT(accessors: .getter(CodeBlockItemListSyntax()))

        XCTAssertFalse(sut.containsSetAccessor)
    }
}
