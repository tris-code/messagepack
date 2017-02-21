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

class DescriptionTests: TestCase {
    func testNilDescription() {
        let exected = "nil"
        let description = MessagePack.nil.description
        assertEqual(description, exected)
    }

    func testBoolDescription() {
        let expectedTrue = "true"
        let expectedFalse = "false"
        let descriptionTrue = MessagePack.bool(true).description
        let descriptionFalse = MessagePack.bool(false).description
        assertEqual(descriptionTrue, expectedTrue)
        assertEqual(descriptionFalse, expectedFalse)
    }

    func testFloatDescription() {
        let expected = "1.618"
        let description = MessagePack.float(1.618).description
        assertEqual(description, expected)
    }

    func testDoubleDescription() {
        let expected = "1.618"
        let description = MessagePack.double(1.618).description
        assertEqual(description, expected)
    }

    func testStringDescription() {
        let expected = "\"Hello, World!\""
        let description = MessagePack.string("Hello, World!").description
        assertEqual(description, expected)
    }

    func testIntDescription() {
        let exected = "-1"
        let description = MessagePack.int(-1).description
        assertEqual(description, exected)
    }

    func testUIntDescription() {
        let exected = "1"
        let description = MessagePack.uint(1).description
        assertEqual(description, exected)
    }

    func testArrayDescription() {
        let expected = "[nil, true, 1, 1.618, \"Hello, World!\"]"
        let description = MessagePack.array([nil, true, 1, 1.618, "Hello, World!"]).description
        assertEqual(description, expected)
    }

    func testMapDescription() {
        let expected = "[\"Hello\": \"World\"]"
        let description = MessagePack.map(["Hello": "World"]).description
        assertEqual(description, expected)
    }

    func testBinaryDescription() {
        let expected = "[0x01, 0x02, 0x03, 0xff]"
        let description = MessagePack.binary([0x01, 0x02, 0x03, 0xff]).description
        assertEqual(description, expected)
    }

    func testExtendedDescription() {
        let expected = "{1, [0x01, 0x02, 0x03, 0xff]}"
        let ext = MessagePack.Extended(type: 1, data: [0x01, 0x02, 0x03, 0xff])
        let description = MessagePack.extended(ext).description
        assertEqual(description, expected)
    }

    static var allTests = [
        ("testNilDescription", testNilDescription),
        ("testBoolDescription", testBoolDescription),
        ("testFloatDescription", testFloatDescription),
        ("testDoubleDescription", testDoubleDescription),
        ("testStringDescription", testStringDescription),
        ("testIntDescription", testIntDescription),
        ("testUIntDescription", testUIntDescription),
        ("testArrayDescription", testArrayDescription),
        ("testMapDescription", testMapDescription),
        ("testBinaryDescription", testBinaryDescription),
        ("testExtendedDescription", testExtendedDescription),
    ]
}
