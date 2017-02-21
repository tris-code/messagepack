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

class InitializableTests: TestCase {
    func testBool() {
        let trueValue = Bool(MessagePack.bool(true))
        let falseValue = Bool(MessagePack.bool(false))
        assertEqual(trueValue, true)
        assertEqual(falseValue, false)
    }

    func testFloat() {
        let expected = Float(1.618)
        let value = Float(MessagePack.float(1.618))
        assertEqual(value, expected)
    }

    func testDouble() {
        let expected = 1.618
        let value = Double(MessagePack.double(1.618))
        assertEqual(value, expected)
    }

    func testString() {
        let expected = "Hello, World!"
        let value = String(MessagePack.string("Hello, World!"))
        assertEqual(value, expected)
    }

    func testInt() {
        let expected = Int.min
        let value = Int(MessagePack.int(Int.min))
        assertEqual(value, expected)
    }

    func testUInt() {
        let expected = UInt.max
        let value = UInt(MessagePack.uint(UInt.max))
        assertEqual(value, expected)
    }

    func testConversions() {
        let utos = Int(MessagePack.uint(1))
        let stou = UInt(MessagePack.int(1))
        assertNotNil(utos)
        assertNotNil(stou)
    }

    func testConversionsOverflow() {
        let utos = Int(MessagePack.uint(UInt.max))
        let stou = UInt(MessagePack.int(Int.min))
        assertNil(utos)
        assertNil(stou)
    }

    func testArray() {
        let expected: [MessagePack] = [MessagePack(1), MessagePack(2.0), MessagePack("three")]
        let encoded = MessagePack.array(expected)
        let array = [MessagePack](encoded)
        assertNotNil(array)
        if array != nil {
            assertEqual(array!, expected)
        }
    }

    func testMap() {
        let expected: [MessagePack : MessagePack] = [1:2, 3:4]
        let encoded = MessagePack.map(expected)
        let map = [MessagePack : MessagePack](encoded)
        assertNotNil(map)
        if map != nil {
            assertEqual(map!, expected)
        }
    }

    func testBinary() {
        let expected: [UInt8] = [1,2,3]
        let encoded = MessagePack.binary(expected)
        let bytes = [UInt8](encoded)
        assertNotNil(bytes)
        if bytes != nil {
            assertEqual(bytes!, expected)
        }
    }

    static var allTests = [
        ("testBool", testBool),
        ("testFloat", testFloat),
        ("testDouble", testDouble),
        ("testString", testString),
        ("testInt", testInt),
        ("testUInt", testUInt),
        ("testConversions", testConversions),
        ("testConversionsOverflow", testConversionsOverflow),
        ("testArray", testArray),
        ("testMap", testMap),
        ("testBinary", testBinary),
    ]
}
