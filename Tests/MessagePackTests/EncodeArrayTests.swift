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

class EncodeArrayTests: XCTestCase {
    func testEncodeBoolArray() {
        let booleans: [Bool] = [true, false]
        let expected: [UInt8] = [0x92, 0xc3, 0xc2]

        var encoder = Encoder()
        encoder.encode(array: booleans)

        XCTAssertEqual(encoder.bytes, expected)
    }

    func testEncodeUIntArray() {
        let bytes: [UInt] = [0x01, 0x02, 0x03]
        let expected: [UInt8] = [0x93, 0x01, 0x02, 0x03]

        var encoder = Encoder()
        encoder.encode(array: bytes)

        XCTAssertEqual(encoder.bytes, expected)
    }

    func testEncodeUInt8Array() {
        let bytes: [UInt8] = [0x01, 0x02, 0x03]
        let expected: [UInt8] = [0x93, 0x01, 0x02, 0x03]

        var encoder = Encoder()
        encoder.encode(array: bytes)

        XCTAssertEqual(encoder.bytes, expected)
    }

    func testEncodeUInt16Array() {
        let bytes: [UInt16] = [0x01, 0x02, 0x03]
        let expected: [UInt8] = [0x93, 0x01, 0x02, 0x03]

        var encoder = Encoder()
        encoder.encode(array: bytes)

        XCTAssertEqual(encoder.bytes, expected)
    }

    func testEncodeUInt32Array() {
        let bytes: [UInt32] = [0x01, 0x02, 0x03]
        let expected: [UInt8] = [0x93, 0x01, 0x02, 0x03]

        var encoder = Encoder()
        encoder.encode(array: bytes)

        XCTAssertEqual(encoder.bytes, expected)
    }

    func testEncodeUInt64Array() {
        let bytes: [UInt64] = [0x01, 0x02, 0x03]
        let expected: [UInt8] = [0x93, 0x01, 0x02, 0x03]

        var encoder = Encoder()
        encoder.encode(array: bytes)

        XCTAssertEqual(encoder.bytes, expected)
    }

    func testEncodeIntArray() {
        let bytes: [Int] = [0x01, 0x02, 0x03]
        let expected: [UInt8] = [0x93, 0x01, 0x02, 0x03]

        var encoder = Encoder()
        encoder.encode(array: bytes)

        XCTAssertEqual(encoder.bytes, expected)
    }

    func testEncodeInt8Array() {
        let bytes: [Int8] = [0x01, 0x02, 0x03]
        let expected: [UInt8] = [0x93, 0x01, 0x02, 0x03]

        var encoder = Encoder()
        encoder.encode(array: bytes)

        XCTAssertEqual(encoder.bytes, expected)
    }

    func testEncodeInt16Array() {
        let bytes: [Int16] = [0x01, 0x02, 0x03]
        let expected: [UInt8] = [0x93, 0x01, 0x02, 0x03]

        var encoder = Encoder()
        encoder.encode(array: bytes)

        XCTAssertEqual(encoder.bytes, expected)
    }

    func testEncodeInt32Array() {
        let bytes: [Int32] = [0x01, 0x02, 0x03]
        let expected: [UInt8] = [0x93, 0x01, 0x02, 0x03]

        var encoder = Encoder()
        encoder.encode(array: bytes)

        XCTAssertEqual(encoder.bytes, expected)
    }

    func testEncodeInt64Array() {
        let bytes: [Int64] = [0x01, 0x02, 0x03]
        let expected: [UInt8] = [0x93, 0x01, 0x02, 0x03]

        var encoder = Encoder()
        encoder.encode(array: bytes)

        XCTAssertEqual(encoder.bytes, expected)
    }

    static var allTests : [(String, (EncodeArrayTests) -> () throws -> Void)] {
        return [
            ("testEncodeBoolArray", testEncodeBoolArray),
            ("testEncodeUIntArray", testEncodeUIntArray),
            ("testEncodeUInt8Array", testEncodeUInt8Array),
            ("testEncodeUInt16Array", testEncodeUInt16Array),
            ("testEncodeUInt32Array", testEncodeUInt32Array),
            ("testEncodeUInt64Array", testEncodeUInt64Array),
            ("testEncodeIntArray", testEncodeIntArray),
            ("testEncodeInt8Array", testEncodeInt8Array),
            ("testEncodeInt16Array", testEncodeInt16Array),
            ("testEncodeInt32Array", testEncodeInt32Array),
            ("testEncodeInt64Array", testEncodeInt64Array),
        ]
    }
}
