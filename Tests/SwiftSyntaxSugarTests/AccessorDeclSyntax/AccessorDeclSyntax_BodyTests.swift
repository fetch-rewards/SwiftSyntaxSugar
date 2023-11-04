//
//  AccessorDeclSyntax_BodyTests.swift
//  SwiftSyntaxSugarTests
//
//  Created by Gray Campbell on 11/4/23.
//

import SwiftSyntax
import XCTest

@testable import SwiftSyntaxSugar

final class AccessorDeclSyntax_BodyTests: XCTestCase {

    // MARK: Typealiases

    typealias SUT = AccessorDeclSyntax

    // MARK: With Body Tests

    func testWithBody() {
        let sut = SUT(accessorSpecifier: .keyword(.get))
            .withBody(body: CodeBlockSyntax {})

        XCTAssertNotNil(sut.body)
    }

    func testWithBodyBuilder() throws {
        let sut = try SUT(accessorSpecifier: .keyword(.get))
            .withBody {}

        XCTAssertNotNil(sut.body)
    }
}
