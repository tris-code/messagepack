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

class FloatTests: XCTestCase {
    func testEncodeFloat() {
        let expected: [UInt8] = [0xca, 0x3f, 0xcf, 0x1a, 0xa0]
        let encoded = MessagePack.encode(.float(1.618))
        XCTAssertEqual(encoded, expected)
    }

    func testDecodeFloat() {
        let expected = MessagePack.float(1.618)
        let encoded: [UInt8] = [0xca, 0x3f, 0xcf, 0x1a, 0xa0]
        let decoded = try? MessagePack.decode(bytes: encoded)
        XCTAssertEqual(decoded, expected)
    }

    func testEncodeDouble() {
        let expected: [UInt8] = [0xcb, 0x3f, 0xf9, 0xe3, 0x53, 0xf7, 0xce, 0xd9, 0x17]
        let encoded = MessagePack.encode(.double(1.618))
        XCTAssertEqual(encoded, expected)
    }

    func testDecodeDouble() {
        let expected = MessagePack.double(1.618)
        let encoded: [UInt8] = [0xcb, 0x3f, 0xf9, 0xe3, 0x53, 0xf7, 0xce, 0xd9, 0x17]
        let decoded = try? MessagePack.decode(bytes: encoded)
        XCTAssertEqual(decoded, expected)
    }

    static var allTests : [(String, (FloatTests) -> () throws -> Void)] {
        return [
            ("testEncodeFloat", testEncodeFloat),
            ("testDecodeFloat", testDecodeFloat),
            ("testEncodeDouble", testEncodeDouble),
            ("testDecodeDouble", testDecodeDouble)
        ]
    }
}
