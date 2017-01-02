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

class NilTests: XCTestCase {
    func testSerializerNil() {
        let expected: [UInt8] = [0xc0]
        let packed = MessagePack.serialize(.nil)
        XCTAssertEqual(packed, expected)
    }

    func testDeserializerNil() {
        let expected = MessagePack.nil
        let unpacked = try? MessagePack.deserialize(bytes: [0xc0])
        XCTAssertEqual(unpacked, expected)
    }

    static var allTests : [(String, (NilTests) -> () throws -> Void)] {
        return [
            ("testSerializerNil", testSerializerNil),
            ("testDeserializerNil", testDeserializerNil)
        ]
    }
}
