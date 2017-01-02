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

class BinaryTests: XCTestCase {
    func testSerializerBin8() {
        let raw = [UInt8](repeating: 0x45, count: Int(UInt8.max))
        let expected = [0xc4, 0xff] + raw
        let packed = MessagePack.serialize(.binary(raw))
        XCTAssertEqual(packed, expected)

    }

    func testDeserializerBin8() {
        let raw = [UInt8](repeating: 0x45, count: Int(UInt8.max))
        let expected = MessagePack.binary(raw)
        let unpacked = try? MessagePack.deserialize(bytes: [0xc4, 0xff] + raw)
        XCTAssertEqual(unpacked, expected)
    }

    func testSerializerBin16() {
        let raw = [UInt8](repeating: 0x45, count: Int(UInt16.max))
        let expected = [0xc5, 0xff, 0xff] + raw
        let packed = MessagePack.serialize(.binary(raw))
        XCTAssertEqual(packed, expected)
    }

    func testDeserializerBin16() {
        let raw = [UInt8](repeating: 0x45, count: Int(UInt16.max))
        let expected = MessagePack.binary(raw)
        let unpacked = try? MessagePack.deserialize(bytes: [0xc5, 0xff, 0xff] + raw)
        XCTAssertEqual(unpacked, expected)
    }

    func testSerializerBin32() {
        let raw = [UInt8](repeating: 0x45, count: Int(UInt16.max)+1)
        let expected = [0xc6, 0x00, 0x01, 0x00, 0x00] + raw
        let packed = MessagePack.serialize(.binary(raw))
        XCTAssertEqual(packed, expected)
    }

    func testDeserializerBin32() {
        let raw = [UInt8](repeating: 0x45, count: Int(UInt16.max)+1)
        let expected = MessagePack.binary(raw)
        let unpacked = try? MessagePack.deserialize(bytes: [0xc6, 0x00, 0x01, 0x00, 0x00] + raw)
        XCTAssertEqual(unpacked, expected)
    }

    func testEmptyBinary() {
        let binArray: [[UInt8]] = [
            [0xc4, 0x00],
            [0xc5, 0x00, 0x00],
            [0xc6, 0x00, 0x00, 0x00, 0x00],
        ]
        for bytes in binArray {
            if let empty = try? MessagePack.deserialize(bytes: bytes) {
                XCTAssertEqual(empty.binary!, [])
            } else {
                XCTFail("deserialize failed")
            }
        }
    }

    static var allTests : [(String, (BinaryTests) -> () throws -> Void)] {
        return [
            ("testSerializerBin8", testSerializerBin8),
            ("testDeserializerBin8", testDeserializerBin8),
            ("testSerializerBin16", testSerializerBin16),
            ("testDeserializerBin16", testDeserializerBin16),
            ("testSerializerBin32", testSerializerBin32),
            ("testDeserializerBin32", testDeserializerBin32),
            ("testEmptyBinary", testEmptyBinary),
        ]
    }
}
