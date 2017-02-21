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
    func testMessagePackEncoder() {
        if !_isDebugAssertConfiguration() {
            let object = MessagePack(workload)
            measure {
                for _ in 0..<1_000 {
                    _ = MessagePack.encode(object)
                }
            }
        }
    }

    // 1.618 sec
    func testMessagePackDecoder() {
        if !_isDebugAssertConfiguration() {
            let bytes = MessagePack.encode(MessagePack(workload))

            measure {
                for _ in 0..<1_000 {
                    do {
                        _ = try MessagePack.decode(bytes: bytes)
                    } catch {
                        XCTFail("unexpected error: \(error)")
                    }
                }
            }
        }
    }

    // 1.670 sec
    func testDecode() {
        if !_isDebugAssertConfiguration() {
            var encoder = Encoder()
            for value in workload {
                encoder.encode(value)
            }
            let bytes = encoder.bytes

            measure {
                for _ in 0..<1000 {
                    var decoder = Decoder(bytes: bytes)
                    for _ in 0..<100 {
                        do {
                            _ = UInt8(try decoder.decode() as MessagePack)
                            _ = UInt16(try decoder.decode() as MessagePack)
                            _ = UInt32(try decoder.decode() as MessagePack)
                            _ = UInt64(try decoder.decode() as MessagePack)
                            _ = Int8(try decoder.decode() as MessagePack)
                            _ = Int16(try decoder.decode() as MessagePack)
                            _ = Int32(try decoder.decode() as MessagePack)
                            _ = Int64(try decoder.decode() as MessagePack)
                            _ = Float(try decoder.decode() as MessagePack)
                            _ = Double(try decoder.decode() as MessagePack)
                            _ = [MessagePack](try decoder.decode() as MessagePack)
                            _ = [MessagePack : MessagePack](try decoder.decode() as MessagePack)
                            _ = Bool(try decoder.decode() as MessagePack)
                            _ = Bool(try decoder.decode() as MessagePack)
                            _ = String(try decoder.decode() as MessagePack)
                            _ = String(try decoder.decode() as MessagePack)
                            _ = String(try decoder.decode() as MessagePack)
                            _ = String(try decoder.decode() as MessagePack)
                        } catch {
                            XCTFail("unexpected error: \(error)")
                        }

                    }
                }
            }
        }
    }

    // 1.627 sec
    func testDecodeRaw() {
        if !_isDebugAssertConfiguration() {
            var encoder = Encoder()
            for value in workload {
                encoder.encode(value)
            }
            let bytes = encoder.bytes

            measure {
                for _ in 0..<1000 {
                    var decoder = Decoder(bytes: bytes)
                    for _ in 0..<100 {
                        do {
                            _ = try decoder.decode() as UInt8
                            _ = try decoder.decode() as UInt16
                            _ = try decoder.decode() as UInt32
                            _ = try decoder.decode() as UInt64
                            _ = try decoder.decode() as Int8
                            _ = try decoder.decode() as Int16
                            _ = try decoder.decode() as Int32
                            _ = try decoder.decode() as Int64
                            _ = try decoder.decode() as Float
                            _ = try decoder.decode() as Double
                            _ = try decoder.decode() as [MessagePack]
                            _ = try decoder.decode() as [MessagePack : MessagePack]
                            _ = try decoder.decode() as Bool
                            _ = try decoder.decode() as Bool
                            _ = try decoder.decode() as String
                            _ = try decoder.decode() as String
                            _ = try decoder.decode() as String
                            _ = try decoder.decode() as String
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
            ("testMessagePackEncoder", testMessagePackEncoder),
            ("testMessagePackDecoder", testMessagePackDecoder),
            ("testDecode", testDecode),
            ("testDecodeRaw", testDecodeRaw),
        ]
    }
}
