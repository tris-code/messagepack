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

class PerformanceTests: XCTestCase {

    var workload: [MessagePack] = []
    override func setUp() {
        if !_isDebugAssertConfiguration() {
            let values: [MessagePack] = [
                MessagePack(UInt8.max-1),
                MessagePack(UInt16.max-1),
                MessagePack(UInt32.max-1),
                MessagePack(UInt64.max-1),
                MessagePack(Int8.min+1),
                MessagePack(Int16.min+1),
                MessagePack(Int32.min+1),
                MessagePack(Int64.min+1),
                MessagePack(Float(3.14)),
                MessagePack(Double(3.14)),
                MessagePack([.int(0),.int(0),.int(0),.int(0),.int(0),.int(0),.int(0),.int(0)]),
                MessagePack([0:0,1:1,2:2,3:3,4:4,5:5]),
                MessagePack(true),
                MessagePack(false),
                MessagePack("Hello, World!"),
                MessagePack("Hello, World! Hello, World! Hello, World!"),
                MessagePack("Hello, World! Hello, World! Hello, World! Hello, World! Hello, World!"),
                MessagePack("Hello, World! Hello, World! Hello, World! Hello, World! Hello, World! Hello, World! Hello, World!")
            ]

            for _ in 0..<100 {
                workload.append(contentsOf: values)
            }
        }
    }

    // 0.303 sec
    func testMessagePackSerializer() {
        if !_isDebugAssertConfiguration() {
            let object = MessagePack(workload)
            measure {
                for _ in 0..<1_000 {
                    _ = MessagePack.serialize(object)
                }
            }
        }
    }

    // 1.618 sec
    func testMessagePackDeserializer() {
        if !_isDebugAssertConfiguration() {
            let bytes = MessagePack.serialize(MessagePack(workload))

            measure {
                for _ in 0..<1_000 {
                    do {
                        _ = try MessagePack.deserialize(bytes: bytes)
                    } catch {
                        XCTFail("unexpected error: \(error)")
                    }
                }
            }
        }
    }

    // 1.670 sec
    func testMPDeserializer() {
        if !_isDebugAssertConfiguration() {
            var packer = MPSerializer()
            for value in workload {
                packer.pack(value)
            }
            let bytes = packer.bytes

            measure {
                for _ in 0..<1000 {
                    var unpacker = MPDeserializer(bytes: bytes)
                    for _ in 0..<100 {
                        do {
                            _ = UInt8(try unpacker.unpack() as MessagePack)
                            _ = UInt16(try unpacker.unpack() as MessagePack)
                            _ = UInt32(try unpacker.unpack() as MessagePack)
                            _ = UInt64(try unpacker.unpack() as MessagePack)
                            _ = Int8(try unpacker.unpack() as MessagePack)
                            _ = Int16(try unpacker.unpack() as MessagePack)
                            _ = Int32(try unpacker.unpack() as MessagePack)
                            _ = Int64(try unpacker.unpack() as MessagePack)
                            _ = Float(try unpacker.unpack() as MessagePack)
                            _ = Double(try unpacker.unpack() as MessagePack)
                            _ = [MessagePack](try unpacker.unpack() as MessagePack)
                            _ = [MessagePack : MessagePack](try unpacker.unpack() as MessagePack)
                            _ = Bool(try unpacker.unpack() as MessagePack)
                            _ = Bool(try unpacker.unpack() as MessagePack)
                            _ = String(try unpacker.unpack() as MessagePack)
                            _ = String(try unpacker.unpack() as MessagePack)
                            _ = String(try unpacker.unpack() as MessagePack)
                            _ = String(try unpacker.unpack() as MessagePack)
                        } catch {
                            XCTFail("unexpected error: \(error)")
                        }

                    }
                }
            }
        }
    }

    // 1.627 sec
    func testMPDeserializerRaw() {
        if !_isDebugAssertConfiguration() {
            var packer = MPSerializer()
            for value in workload {
                packer.pack(value)
            }
            let bytes = packer.bytes

            measure {
                for _ in 0..<1000 {
                    var unpacker = MPDeserializer(bytes: bytes)
                    for _ in 0..<100 {
                        do {
                            _ = try unpacker.unpack() as UInt8
                            _ = try unpacker.unpack() as UInt16
                            _ = try unpacker.unpack() as UInt32
                            _ = try unpacker.unpack() as UInt64
                            _ = try unpacker.unpack() as Int8
                            _ = try unpacker.unpack() as Int16
                            _ = try unpacker.unpack() as Int32
                            _ = try unpacker.unpack() as Int64
                            _ = try unpacker.unpack() as Float
                            _ = try unpacker.unpack() as Double
                            _ = try unpacker.unpack() as [MessagePack]
                            _ = try unpacker.unpack() as [MessagePack : MessagePack]
                            _ = try unpacker.unpack() as Bool
                            _ = try unpacker.unpack() as Bool
                            _ = try unpacker.unpack() as String
                            _ = try unpacker.unpack() as String
                            _ = try unpacker.unpack() as String
                            _ = try unpacker.unpack() as String
                        } catch {
                            XCTFail("unexpected error: \(error)")
                        }
                    }
                }
            }
        }
    }

    static var allTests : [(String, (PerformanceTests) -> () throws -> Void)] {
        return [
            ("testMessagePackSerializer", testMessagePackSerializer),
            ("testMessagePackDeserializer", testMessagePackDeserializer),
            ("testMPDeserializer", testMPDeserializer),
            ("testMPDeserializerRaw", testMPDeserializerRaw),
        ]
    }
}

