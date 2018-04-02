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

class MessagePackCodersTests: TestCase {
    func testEncodable() {
        struct Model: Encodable {
            let int: Int
            let string: String
            let array: [Int]
        }
        let expected: MessagePack = .map([
            .string("int"): .int(42),
            .string("string"): .string("hello"),
            .string("array"): .array([.int(1), .int(2)])
        ])

        scope {
            let model = Model(int: 42, string: "hello", array: [1,2])
            let encoder = MessagePackEncoder()
            try model.encode(to: encoder)
            assertEqual(encoder.value, expected)
        }
    }

    func testDecodable() {
        struct Model: Decodable {
            let int: Int
            let string: String
            let array: [Int]
        }
        let encoded: MessagePack = .map([
            .string("int"): .int(42),
            .string("string"): .string("hello"),
            .string("array"): .array([.int(1), .int(2)])
        ])

        scope {
            let decoder = MessagePackDecoder(encoded)
            let decoded = try Model(from: decoder)
            assertEqual(decoded.int, 42)
            assertEqual(decoded.string, "hello")
            assertEqual(decoded.array, [1,2])
        }
    }
}
