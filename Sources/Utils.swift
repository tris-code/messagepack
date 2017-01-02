/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

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
