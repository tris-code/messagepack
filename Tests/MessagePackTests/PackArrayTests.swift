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

class PackArrayTests: XCTestCase {

    func testSerializerPackBoolArray() {
        let booleans: [Bool] = [true, false]
        let expected: [UInt8] = [0x92, 0xc3, 0xc2]

        var serializer = MPSerializer()
        serializer.pack(array: booleans)

        XCTAssertEqual(serializer.bytes, expected)
    }

    func testSerializerPackUIntArray() {
        let bytes: [UInt] = [0x01, 0x02, 0x03]
        let expected: [UInt8] = [0x93, 0x01, 0x02, 0x03]

        var serializer = MPSerializer()
        serializer.pack(array: bytes)

        XCTAssertEqual(serializer.bytes, expected)
    }

    func testSerializerPackUInt8Array() {
        let bytes: [UInt8] = [0x01, 0x02, 0x03]
        let expected: [UInt8] = [0x93, 0x01, 0x02, 0x03]

        var serializer = MPSerializer()
        serializer.pack(array: bytes)

        XCTAssertEqual(serializer.bytes, expected)
    }

    func testSerializerPackUInt16Array() {
        let bytes: [UInt16] = [0x01, 0x02, 0x03]
        let expected: [UInt8] = [0x93, 0x01, 0x02, 0x03]

        var serializer = MPSerializer()
        serializer.pack(array: bytes)

        XCTAssertEqual(serializer.bytes, expected)
    }

    func testSerializerPackUInt32Array() {
        let bytes: [UInt32] = [0x01, 0x02, 0x03]
        let expected: [UInt8] = [0x93, 0x01, 0x02, 0x03]

        var serializer = MPSerializer()
        serializer.pack(array: bytes)

        XCTAssertEqual(serializer.bytes, expected)
    }

    func testSerializerPackUInt64Array() {
        let bytes: [UInt64] = [0x01, 0x02, 0x03]
        let expected: [UInt8] = [0x93, 0x01, 0x02, 0x03]

        var serializer = MPSerializer()
        serializer.pack(array: bytes)

        XCTAssertEqual(serializer.bytes, expected)
    }

    func testSerializerPackIntArray() {
        let bytes: [Int] = [0x01, 0x02, 0x03]
        let expected: [UInt8] = [0x93, 0x01, 0x02, 0x03]

        var serializer = MPSerializer()
        serializer.pack(array: bytes)

        XCTAssertEqual(serializer.bytes, expected)
    }

    func testSerializerPackInt8Array() {
        let bytes: [Int8] = [0x01, 0x02, 0x03]
        let expected: [UInt8] = [0x93, 0x01, 0x02, 0x03]

        var serializer = MPSerializer()
        serializer.pack(array: bytes)

        XCTAssertEqual(serializer.bytes, expected)
    }

    func testSerializerPackInt16Array() {
        let bytes: [Int16] = [0x01, 0x02, 0x03]
        let expected: [UInt8] = [0x93, 0x01, 0x02, 0x03]

        var serializer = MPSerializer()
        serializer.pack(array: bytes)

        XCTAssertEqual(serializer.bytes, expected)
    }

    func testSerializerPackInt32Array() {
        let bytes: [Int32] = [0x01, 0x02, 0x03]
        let expected: [UInt8] = [0x93, 0x01, 0x02, 0x03]

        var serializer = MPSerializer()
        serializer.pack(array: bytes)

        XCTAssertEqual(serializer.bytes, expected)
    }

    func testSerializerPackInt64Array() {
        let bytes: [Int64] = [0x01, 0x02, 0x03]
        let expected: [UInt8] = [0x93, 0x01, 0x02, 0x03]

        var serializer = MPSerializer()
        serializer.pack(array: bytes)

        XCTAssertEqual(serializer.bytes, expected)
    }

    static var allTests : [(String, (PackArrayTests) -> () throws -> Void)] {
        return [
            ("testSerializerPackBoolArray", testSerializerPackBoolArray),
            ("testSerializerPackUIntArray", testSerializerPackUIntArray),
            ("testSerializerPackUInt8Array", testSerializerPackUInt8Array),
            ("testSerializerPackUInt16Array", testSerializerPackUInt16Array),
            ("testSerializerPackUInt32Array", testSerializerPackUInt32Array),
            ("testSerializerPackUInt64Array", testSerializerPackUInt64Array),
            ("testSerializerPackIntArray", testSerializerPackIntArray),
            ("testSerializerPackInt8Array", testSerializerPackInt8Array),
            ("testSerializerPackInt16Array", testSerializerPackInt16Array),
            ("testSerializerPackInt32Array", testSerializerPackInt32Array),
            ("testSerializerPackInt64Array", testSerializerPackInt64Array),
        ]
    }
}
