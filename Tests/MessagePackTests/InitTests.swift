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
    func testUnsafeBufferPointer() {
        let expected: MessagePack = [1,2,3]
        let bytes: [UInt8] = [0x93, 0x01, 0x02, 0x03]
        let buffer = UnsafeRawBufferPointer(start: bytes, count: bytes.count)
        var decoder = Decoder(buffer: buffer)
        guard let decoded = try? decoder.decode() as MessagePack else {
            fail("decode error")
            return
        }
        assertEqual(decoded, expected)
    }

    func testUnsafePointer() {
        let expected: MessagePack = [1,2,3]
        let bytes: [UInt8] = [0x93, 0x01, 0x02, 0x03]
        var decoder = Decoder(bytes: UnsafeRawPointer(bytes), count: 4)
        guard let decoded = try? decoder.decode() as MessagePack else {
            fail("decode error")
            return
        }
        assertEqual(decoded, expected)
    }

    static var allTests = [
        ("testUnsafeBufferPointer", testUnsafeBufferPointer),
        ("testUnsafePointer", testUnsafePointer)
    ]
}
