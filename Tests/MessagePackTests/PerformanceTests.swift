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

class PerformanceTests: TestCase {
    var workload: [MessagePack] = []
    var iterations = 0
    
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
                MessagePack([.int(0),.int(1),.int(2),.int(3),.int(4),.int(5),.int(6),.int(7)]),
                MessagePack([0:0,1:1,2:2,3:3,4:4,5:5]),
                MessagePack(true),
                MessagePack(false),
                MessagePack("Hello, World!")
            ]

            // make a million MessagePack objects
            // (including array and dictionary items)
            iterations = 1_000_000 / (values.count + 8 + 6)
            for _ in 0..<iterations {
                workload.append(contentsOf: values)
            }
        }
    }

    // 0.023 sec
    func testMessagePackEncoder() {
        if !_isDebugAssertConfiguration() {
            let object = MessagePack(workload)
            measure {
                _ = MessagePack.encode(object)
            }
        }
    }

    // 0.128 sec
    func testMessagePackDecoder() {
        if !_isDebugAssertConfiguration() {
            let bytes = MessagePack.encode(MessagePack(workload))

            measure {
                do {
                    _ = try MessagePack.decode(bytes: bytes)
                } catch {
                    fail("unexpected error: \(error)")
                }
            }
        }
    }

    // 0.111 sec
    func testDecode() {
        if !_isDebugAssertConfiguration() {
            var encoder = Encoder()
            for value in workload {
                encoder.encode(value)
            }
            let bytes = encoder.bytes

            measure {
                var decoder = Decoder(bytes: bytes, count: bytes.count)
                for _ in 0..<self.iterations {
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
                    } catch {
                        fail("unexpected error: \(error)")
                    }
                }
            }
        }
    }

    // 0.103 sec
    func testDecodeExact() {
        if !_isDebugAssertConfiguration() {
            var encoder = Encoder()
            for value in workload {
                encoder.encode(value)
            }
            let bytes = encoder.bytes

            measure {
                var decoder = Decoder(bytes: bytes, count: bytes.count)
                for _ in 0..<self.iterations {
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
                    } catch {
                        fail("unexpected error: \(error)")
                    }
                }
            }
        }
    }

    static var allTests = [
        ("testMessagePackEncoder", testMessagePackEncoder),
        ("testMessagePackDecoder", testMessagePackDecoder),
        ("testDecode", testDecode),
        ("testDecodeExact", testDecodeExact),
    ]
}
