//
//  AccessorBlockSyntax_AccessorsTests.swift
//
//  Copyright © 2025 Fetch.
//

import SwiftSyntax
import SwiftSyntaxBuilder
import Testing
@testable import SwiftSyntaxSugar

struct AccessorBlockSyntax_AccessorsTests {

    // MARK: Typealiases

    typealias SUT = AccessorBlockSyntax

    // MARK: Get Accessor Declaration Tests

    @Test
    func getAccessorDeclarationWithAccessorsWithGetAccessor() {
        let accessor = AccessorDeclSyntax(accessorSpecifier: .keyword(.get))
        let accessors = AccessorDeclListSyntax { accessor }
        let sut = SUT(accessors: .accessors(accessors))

        #expect(sut.getAccessorDeclaration != nil)
    }

    @Test
    func getAccessorDeclarationWithAccessorsWithoutGetAccessor() {
        let accessor = AccessorDeclSyntax(accessorSpecifier: .keyword(.set))
        let accessors = AccessorDeclListSyntax { accessor }
        let sut = SUT(accessors: .accessors(accessors))

        #expect(sut.getAccessorDeclaration == nil)
    }

    @Test
    func getAccessorDeclarationWithGetter() {
        let sut = SUT(accessors: .getter(CodeBlockItemListSyntax()))

        #expect(sut.getAccessorDeclaration == nil)
    }

    // MARK: Set Accessor Declaration Tests

    @Test
    func setAccessorDeclarationWithAccessorsWithSetAccessor() {
        let accessor = AccessorDeclSyntax(accessorSpecifier: .keyword(.set))
        let accessors = AccessorDeclListSyntax { accessor }
        let sut = SUT(accessors: .accessors(accessors))

        #expect(sut.setAccessorDeclaration != nil)
    }

    @Test
    func setAccessorDeclarationWithAccessorsWithoutSetAccessor() {
        let accessor = AccessorDeclSyntax(accessorSpecifier: .keyword(.get))
        let accessors = AccessorDeclListSyntax { accessor }
        let sut = SUT(accessors: .accessors(accessors))

        #expect(sut.setAccessorDeclaration == nil)
    }

    @Test
    func setAccessorDeclarationWithGetter() {
        let sut = SUT(accessors: .getter(CodeBlockItemListSyntax()))

        #expect(sut.setAccessorDeclaration == nil)
    }

    // MARK: Contains Get Accessor Tests

    @Test
    func containsGetAccessorWithAccessorsWithGetAccessor() {
        let accessor = AccessorDeclSyntax(accessorSpecifier: .keyword(.get))
        let accessors = AccessorDeclListSyntax { accessor }
        let sut = SUT(accessors: .accessors(accessors))

        #expect(sut.containsGetAccessor)
    }

    @Test
    func containsGetAccessorWithAccessorsWithoutGetAccessor() {
        let accessor = AccessorDeclSyntax(accessorSpecifier: .keyword(.set))
        let accessors = AccessorDeclListSyntax { accessor }
        let sut = SUT(accessors: .accessors(accessors))

        #expect(!sut.containsGetAccessor)
    }

    @Test
    func containsGetAccessorWithGetter() {
        let sut = SUT(accessors: .getter(CodeBlockItemListSyntax()))

        #expect(!sut.containsGetAccessor)
    }

    // MARK: Contains Set Accessor Tests

    @Test
    func containsSetAccessorWithAccessorsWithSetAccessor() {
        let accessor = AccessorDeclSyntax(accessorSpecifier: .keyword(.set))
        let accessors = AccessorDeclListSyntax { accessor }
        let sut = SUT(accessors: .accessors(accessors))

        #expect(sut.containsSetAccessor)
    }

    @Test
    func containsSetAccessorWithAccessorsWithoutSetAccessor() {
        let accessor = AccessorDeclSyntax(accessorSpecifier: .keyword(.get))
        let accessors = AccessorDeclListSyntax { accessor }
        let sut = SUT(accessors: .accessors(accessors))

        #expect(!sut.containsSetAccessor)
    }

    @Test
    func containsSetAccessorWithGetter() {
        let sut = SUT(accessors: .getter(CodeBlockItemListSyntax()))

        #expect(!sut.containsSetAccessor)
    }
}
