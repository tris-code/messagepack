/******************************************************************************
 *                                                                            *
 * Tris Foundation disclaims copyright to this source code.                   *
 * In place of a legal notice, here is a blessing:                            *
 *                                                                            *
 *     May you do good and not evil.                                          *
 *     May you find forgiveness for yourself and forgive others.              *
 *     May you share freely, never taking more than you give.                 *
 *                                                                            *
 ******************************************************************************/

// TODO: rename the file to Decoder+Error.swift for the next Swift release

extension Decoder {
    enum Error: Swift.Error {
        enum ContainerType {
            case keyed(by: CodingKey.Type, for: CodingKey?)
            case unkeyed(for: CodingKey?)
            case singleValue
        }

        case containerTypeMismatch(
            requested: ContainerType,
            actual: Any)

        case typeMismatch(
            forKey: CodingKey?,
            requested: Decodable.Type,
            actual: Any)

        case keyNotFound(CodingKey)
    }
}

extension Decoder.Error {
    static func typeMismatch(
        requested: Decodable.Type,
        actual: Any) -> Decoder.Error
    {
        return .typeMismatch(
            forKey: nil,
            requested: requested,
            actual: actual)
    }
}

extension Decoder.Error.ContainerType {
    static func keyed(by type: CodingKey.Type) -> Decoder.Error.ContainerType {
        return .keyed(by: type, for: nil)
    }

    static var unkeyed: Decoder.Error.ContainerType {
        return .unkeyed(for: nil)
    }
}
