/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

import Stream

extension MessagePack {
    public static func encode(_ object: MessagePack) throws -> [UInt8] {
        var writer = MessagePackWriter(OutputByteStream())
        try writer.encode(object)
        return writer.stream.bytes
    }

    public static func decode(bytes: [UInt8]) throws -> MessagePack {
        var reader = MessagePackReader(InputByteStream(bytes))
        return try reader.decode()
    }

    public static func encode<T: StreamWriter>(
        _ object: MessagePack,
        to stream: T
    ) throws {
        var writer = MessagePackWriter(stream)
        try writer.encode(object)
    }

    public static func decode<T: StreamReader>(
        from stream: T
    ) throws -> MessagePack {
        var reader = MessagePackReader(stream)
        return try reader.decode()
    }
}
