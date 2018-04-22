/******************************************************************************
 *                                                                            *
 * Tris Foundation disclaims copyright to this source code.                   *
 * In place of a legal notice, here is a blessing:                            *
 *                                                                            *
 *     May you do good and not evil.                                          *
 *     May you find forgiveness for yourself and forgive others.              *
 *     May you share freely, never taking more than you give.                 *
 *                                                                            *
 ******************************************************************************/

import Test
import Stream
@testable import MessagePack

class InvalidHeaderTests: TestCase {
    func testStringHeader() {
        let header: [UInt8] = [0xff]
        var reader = MessagePackReader(InputByteStream(header))
        assertThrowsError(try reader.readStringHeader(code: reader.readCode()))
    }

    func testArrayHeader() {
        let header: [UInt8] = [0xff]
        var reader = MessagePackReader(InputByteStream(header))
        assertThrowsError(try reader.readArrayHeader(code: reader.readCode()))
    }

    func testMapHeader() {
        let header: [UInt8] = [0xff]
        var reader = MessagePackReader(InputByteStream(header))
        assertThrowsError(try reader.readMapHeader(code: reader.readCode()))
    }

    func testBinaryHeader() {
        let header: [UInt8] = [0xff]
        var reader = MessagePackReader(InputByteStream(header))
        assertThrowsError(try reader.readBinaryHeader(code: reader.readCode()))
    }

    func testExtendedHeader() {
        let header: [UInt8] = [0xff]
        var reader = MessagePackReader(InputByteStream(header))
        assertThrowsError(try reader.readExtendedHeader(code: reader.readCode()))
    }
}
