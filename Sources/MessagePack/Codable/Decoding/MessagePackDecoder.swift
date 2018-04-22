/******************************************************************************
 *                                                                            *
 * Tris Foundation disclaims copyright to this source code.                   *
 * In place of a legal notice, here is a blessing:                            *
 *                                                                            *
 *     May you do good and not evil.                                          *
 *     May you find forgiveness for yourself and forgive others.              *
 *     May you share freely, never taking more than you give.                 *
 *                                                                            *
 ******************************************************************************
 *  This file contains code that has not yet been described                   *
 ******************************************************************************/

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
