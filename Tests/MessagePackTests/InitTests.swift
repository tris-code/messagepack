/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

import MessagePack

class InitTests: TestCase {
    func testBytes() {
        let expected: MessagePack = [1,2,3]
        var decoder = Decoder(bytes: [0x93, 0x01, 0x02, 0x03])
        guard let decoded = try? decoder.decode() as MessagePack else {
            fail("decode error")
            return
        }
        assertEqual(decoded, expected)
    }

    func testUnsafeBufferPointer() {
        let expected: MessagePack = [1,2,3]
        var decoder = Decoder(bytes: UnsafeBufferPointer(start: UnsafePointer([0x93, 0x01, 0x02, 0x03]), count: 4))
        guard let decoded = try? decoder.decode() as MessagePack else {
            fail("decode error")
            return
        }
        assertEqual(decoded, expected)
    }

    func testUnsafePointer() {
        let expected: MessagePack = [1,2,3]
        var decoder = Decoder(bytes: UnsafePointer([0x93, 0x01, 0x02, 0x03]), count: 4)
        guard let decoded = try? decoder.decode() as MessagePack else {
            fail("decode error")
            return
        }
        assertEqual(decoded, expected)
    }

    static var allTests = [
        ("testBytes", testBytes),
        ("testUnsafeBufferPointer", testUnsafeBufferPointer),
        ("testUnsafePointer", testUnsafePointer)
    ]
}
