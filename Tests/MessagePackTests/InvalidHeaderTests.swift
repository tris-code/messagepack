/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

import XCTest
@testable import MessagePack

class InvalidHeaderTests: XCTestCase {
    func testStringHeader() {
        var decoder = Decoder(bytes: [0xff])
        XCTAssertThrowsError(try decoder.readStringHeader(code: decoder.readCode()))
    }

    func testArrayHeader() {
        var decoder = Decoder(bytes: [0xff])
        XCTAssertThrowsError(try decoder.readArrayHeader(code: decoder.readCode()))
    }

    func testMapHeader() {
        var decoder = Decoder(bytes: [0xff])
        XCTAssertThrowsError(try decoder.readMapHeader(code: decoder.readCode()))
    }

    func testBinaryHeader() {
        var decoder = Decoder(bytes: [0xff])
        XCTAssertThrowsError(try decoder.readBinaryHeader(code: decoder.readCode()))
    }

    func testExtendedHeader() {
        var decoder = Decoder(bytes: [0xff])
        XCTAssertThrowsError(try decoder.readExtendedHeader(code: decoder.readCode()))
    }

    static var allTests : [(String, (InvalidHeaderTests) -> () throws -> Void)] {
        return [
            ("testStringHeader", testStringHeader),
            ("testArrayHeader", testArrayHeader),
            ("testMapHeader", testMapHeader),
            ("testBinaryHeader", testBinaryHeader),
            ("testExtendedHeader", testExtendedHeader),
        ]
    }
}
