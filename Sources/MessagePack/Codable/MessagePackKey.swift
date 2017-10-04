/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

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
