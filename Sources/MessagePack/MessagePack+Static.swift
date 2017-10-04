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
    public static func encode(_ object: MessagePack) -> [UInt8] {
        var writer = MessagePackWriter()
        writer.encode(object)
        return writer.bytes
    }

    public static func decode(bytes: [UInt8]) throws -> MessagePack {
        var reader = MessagePackReader(bytes: bytes, count: bytes.count)
        return try reader.decode() as MessagePack
    }

    public static func decode(
        buffer: UnsafeRawBufferPointer
    ) throws -> MessagePack {
        var reader = MessagePackReader(buffer: buffer)
        return try reader.decode()
    }

    public static func decode(
        bytes: UnsafeRawPointer, count: Int
    ) throws -> MessagePack {
        var reader = MessagePackReader(bytes: bytes, count: count)
        return try reader.decode()
    }
}
