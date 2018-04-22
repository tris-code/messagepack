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

import Foundation

extension Sequence where Iterator.Element == UInt8 {
    var hexDescription: String {
        var bytes: [String] = []
        for byte in self {
            let prefix = byte < 16 ? "0x0" : "0x"
            bytes.append(prefix + String(byte, radix: 16))
        }
        let joined = bytes.joined(separator: ", ")
        return "[\(joined)]"
    }
}

extension Sequence where Iterator.Element == UInt8 {
    var hashValue: Int {
        var hash = 5381
        for byte in self {
            hash = ((hash << 5) &+ hash) &+ Int(byte | 0x20)
        }
        return hash
    }
}
