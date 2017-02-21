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
    func testEncodeBoolFalse() {
        let expected: [UInt8] = [0xc2]
        let encoded = MessagePack.encode(.bool(false))
        XCTAssertEqual(encoded, expected)
    }

    func testDecodeBoolFalse() {
        let expected = MessagePack.bool(false)
        let decoded = try? MessagePack.decode(bytes: [0xc2])
        XCTAssertEqual(decoded, expected)
    }

    func testEncodeBoolTrue() {
        let expected: [UInt8] = [0xc3]
        let encoded = MessagePack.encode(.bool(true))
        XCTAssertEqual(encoded, expected)
    }

    func testDecodeBoolTrue() {
        let expected = MessagePack.bool(true)
        let decoded = try? MessagePack.decode(bytes: [0xc3])
        XCTAssertEqual(decoded, expected)
    }

    static var allTests : [(String, (BoolTests) -> () throws -> Void)] {
        return [
            ("testEncodeBoolFalse", testEncodeBoolFalse),
            ("testDecodeBoolFalse", testDecodeBoolFalse),
            ("testEncodeBoolTrue", testEncodeBoolTrue),
            ("testDecodeBoolTrue", testDecodeBoolTrue)
        ]
    }
}
