/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

extension Bool {
    public init?(_ MessagePack: MessagePack) {
        guard case let .bool(value) = MessagePack else {
            return nil
        }
        self.init(value)
    }
}

extension String {
    public init?(_ MessagePack: MessagePack) {
        guard case let .string(string) = MessagePack else {
            return nil
        }
        self.init(string)
    }
}

extension Float {
    public init?(_ MessagePack: MessagePack) {
        switch MessagePack {
        case let .float(value): self.init(value)
        default: return nil
        }
    }
}

extension Double {
    public init?(_ MessagePack: MessagePack) {
        switch MessagePack {
        case let .double(value): self.init(value)
        default: return nil
        }
    }
}

extension Int {
    public init?(_ MessagePack: MessagePack) {
        switch MessagePack {
        case let .int(value): self.init(value)
        case let .uint(value) where value <= UInt(Int.max): self.init(value)
        default: return nil
        }
    }
}

extension Int8 {
    public init?(_ MessagePack: MessagePack) {
        switch MessagePack {
        case let .int(value) where value <= Int(Int8.max): self.init(value)
        case let .uint(value) where value <= UInt(Int8.max): self.init(value)
        default: return nil
        }
    }
}

extension Int16 {
    public init?(_ MessagePack: MessagePack) {
        switch MessagePack {
        case let .int(value) where value <= Int(Int16.max): self.init(value)
        case let .uint(value) where value <= UInt(Int16.max): self.init(value)
        default: return nil
        }
    }
}

extension Int32 {
    public init?(_ MessagePack: MessagePack) {
        switch MessagePack {
        case let .int(value) where value <= Int(Int32.max): self.init(value)
        case let .uint(value) where value <= UInt(Int32.max): self.init(value)
        default: return nil
        }
    }
}

extension Int64 {
    public init?(_ MessagePack: MessagePack) {
        switch MessagePack {
        case let .int(value): self.init(value)
        case let .uint(value) where UInt64(value) <= UInt64(Int64.max): self.init(value)
        default: return nil
        }
    }
}

extension UInt {
    public init?(_ MessagePack: MessagePack) {
        switch MessagePack {
        case let .int(value) where value >= 0 : self.init(value)
        case let .uint(value): self.init(value)
        default: return nil
        }
    }
}

extension UInt8 {
    public init?(_ MessagePack: MessagePack) {
        switch MessagePack {
        case let .int(value) where value >= 0 && UInt(value) <= UInt(UInt8.max): self.init(value)
        case let .uint(value) where value <= UInt(UInt8.max): self.init(value)
        default: return nil
        }
    }
}

extension UInt16 {
    public init?(_ MessagePack: MessagePack) {
        switch MessagePack {
        case let .int(value) where value >= 0 && UInt(value) <= UInt(UInt16.max): self.init(value)
        case let .uint(value) where value <= UInt(UInt16.max): self.init(value)
        default: return nil
        }
    }
}

extension UInt32 {
    public init?(_ MessagePack: MessagePack) {
        switch MessagePack {
        case let .int(value) where value >= 0 && UInt(value) <= UInt(UInt32.max): self.init(value)
        case let .uint(value) where value <= UInt(UInt32.max): self.init(value)
        default: return nil
        }
    }
}

extension UInt64 {
    public init?(_ MessagePack: MessagePack) {
        switch MessagePack {
        case let .int(value)  where value >= 0 : self.init(value)
        case let .uint(value)                  : self.init(value)
        default: return nil
        }
    }
}

//
// TODO:
// https://github.com/apple/swift/blob/master/docs/GenericsManifesto.md#concrete-same-type-requirements
//
//extension Array where Element == UInt8 {
//    public init?(_ MessagePack: MessagePack) {
//        if case let .binary(data) = MessagePack {
//            self.init(data)
//        }
//        return nil
//    }
//}

extension Sequence where Iterator.Element == UInt8 {
    public init?(_ value: MessagePack) {
        guard case let .binary(data) = value else {
            return nil
        }
        guard let binary = data as? Self else {
            return nil
        }
        self = binary
    }
}

extension Sequence where Iterator.Element == MessagePack {
    public init?(_ value: MessagePack) {
        guard case let .array(items) = value else {
            return nil
        }
        guard let array = items as? Self else {
            return nil
        }
        self = array
    }
}

extension Sequence where Iterator.Element == (key: MessagePack, value: MessagePack) {
    public init?(_ value: MessagePack) {
        guard case let .map(items) = value else {
            return nil
        }
        guard let map = items as? Self else {
            return nil
        }
        self = map
    }
}
