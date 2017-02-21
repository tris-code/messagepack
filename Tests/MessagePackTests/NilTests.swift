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
    func testEncodeNil() {
        let expected: [UInt8] = [0xc0]
        let encoded = MessagePack.encode(.nil)
        XCTAssertEqual(encoded, expected)
    }

    func testDecodeNil() {
        let expected = MessagePack.nil
        let decoded = try? MessagePack.decode(bytes: [0xc0])
        XCTAssertEqual(decoded, expected)
    }

    static var allTests : [(String, (NilTests) -> () throws -> Void)] {
        return [
            ("testEncodeNil", testEncodeNil),
            ("testDecodeNil", testDecodeNil)
        ]
    }
}
