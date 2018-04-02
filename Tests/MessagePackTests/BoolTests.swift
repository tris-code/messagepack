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
import MessagePack

class BoolTests: TestCase {
    func testEncodeBoolFalse() {
        scope {
            let expected: [UInt8] = [0xc2]
            let encoded = try MessagePack.encode(.bool(false))
            assertEqual(encoded, expected)
        }
    }

    func testDecodeBoolFalse() {
        scope {
            let expected = MessagePack.bool(false)
            let decoded = try MessagePack.decode(bytes: [0xc2])
            assertEqual(decoded, expected)
        }
    }

    func testEncodeBoolTrue() {
        scope {
            let expected: [UInt8] = [0xc3]
            let encoded = try MessagePack.encode(.bool(true))
            assertEqual(encoded, expected)
        }
    }

    func testDecodeBoolTrue() {
        scope {
            let expected = MessagePack.bool(true)
            let decoded = try MessagePack.decode(bytes: [0xc3])
            assertEqual(decoded, expected)
        }
    }
}
