/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

public enum MessagePack: Equatable, Hashable {
    case `nil`
    case int(Int)
    case uint(UInt)
    case bool(Bool)
    case float(Float)
    case double(Double)
    case string(String)
    case binary([UInt8])
    case array([MessagePack])
    case map([MessagePack : MessagePack])
    case extended(Extended)

    public struct Extended: Equatable, Hashable {
        public var type: Int8
        public var data: [UInt8]

        public init(type: Int8, data: [UInt8]) {
            self.type = type
            self.data = data
        }
    }
}

extension MessagePack {
    public var hasValue: Bool {
        switch self {
        case .nil: return false
        default: return true
        }
    }
}

extension MessagePack: CustomStringConvertible {
    public var description: String {
        switch self {
        case .`nil`: return ".nil"
        case let .int(value): return ".int(\(value))"
        case let .uint(value): return ".uint(\(value))"
        case let .bool(value): return ".bool(\(value))"
        case let .float(value): return ".float(\(value))"
        case let .double(value): return ".double(\(value))"
        case let .string(value): return ".string(\"\(value)\")"
        case let .binary(value): return ".binary(\(value.hexDescription))"
        case let .array(value): return ".array(\(value))"
        case let .map(value): return ".map(\(value))"
        case let .extended(value): return ".extended(\(value))"
        }
    }
}

extension MessagePack.Extended: CustomStringConvertible {
    public var description: String {
        return "{\(type), \(data.hexDescription)}"
    }
}
