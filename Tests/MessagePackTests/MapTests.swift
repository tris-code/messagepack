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

func makeMap(repeating: MessagePack, count: Int) -> [MessagePack: MessagePack] {
    var map: [MessagePack: MessagePack] = [:]
    for i in 0..<count {
        map[.int(i)] = repeating
    }
    return map
}

func makePackedMapData(repeating: MessagePack, count: Int) -> [UInt8] {
    var bytes: [UInt8] = []
    for i in 0..<count {
        bytes.append(contentsOf: MessagePack.serialize(.int(i)))
        bytes.append(contentsOf: MessagePack.serialize(repeating))
    }
    return bytes
}

class MapTests: XCTestCase {
    func testSerializerFixMap() {
        let expected: [UInt8] = [0x81, 0xa5, 0x68, 0x65, 0x6c, 0x6c, 0x6f, 0xa5, 0x77, 0x6f, 0x72, 0x6c, 0x64]
        let packed = MessagePack.serialize(.map([.string("hello"): .string("world")]))
        XCTAssertEqual(packed, expected)
    }

    func testDeserializerFixMap() {
        let expected = MessagePack.map([.string("hello"): .string("world")])
        let unpacked = try? MessagePack.deserialize(bytes: [0x81, 0xa5, 0x68, 0x65, 0x6c, 0x6c, 0x6f, 0xa5, 0x77, 0x6f, 0x72, 0x6c, 0x64])
        XCTAssertEqual(unpacked, expected)
    }

    func testSerializerMap16() {
        let expected: [UInt8] = [0xde, 0x01, 0x00] + makePackedMapData(repeating: .nil, count: Int(UInt8.max)+1)
        let packed = MessagePack.serialize(.map(makeMap(repeating: nil, count: Int(UInt8.max)+1)))
        XCTAssertEqual(packed.prefix(3), expected.prefix(3))
        XCTAssertEqual(packed.sorted(), expected.sorted())
    }

    func testDeserializerMap16() {
        let expected = MessagePack.map(makeMap(repeating: nil, count: Int(UInt8.max)+1))
        let unpacked = try? MessagePack.deserialize(bytes: [0xde, 0x01, 0x00] + makePackedMapData(repeating: .nil, count: Int(UInt8.max)+1))
        XCTAssertEqual(unpacked, expected)
    }

    func testSerializerMap32() {
        let expected: [UInt8] = [0xdf, 0x00, 0x01, 0x00, 0x00] + makePackedMapData(repeating: .nil, count: Int(UInt16.max)+1)
        let packed = MessagePack.serialize(.map(makeMap(repeating: nil, count: Int(UInt16.max)+1)))
        XCTAssertEqual(packed.prefix(3), expected.prefix(3))
        XCTAssertEqual(packed.sorted(), expected.sorted())
    }

    func testDeserializerMap32() {
        let expected = MessagePack.map(makeMap(repeating: nil, count: Int(UInt16.max)+1))
        let unpacked = try? MessagePack.deserialize(bytes: [0xdf, 0x00, 0x01, 0x00, 0x00] + makePackedMapData(repeating: .nil, count: Int(UInt16.max)+1))
        XCTAssertEqual(unpacked, expected)
    }

    func testEmptyMap() {
        let mapArray: [[UInt8]] = [
            [0x80],
            [0xde, 0x00, 0x00],
            [0xdf, 0x00, 0x00, 0x00, 0x00]
        ]
        for bytes in mapArray {
            if let empty = try? MessagePack.deserialize(bytes: bytes) {
                XCTAssertEqual(empty.map!, [:])
            } else {
                XCTFail("deserialize failed")
            }
        }
    }

    static var allTests : [(String, (MapTests) -> () throws -> Void)] {
        return [
            ("testSerializerFixMap", testSerializerFixMap),
            ("testDeserializerFixMap", testDeserializerFixMap),
            ("testSerializerMap16", testSerializerMap16),
            ("testDeserializerMap16", testDeserializerMap16),
            ("testSerializerMap32", testSerializerMap32),
            ("testDeserializerMap32", testDeserializerMap32),
            ("testEmptyMap", testEmptyMap)
        ]
    }
}
