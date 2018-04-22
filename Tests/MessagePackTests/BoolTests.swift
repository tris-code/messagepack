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
