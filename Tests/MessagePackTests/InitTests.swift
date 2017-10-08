/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

import Test
import Stream
import MessagePack

class InitTests: TestCase {
    func testByteStream() {
        let expected: MessagePack = [1,2,3]
        let bytes: [UInt8] = [0x93, 0x01, 0x02, 0x03]
        var reader = MessagePackReader(InputByteStream(bytes))
        guard let decoded = try? reader.decode() as MessagePack else {
            fail("decode error")
            return
        }
        assertEqual(decoded, expected)
    }

    static var allTests = [
        ("testByteStream", testByteStream),
    ]
}

