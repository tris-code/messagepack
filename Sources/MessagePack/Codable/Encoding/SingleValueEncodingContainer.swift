/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

class MessagePackSingleValueEncodingContainer
: SingleValueEncodingContainer, MessagePackContainer {
    var codingPath: [CodingKey] {
        return []
    }

    var value: MessagePack = .nil

    func encodeNil() throws {
        self.value = .nil
    }

    func encode(_ value: Bool) throws {
        self.value = .bool(value)
    }

    func encode(_ value: Int) throws {
        self.value = .int(value)
    }

    func encode(_ value: Int8) throws {
        self.value = .int(Int(value))
    }

    func encode(_ value: Int16) throws {
        self.value = .int(Int(value))
    }

    func encode(_ value: Int32) throws {
        self.value = .int(Int(value))
    }

    func encode(_ value: Int64) throws {
        self.value = .int(Int(value))
    }

    func encode(_ value: UInt) throws {
        self.value = .uint(value)
    }

    func encode(_ value: UInt8) throws {
        self.value = .uint(UInt(value))
    }

    func encode(_ value: UInt16) throws {
        self.value = .uint(UInt(value))
    }

    func encode(_ value: UInt32) throws {
        self.value = .uint(UInt(value))
    }

    func encode(_ value: UInt64) throws {
        self.value = .uint(UInt(value))
    }

    func encode(_ value: Float) throws {
        self.value = .float(value)
    }

    func encode(_ value: Double) throws {
        self.value = .double(value)
    }

    func encode(_ value: String) throws {
        self.value = .string(value)
    }

    func encode<T>(_ value: T) throws where T : Encodable {
        let encoder = _MessagePackEncoder()
        try value.encode(to: encoder)
        self.value = encoder.value
    }
}
