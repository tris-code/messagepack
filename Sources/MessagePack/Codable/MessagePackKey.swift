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

extension CodingKey {
    var messagePackKey: MessagePack {
        switch intValue {
        case .some(let value): return .int(value)
        case .none: return .string(stringValue)
        }
    }

    init?(_ key: MessagePack) {
        switch key {
        case .int(let value):
            guard let key = Self(intValue: value) else {
                return nil
            }
            self = key
        case .uint(let value) where value < Int.max:
            guard let key = Self(intValue: Int(value)) else {
                return nil
            }
            self = key
        case .string(let value):
            guard let key = Self(stringValue: value) else {
                return nil
            }
            self = key
        default:
            return nil
        }
    }
}
