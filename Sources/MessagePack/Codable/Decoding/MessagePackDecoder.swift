/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

public final class MessagePackDecoder: Decoder {
    public var codingPath: [CodingKey] {
        return []
    }
    public var userInfo: [CodingUserInfoKey : Any] {
        return [:]
    }

    let object: MessagePack

    public init(_ object: MessagePack) {
        self.object = object
    }

    public func container<Key>(
        keyedBy type: Key.Type
    ) throws -> KeyedDecodingContainer<Key> {
        guard case .map(let dictionary) = object else {
            throw DecodingError.typeMismatch([MessagePack : MessagePack].self, nil)
        }
        let container = MessagePackKeyedDecodingContainer<Key>(dictionary)
        return KeyedDecodingContainer(container)
    }

    public func unkeyedContainer() throws -> UnkeyedDecodingContainer {
        guard case .array(let array) = object else {
            throw DecodingError.typeMismatch([MessagePack].self, nil)
        }
        return MessagePackUnkeyedDecodingContainer(array)
    }

    public func singleValueContainer() throws -> SingleValueDecodingContainer {
        return MessagePackSingleValueDecodingContainer(object)
    }
}
