/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

extension MessagePack: ExpressibleByNilLiteral {
    public init(nilLiteral: ()) {
        self = .nil
    }
}

extension MessagePack: ExpressibleByBooleanLiteral {
    public init(booleanLiteral value: Bool) {
        self = .bool(value)
    }
}

extension MessagePack: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self = .int(value)
    }
}

extension MessagePack: ExpressibleByFloatLiteral {
    public init(floatLiteral value: Double) {
        self = .double(value)
    }
}

extension MessagePack: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self = .string(value)
    }
}

extension MessagePack: ExpressibleByUnicodeScalarLiteral {
    public init(unicodeScalarLiteral value: String) {
        self = .string(value)
    }
}

extension MessagePack: ExpressibleByExtendedGraphemeClusterLiteral {
    public init(extendedGraphemeClusterLiteral value: String) {
        self = .string(value)
    }
}

extension MessagePack: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: MessagePack...) {
        self = .array(elements)
    }
}

extension MessagePack: ExpressibleByDictionaryLiteral {
    public init(dictionaryLiteral elements: (MessagePack, MessagePack)...) {
        var dictionary =
            [MessagePack : MessagePack](minimumCapacity: elements.count)
        for (key, value) in elements {
            dictionary[key] = value
        }
        self = .map(dictionary)
    }
}
