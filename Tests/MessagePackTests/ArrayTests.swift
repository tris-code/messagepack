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
    func testEncodeFixArray() {
        let expected: [UInt8] = [0x93, 0x01, 0x02, 0x03]
        let encoded = MessagePack.encode(.array([.int(1), .int(2), .int(3)]))
        XCTAssertEqual(encoded, expected)
    }

    func testDecodeFixarray() {
        let expected = MessagePack.array([.int(1), .int(2), .int(3)])
        let decoded = try? MessagePack.decode(bytes: [0x93, 0x01, 0x02, 0x03])
        XCTAssertEqual(decoded, expected)
    }

    func testEncodeArray16() {
        let expected = [0xdc, 0xff, 0xff] + [UInt8](repeating: 0xc0, count: Int(UInt16.max))
        let encoded = MessagePack.encode(.array([MessagePack](repeating: nil, count: Int(UInt16.max))))
        XCTAssertEqual(encoded, expected)
    }

    func testDecodeArray16() {
        let expected = MessagePack.array([MessagePack](repeating: nil, count: Int(UInt16.max)))
        let decoded = try? MessagePack.decode(bytes: [0xdc, 0xff, 0xff] + [UInt8](repeating: 0xc0, count: Int(UInt16.max)))
        XCTAssertEqual(decoded, expected)
    }

    func testEncodeArray32() {
        let expected = [0xdd, 0x00, 0x01, 0x00, 0x00] + [UInt8](repeating: 0xc0, count: Int(UInt16.max)+1)
        let encoded = MessagePack.encode(.array([MessagePack](repeating: nil, count: Int(UInt16.max)+1)))
        XCTAssertEqual(encoded, expected)
    }

    func testDecodeArray32() {
        let expected = MessagePack.array([MessagePack](repeating: nil, count: Int(UInt16.max)+1))
        let decoded = try? MessagePack.decode(bytes: [0xdd, 0x00, 0x01, 0x00, 0x00] + [UInt8](repeating: 0xc0, count: Int(UInt16.max)+1))
        XCTAssertEqual(decoded, expected)
    }

    func testEmptyArray() {
        let arrayArray: [[UInt8]] = [
            [0x90],
            [0xdc, 0x00, 0x00],
            [0xdd, 0x00, 0x00, 0x00, 0x00]
        ]
        for bytes in arrayArray {
            if let empty = try? MessagePack.decode(bytes: bytes) {
                XCTAssertEqual(empty.array!, [])
            } else {
                XCTFail("deserialize failed")
            }
        }
    }

    static var allTests : [(String, (ArrayTests) -> () throws -> Void)] {
        return [
            ("testEncodeFixArray", testEncodeFixArray),
            ("testDecodeFixarray", testDecodeFixarray),
            ("testEncodeArray16", testEncodeArray16),
            ("testDecodeArray16", testDecodeArray16),
            ("testEncodeArray32", testEncodeArray32),
            ("testDecodeArray32", testDecodeArray32),
            ("testEmptyArray", testEmptyArray),
        ]
    }
}
