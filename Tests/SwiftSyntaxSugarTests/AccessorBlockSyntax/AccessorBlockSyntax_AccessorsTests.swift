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

    func testGetAccessorDeclarationWithAccessorsWithGetAccessor() {
        let accessor = AccessorDeclSyntax(accessorSpecifier: .keyword(.get))
        let accessors = AccessorDeclListSyntax { accessor }
        let sut = SUT(accessors: .accessors(accessors))

        XCTAssertNotNil(sut.getAccessorDeclaration)
    }

    func testGetAccessorDeclarationWithAccessorsWithoutGetAccessor() {
        let accessor = AccessorDeclSyntax(accessorSpecifier: .keyword(.set))
        let accessors = AccessorDeclListSyntax { accessor }
        let sut = SUT(accessors: .accessors(accessors))

        XCTAssertNil(sut.getAccessorDeclaration)
    }

    func testGetAccessorDeclarationWithGetter() {
        let sut = SUT(accessors: .getter(CodeBlockItemListSyntax()))

        XCTAssertNil(sut.getAccessorDeclaration)
    }

    // MARK: Set Accessor Declaration Tests

    func testSetAccessorDeclarationWithAccessorsWithSetAccessor() {
        let accessor = AccessorDeclSyntax(accessorSpecifier: .keyword(.set))
        let accessors = AccessorDeclListSyntax { accessor }
        let sut = SUT(accessors: .accessors(accessors))

        XCTAssertNotNil(sut.setAccessorDeclaration)
    }

    func testSetAccessorDeclarationWithAccessorsWithoutSetAccessor() {
        let accessor = AccessorDeclSyntax(accessorSpecifier: .keyword(.get))
        let accessors = AccessorDeclListSyntax { accessor }
        let sut = SUT(accessors: .accessors(accessors))

        XCTAssertNil(sut.setAccessorDeclaration)
    }

    func testSetAccessorDeclarationWithGetter() {
        let sut = SUT(accessors: .getter(CodeBlockItemListSyntax()))

        XCTAssertNil(sut.setAccessorDeclaration)
    }

    // MARK: Contains Get Accessor Tests

    func testContainsGetAccessorWithAccessorsWithGetAccessor() {
        let accessor = AccessorDeclSyntax(accessorSpecifier: .keyword(.get))
        let accessors = AccessorDeclListSyntax { accessor }
        let sut = SUT(accessors: .accessors(accessors))

        XCTAssertTrue(sut.containsGetAccessor)
    }

    func testContainsGetAccessorWithAccessorsWithoutGetAccessor() {
        let accessor = AccessorDeclSyntax(accessorSpecifier: .keyword(.set))
        let accessors = AccessorDeclListSyntax { accessor }
        let sut = SUT(accessors: .accessors(accessors))

        XCTAssertFalse(sut.containsGetAccessor)
    }

    func testContainsGetAccessorWithGetter() {
        let sut = SUT(accessors: .getter(CodeBlockItemListSyntax()))

        XCTAssertFalse(sut.containsGetAccessor)
    }

    // MARK: Contains Throwing Get Accessor Tests

    func testContainsThrowingGetAccessorWithAccessorsWithThrowingGetAccessor() {
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

    func
        testContainsThrowingGetAccessorWithAccessorsWithNonThrowingGetAccessor()
    {
        let accessor = AccessorDeclSyntax(accessorSpecifier: .keyword(.get))
        let accessors = AccessorDeclListSyntax { accessor }
        let sut = SUT(accessors: .accessors(accessors))

        XCTAssertFalse(sut.containsThrowingGetAccessor)
    }

    func testContainsThrowingGetAccessorWithAccessorsWithoutGetAccessor() {
        let accessor = AccessorDeclSyntax(accessorSpecifier: .keyword(.set))
        let accessors = AccessorDeclListSyntax { accessor }
        let sut = SUT(accessors: .accessors(accessors))

        XCTAssertFalse(sut.containsThrowingGetAccessor)
    }

    func testContainsThrowingGetAccessorWithGetter() {
        let sut = SUT(accessors: .getter(CodeBlockItemListSyntax()))

        XCTAssertFalse(sut.containsThrowingGetAccessor)
    }

    // MARK: Contains Set Accessor Tests

    func testContainsSetAccessorWithAccessorsWithSetAccessor() {
        let accessor = AccessorDeclSyntax(accessorSpecifier: .keyword(.set))
        let accessors = AccessorDeclListSyntax { accessor }
        let sut = SUT(accessors: .accessors(accessors))

        XCTAssertTrue(sut.containsSetAccessor)
    }

    func testContainsSetAccessorWithAccessorsWithoutSetAccessor() {
        let accessor = AccessorDeclSyntax(accessorSpecifier: .keyword(.get))
        let accessors = AccessorDeclListSyntax { accessor }
        let sut = SUT(accessors: .accessors(accessors))

        XCTAssertFalse(sut.containsSetAccessor)
    }

    func testContainsSetAccessorWithGetter() {
        let sut = SUT(accessors: .getter(CodeBlockItemListSyntax()))

        XCTAssertFalse(sut.containsSetAccessor)
    }
}
