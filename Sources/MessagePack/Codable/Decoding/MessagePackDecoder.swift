/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

public class MessagePackDecoder {
    public init() {}

    public func decode<T: Decodable>(
        _ type: T.Type, from bytes: [UInt8]
    ) throws -> T {
        let object = try MessagePack.decode(bytes: bytes)
        return try decode(type, from: object)
    }

    public func decode<T: Decodable>(
        _ type: T.Type, from object: MessagePack
    ) throws -> T {
        let decoder = _MessagePackDecoder(object)
        return try T(from: decoder)
    }

    // FIXME: (_ type: Decodable.Type, ...) shadows the generic one
    public func decode(
        decodable type: Decodable.Type, from bytes: [UInt8]
    ) throws -> Decodable {
        let object = try MessagePack.decode(bytes: bytes)
        return try decode(decodable: type, from: object)
    }

    public func decode(
        decodable type: Decodable.Type, from object: MessagePack
    ) throws -> Decodable {
        let decoder = _MessagePackDecoder(object)
        return try type.init(from: decoder)
    }
}

class _MessagePackDecoder: Decoder {
    var codingPath: [CodingKey] {
        return []
    }
    var userInfo: [CodingUserInfoKey : Any] {
        return [:]
    }

    let object: MessagePack

    init(_ object: MessagePack) {
        self.object = object
    }

    func container<Key>(
        keyedBy type: Key.Type
    ) throws -> KeyedDecodingContainer<Key> {
        guard case .map(let dictionary) = object else {
            throw DecodingError.typeMismatch([MessagePack : MessagePack].self, nil)
        }
        let container = MessagePackKeyedDecodingContainer<Key>(dictionary)
        return KeyedDecodingContainer(container)
    }

    func unkeyedContainer() throws -> UnkeyedDecodingContainer {
        guard case .array(let array) = object else {
            throw DecodingError.typeMismatch([MessagePack].self, nil)
        }
        return MessagePackUnkeyedDecodingContainer(array)
    }

    func singleValueContainer() throws -> SingleValueDecodingContainer {
        return MessagePackSingleValueDecodingContainer(object)
    }
}
