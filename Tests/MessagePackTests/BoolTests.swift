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
import MessagePack

class BoolTests: XCTestCase {
    func testSerializerBoolFalse() {
        let expected: [UInt8] = [0xc2]
        let packed = MessagePack.serialize(.bool(false))
        XCTAssertEqual(packed, expected)
    }

    func testDeserializerBoolFalse() {
        let expected = MessagePack.bool(false)
        let unpacked = try? MessagePack.deserialize(bytes: [0xc2])
        XCTAssertEqual(unpacked, expected)
    }

    func testSerializerBoolTrue() {
        let expected: [UInt8] = [0xc3]
        let packed = MessagePack.serialize(.bool(true))
        XCTAssertEqual(packed, expected)
    }

    func testDeserializerBoolTrue() {
        let expected = MessagePack.bool(true)
        let unpacked = try? MessagePack.deserialize(bytes: [0xc3])
        XCTAssertEqual(unpacked, expected)
    }

    static var allTests : [(String, (BoolTests) -> () throws -> Void)] {
        return [
            ("testSerializerBoolFalse", testSerializerBoolFalse),
            ("testDeserializerBoolFalse", testDeserializerBoolFalse),
            ("testSerializerBoolTrue", testSerializerBoolTrue),
            ("testDeserializerBoolTrue", testDeserializerBoolTrue)
        ]
    }
}
