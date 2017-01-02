/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

extension MessagePack {
    /// Use MPSerializer() to pack multiple values
    public static func serialize(_ object: MessagePack) -> [UInt8] {
        var serializer = MPSerializer()
        serializer.pack(object)
        return serializer.bytes
    }

    /// Use MPDeserializer(bytes: [UInt8]) to unpack multiple values
    public static func deserialize(bytes: [UInt8]) throws -> MessagePack {
        var deserializer = MPDeserializer(bytes: bytes)
        return try deserializer.unpack() as MessagePack
    }

    /// Use MPDeserializer(bytesNoCopy: UnsafeBufferPointer<UInt8>) to unpack multiple values
    public static func deserialize(bytes: UnsafeBufferPointer<UInt8>) throws -> MessagePack {
        var deserializer = MPDeserializer(bytesNoCopy: bytes)
        return try deserializer.unpack()
    }

    /// Use MPDeserializer(bytesNoCopy: UnsafePointer<UInt8>, count: Int) to unpack multiple values
    public static func deserialize(bytes start: UnsafePointer<UInt8>, count: Int) throws -> MessagePack {
        var deserializer = MPDeserializer(bytesNoCopy: start, count: count)
        return try deserializer.unpack()
    }
}
