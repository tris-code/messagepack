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
