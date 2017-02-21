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
        var encoder = Encoder()
        encoder.encode(object)
        return encoder.bytes
    }

    public static func decode(bytes: [UInt8]) throws -> MessagePack {
        var decoder = Decoder(bytes: bytes)
        return try decoder.decode() as MessagePack
    }

    public static func decode(bytes: UnsafeBufferPointer<UInt8>) throws -> MessagePack {
        var decoder = Decoder(bytesNoCopy: bytes)
        return try decoder.decode()
    }

    public static func decode(bytes start: UnsafePointer<UInt8>, count: Int) throws -> MessagePack {
        var decoder = Decoder(bytesNoCopy: start, count: count)
        return try decoder.decode()
    }
}
