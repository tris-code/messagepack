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

class InvalidCodeHeaderLengthTests: XCTestCase {

    func testStringHeader() {
        var deserializer = MPDeserializer(bytes: [0xff])
        XCTAssertThrowsError(try deserializer.readStringLength(code: deserializer.readCode()))
    }

    func testArrayHeader() {
        var deserializer = MPDeserializer(bytes: [0xff])
        XCTAssertThrowsError(try deserializer.readArrayLength(code: deserializer.readCode()))
    }

    func testMapHeader() {
        var deserializer = MPDeserializer(bytes: [0xff])
        XCTAssertThrowsError(try deserializer.readMapLength(code: deserializer.readCode()))
    }

    func testBinaryHeader() {
        var deserializer = MPDeserializer(bytes: [0xff])
        XCTAssertThrowsError(try deserializer.readBinaryLength(code: deserializer.readCode()))
    }

    func testExtendedHeader() {
        var deserializer = MPDeserializer(bytes: [0xff])
        XCTAssertThrowsError(try deserializer.readExtendedLength(code: deserializer.readCode()))
    }

    static var allTests : [(String, (InvalidCodeHeaderLengthTests) -> () throws -> Void)] {
        return [
            ("testStringHeader", testStringHeader),
            ("testArrayHeader", testArrayHeader),
            ("testMapHeader", testMapHeader),
            ("testBinaryHeader", testBinaryHeader),
            ("testExtendedHeader", testExtendedHeader),
        ]
    }
}
