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

class ArrayTests: XCTestCase {
    func testSerializerFixArray() {
        let expected: [UInt8] = [0x93, 0x01, 0x02, 0x03]
        let packed = MessagePack.serialize(.array([.int(1), .int(2), .int(3)]))
        XCTAssertEqual(packed, expected)
    }

    func testDeserializerFixarray() {
        let expected = MessagePack.array([.int(1), .int(2), .int(3)])
        let unpacked = try? MessagePack.deserialize(bytes: [0x93, 0x01, 0x02, 0x03])
        XCTAssertEqual(unpacked, expected)
    }

    func testSerializerArray16() {
        let expected = [0xdc, 0xff, 0xff] + [UInt8](repeating: 0xc0, count: Int(UInt16.max))
        let packed = MessagePack.serialize(.array([MessagePack](repeating: nil, count: Int(UInt16.max))))
        XCTAssertEqual(packed, expected)
    }

    func testDeserializerArray16() {
        let expected = MessagePack.array([MessagePack](repeating: nil, count: Int(UInt16.max)))
        let unpacked = try? MessagePack.deserialize(bytes: [0xdc, 0xff, 0xff] + [UInt8](repeating: 0xc0, count: Int(UInt16.max)))
        XCTAssertEqual(unpacked, expected)
    }

    func testSerializerArray32() {
        let expected = [0xdd, 0x00, 0x01, 0x00, 0x00] + [UInt8](repeating: 0xc0, count: Int(UInt16.max)+1)
        let packed = MessagePack.serialize(.array([MessagePack](repeating: nil, count: Int(UInt16.max)+1)))
        XCTAssertEqual(packed, expected)
    }

    func testDeserializerArray32() {
        let expected = MessagePack.array([MessagePack](repeating: nil, count: Int(UInt16.max)+1))
        let unpacked = try? MessagePack.deserialize(bytes: [0xdd, 0x00, 0x01, 0x00, 0x00] + [UInt8](repeating: 0xc0, count: Int(UInt16.max)+1))
        XCTAssertEqual(unpacked, expected)
    }

    func testEmptyArray() {
        let arrayArray: [[UInt8]] = [
            [0x90],
            [0xdc, 0x00, 0x00],
            [0xdd, 0x00, 0x00, 0x00, 0x00]
        ]
        for bytes in arrayArray {
            if let empty = try? MessagePack.deserialize(bytes: bytes) {
                XCTAssertEqual(empty.array!, [])
            } else {
                XCTFail("deserialize failed")
            }
        }
    }

    static var allTests : [(String, (ArrayTests) -> () throws -> Void)] {
        return [
            ("testSerializerFixArray", testSerializerFixArray),
            ("testDeserializerFixarray", testDeserializerFixarray),
            ("testSerializerArray16", testSerializerArray16),
            ("testDeserializerArray16", testDeserializerArray16),
            ("testSerializerArray32", testSerializerArray32),
            ("testDeserializerArray32", testDeserializerArray32),
            ("testEmptyArray", testEmptyArray),
        ]
    }
}
