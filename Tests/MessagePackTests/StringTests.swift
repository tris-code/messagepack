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

class StringTests: XCTestCase {
    func testEncodeFixStr() {
        let expected = [0xaa] + [UInt8](repeating: 0x20, count: 0x0a)
        let string = String(repeating: " ", count: 0x0a)
        let encoded = MessagePack.encode(.string(string))
        XCTAssertEqual(encoded, expected)
    }

    func testDecodeFixStr() {
        let expected = MessagePack.string(String(repeating: " ", count: 0x0a))
        let encoded = [0xaa] + [UInt8](repeating: 0x20, count: 0x0a)
        let decoded = try? MessagePack.decode(bytes: encoded)
        XCTAssertEqual(decoded, expected)
    }

    func testEncodeStr8() {
        let expected = [0xd9, 0xff] + [UInt8](repeating: 0x20, count: Int(UInt8.max))
        let string = String(repeating: " ", count: Int(UInt8.max))
        let encoded = MessagePack.encode(.string(string))
        XCTAssertEqual(encoded, expected)
    }

    func testDecodeStr8() {
        let expected = MessagePack.string(String(repeating: " ", count: Int(UInt8.max)))
        let encoded = [0xd9, 0xff] + [UInt8](repeating: 0x20, count: Int(UInt8.max))
        let decoded = try? MessagePack.decode(bytes: encoded)
        XCTAssertEqual(decoded, expected)
    }

    func testEncodeStr16() {
        let expected = [0xda, 0xff, 0xff] + [UInt8](repeating: 0x20, count: Int(UInt16.max))
        let string = String(repeating: " ", count: Int(UInt16.max))
        let encoded = MessagePack.encode(.string(string))
        XCTAssertEqual(encoded, expected)
    }

    func testDecodeStr16() {
        let expected = MessagePack.string(String(repeating: " ", count: Int(UInt16.max)))
        let encoded = [0xda, 0xff, 0xff] + [UInt8](repeating: 0x20, count: Int(UInt16.max))
        let decoded = try? MessagePack.decode(bytes: encoded)
        XCTAssertEqual(decoded, expected)
    }

    func testEncodeStr32() {
        let expected = [0xdb, 0x00, 0x01, 0x00, 0x00] + [UInt8](repeating: 0x20, count: Int(UInt16.max) + 1)
        let string = String(repeating: " ", count: Int(UInt16.max) + 1)
        let encoded = MessagePack.encode(.string(string))
        XCTAssertEqual(encoded, expected)
    }

    func testDecodeStr32() {
        let expected = MessagePack.string(String(repeating: " ", count: Int(UInt16.max) + 1))
        let encoded = [0xdb, 0x00, 0x01, 0x00, 0x00] + [UInt8](repeating: 0x20, count: Int(UInt16.max) + 1)
        let decoded = try? MessagePack.decode(bytes: encoded)
        XCTAssertEqual(decoded, expected)
    }

    static var allTests : [(String, (StringTests) -> () throws -> Void)] {
        return [
            ("testEncodeFixStr", testEncodeFixStr),
            ("testDecodeFixStr", testDecodeFixStr),
            ("testEncodeStr8", testEncodeStr8),
            ("testDecodeStr8", testDecodeStr8),
            ("testEncodeStr16", testEncodeStr16),
            ("testDecodeStr16", testDecodeStr16),
            ("testEncodeStr32", testEncodeStr32),
            ("testDecodeStr32", testDecodeStr32),
        ]
    }
}
