/******************************************************************************
 *                                                                            *
 * Tris Foundation disclaims copyright to this source code.                   *
 * In place of a legal notice, here is a blessing:                            *
 *                                                                            *
 *     May you do good and not evil.                                          *
 *     May you find forgiveness for yourself and forgive others.              *
 *     May you share freely, never taking more than you give.                 *
 *                                                                            *
 ******************************************************************************
 *  This file contains code that has not yet been described                   *
 ******************************************************************************/

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
