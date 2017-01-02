/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

import XCTest
import MessagePack

class LiteralConvertibleTests: XCTestCase {
    func testNilLiteralConvertible() {
        let expected = MessagePack.nil
        let value: MessagePack = nil
        XCTAssertEqual(value, expected)
    }

    func testBooleanLiteralConvertible() {
        let trueExpected = MessagePack.bool(true)
        let falseExpected = MessagePack.bool(false)
        let trueValue: MessagePack = true
        let falseValue: MessagePack = false
        XCTAssertEqual(trueValue, trueExpected)
        XCTAssertEqual(falseValue, falseExpected)
    }

    func testIntegerLiteralConvertible() {
        let expected = MessagePack.int(123)
        let value: MessagePack = 123
        XCTAssertEqual(value, expected)
        guard case .int = value else {
            XCTFail("value is not .int type")
            return
        }
    }

    func testFloatLiteralConvertible() {
        let expected = MessagePack.double(1.618)
        let value: MessagePack = 1.618
        XCTAssertEqual(value, expected)
    }

    func testStringLiteralConvertible() {
        let expected = MessagePack.string("Hello, World!")
        let value: MessagePack = "Hello, World!"
        XCTAssertEqual(value, expected)
    }

    func testArrayLiteralConvertible() {
        let expected: MessagePack = [1, 2, 3]
        let value = MessagePack.array([.int(1), .int(2), .int(3)])
        XCTAssertEqual(value, expected)
    }

    func testDictionaryLiteralConvertible() {
        let expected = MessagePack.map([.string("Hello"): .string("World")])
        let value: MessagePack = ["Hello": "World"]
        XCTAssertEqual(value, expected)
    }

    static var allTests : [(String, (LiteralConvertibleTests) -> () throws -> Void)] {
        return [
            ("testNilLiteralConvertible", testNilLiteralConvertible),
            ("testBooleanLiteralConvertible", testBooleanLiteralConvertible),
            ("testIntegerLiteralConvertible", testIntegerLiteralConvertible),
            ("testFloatLiteralConvertible", testFloatLiteralConvertible),
            ("testStringLiteralConvertible", testStringLiteralConvertible),
            ("testArrayLiteralConvertible", testArrayLiteralConvertible),
            ("testDictionaryLiteralConvertible", testDictionaryLiteralConvertible)
        ]
    }
}
