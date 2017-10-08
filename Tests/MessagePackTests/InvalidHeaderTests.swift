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

    static var allTests = [
        ("testStringHeader", testStringHeader),
        ("testArrayHeader", testArrayHeader),
        ("testMapHeader", testMapHeader),
        ("testBinaryHeader", testBinaryHeader),
        ("testExtendedHeader", testExtendedHeader),
    ]
}
