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

class LiteralConvertibleTests: TestCase {
    func testNilLiteralConvertible() {
        let expected = MessagePack.nil
        let value: MessagePack = nil
        assertEqual(value, expected)
    }

    func testBooleanLiteralConvertible() {
        let trueExpected = MessagePack.bool(true)
        let falseExpected = MessagePack.bool(false)
        let trueValue: MessagePack = true
        let falseValue: MessagePack = false
        assertEqual(trueValue, trueExpected)
        assertEqual(falseValue, falseExpected)
    }

    func testIntegerLiteralConvertible() {
        let expected = MessagePack.int(123)
        let value: MessagePack = 123
        assertEqual(value, expected)
        guard case .int = value else {
            fail("value is not .int type")
            return
        }
    }

    func testFloatLiteralConvertible() {
        let expected = MessagePack.double(1.618)
        let value: MessagePack = 1.618
        assertEqual(value, expected)
    }

    func testStringLiteralConvertible() {
        let expected = MessagePack.string("Hello, World!")
        let value: MessagePack = "Hello, World!"
        assertEqual(value, expected)
    }

    func testArrayLiteralConvertible() {
        let expected: MessagePack = [1, 2, 3]
        let value = MessagePack.array([.int(1), .int(2), .int(3)])
        assertEqual(value, expected)
    }

    func testDictionaryLiteralConvertible() {
        let expected = MessagePack.map([.string("Hello"): .string("World")])
        let value: MessagePack = ["Hello": "World"]
        assertEqual(value, expected)
    }

    static var allTests = [
        ("testNilLiteralConvertible", testNilLiteralConvertible),
        ("testBooleanLiteralConvertible", testBooleanLiteralConvertible),
        ("testIntegerLiteralConvertible", testIntegerLiteralConvertible),
        ("testFloatLiteralConvertible", testFloatLiteralConvertible),
        ("testStringLiteralConvertible", testStringLiteralConvertible),
        ("testArrayLiteralConvertible", testArrayLiteralConvertible),
        ("testDictionaryLiteralConvertible", testDictionaryLiteralConvertible)
    ]
}
