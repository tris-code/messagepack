/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

struct MessagePackSingleValueDecodingContainer: SingleValueDecodingContainer {
    var codingPath: [CodingKey] {
        return []
    }

    var value: MessagePack

    init(_ value: MessagePack) {
        self.value = value
    }

    @inline(__always)
    private func inlinedDecode<T: MessagePackInitializable>(
        _ type: T.Type
    ) throws -> T {
        guard let value = T(self.value) else {
            throw DecodingError.typeMismatch(
                type, .incompatible(with: self.value))
        }
        return value
    }

    func decodeNil() -> Bool {
        guard case .nil = value else {
            return false
        }
        return true
    }

    func decode(_ type: Bool.Type) throws -> Bool {
        return try inlinedDecode(type)
    }

    func decode(_ type: Int.Type) throws -> Int {
        return try inlinedDecode(type)
    }

    func decode(_ type: Int8.Type) throws -> Int8 {
        return try inlinedDecode(type)
    }

    func decode(_ type: Int16.Type) throws -> Int16 {
        return try inlinedDecode(type)
    }

    func decode(_ type: Int32.Type) throws -> Int32 {
        return try inlinedDecode(type)
    }

    func decode(_ type: Int64.Type) throws -> Int64 {
        return try inlinedDecode(type)
    }

    func decode(_ type: UInt.Type) throws -> UInt {
        return try inlinedDecode(type)
    }

    func decode(_ type: UInt8.Type) throws -> UInt8 {
        return try inlinedDecode(type)
    }

    func decode(_ type: UInt16.Type) throws -> UInt16 {
        return try inlinedDecode(type)
    }

    func decode(_ type: UInt32.Type) throws -> UInt32 {
        return try inlinedDecode(type)
    }

    func decode(_ type: UInt64.Type) throws -> UInt64 {
        return try inlinedDecode(type)
    }

    func decode(_ type: Float.Type) throws -> Float {
        return try inlinedDecode(type)
    }

    func decode(_ type: Double.Type) throws -> Double {
        return try inlinedDecode(type)
    }

    func decode(_ type: String.Type) throws -> String {
        return try inlinedDecode(type)
    }

    func decode<T>(_ type: T.Type) throws -> T where T : Decodable {
        let decoder = MessagePackDecoder(value)
        return try T(from: decoder)
    }
}
