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

class ConveniencePropertiesTests: XCTestCase {
    func testNilProperty() {
        let nilValue = MessagePack.nil
        XCTAssertTrue(nilValue.isNil)

        XCTAssertFalse(MessagePack.int(0).isNil)
        XCTAssertFalse(MessagePack.string("").isNil)
        XCTAssertFalse(MessagePack.float(0).isNil)
        XCTAssertFalse(MessagePack.double(0).isNil)
        XCTAssertFalse(MessagePack.array([]).isNil)
        XCTAssertFalse(MessagePack.map([:]).isNil)
        XCTAssertFalse(MessagePack.binary([]).isNil)
        XCTAssertFalse(MessagePack.extended(MessagePack.Extended(type: 0, data: [])).isNil)
    }

    func testArrayProperty() {
        guard let array = MessagePack.array([1, 2, 3]).array else {
            XCTFail("array property shouldn't be nil")
            return
        }
        XCTAssertEqual(array[0], 1)
        XCTAssertEqual(array[1], 2)
        XCTAssertEqual(array[2], 3)
    }

    func testMapProperty() {
        guard let map = MessagePack.map(["Hello": "World"]).map else {
            XCTFail("map property shouldn't be nil")
            return
        }
        XCTAssertEqual(map["Hello"]!, "World")
    }

    func testBinaryProperty() {
        guard let binary = MessagePack.binary([0x01, 0x02, 0x03]).binary else {
            XCTFail("binary property shouldn't be nil")
            return
        }
        XCTAssertEqual(binary, [0x01, 0x02, 0x03])
    }

    func testExtendedProperty() {
        let extended = MessagePack.Extended(type: 1, data: [0x01, 0x02, 0x03])
        guard let encoded = MessagePack.extended(extended).extended else {
            XCTFail("extended property shouldn't be nil")
            return
        }
        XCTAssertEqual(encoded.type, 1)
        XCTAssertEqual(encoded.data, [0x01, 0x02, 0x03])
    }

    static var allTests : [(String, (ConveniencePropertiesTests) -> () throws -> Void)] {
        return [
            ("testNilProperty", testNilProperty),
            ("testArrayProperty", testArrayProperty),
            ("testMapProperty", testMapProperty),
            ("testBinaryProperty", testBinaryProperty),
            ("testExtendedProperty", testExtendedProperty)
        ]
    }
}
