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
import Stream
import MessagePack

class InitTests: TestCase {
    func testByteStream() {
        scope {
            let expected: MessagePack = [1,2,3]
            let bytes: [UInt8] = [0x93, 0x01, 0x02, 0x03]
            var reader = MessagePackReader(InputByteStream(bytes))
            let decoded = try reader.decode() as MessagePack
            assertEqual(decoded, expected)
        }
    }
}
