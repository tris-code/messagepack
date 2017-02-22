/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

@testable import MessagePack

class InvalidHeaderTests: TestCase {
    func testStringHeader() {
        let header: [UInt8] = [0xff]
        var decoder = Decoder(bytes: header, count: header.count)
        assertThrowsError(try decoder.readStringHeader(code: decoder.readCode()))
    }

    func testArrayHeader() {
        let header: [UInt8] = [0xff]
        var decoder = Decoder(bytes: header, count: header.count)
        assertThrowsError(try decoder.readArrayHeader(code: decoder.readCode()))
    }

    func testMapHeader() {
        let header: [UInt8] = [0xff]
        var decoder = Decoder(bytes: header, count: header.count)
        assertThrowsError(try decoder.readMapHeader(code: decoder.readCode()))
    }

    func testBinaryHeader() {
        let header: [UInt8] = [0xff]
        var decoder = Decoder(bytes: header, count: header.count)
        assertThrowsError(try decoder.readBinaryHeader(code: decoder.readCode()))
    }

    func testExtendedHeader() {
        let header: [UInt8] = [0xff]
        var decoder = Decoder(bytes: header, count: header.count)
        assertThrowsError(try decoder.readExtendedHeader(code: decoder.readCode()))
    }

    static var allTests = [
        ("testStringHeader", testStringHeader),
        ("testArrayHeader", testArrayHeader),
        ("testMapHeader", testMapHeader),
        ("testBinaryHeader", testBinaryHeader),
        ("testExtendedHeader", testExtendedHeader),
    ]
}
