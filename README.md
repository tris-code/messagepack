# MessagePack

**MessagePack** is an efficient binary serialization format. It lets you exchange data among multiple languages like JSON. But it's faster and smaller. Small integers are encoded into a single byte, and typical short strings require only one extra byte in addition to the strings themselves.

## Package.swift

```swift
.Package(url: "https://github.com/tris-foundation/messagepack.git", majorVersion: 0)
```

## Memo

```swift
public enum MessagePack {
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

    public struct Extended {
        public let type: Int8
        public let data: [UInt8]
        public init(type: Int8, data: [UInt8]) {
            self.type = type
            self.data = data
        }
    }
}
```

## Usage

You can find this code and more in [examples](https://github.com/tris-foundation/examples).

```swift
    let hey = MessagePack("hey there!")
    let bytes = MessagePack.serialize(hey)
    let original = String(MessagePack.deserialize(bytes: bytes))
```

```swift
    let bytes = MessagePack.serialize(.array([.int(1), .string("two")]))
```

```swift
    var serializer = MPSerializer()
    serializer.pack(.string("one"))
    serializer.pack(.int(2))
    serializer.pack(.double(3.0))

    let bytes = serializer.bytes
```

```swift
    var deserializer = MPDeserializer(bytes: [UInt8](..))

    // throws on invalid data
    let value = try deserializer.unpack() as MessagePack
    // you can avoid extra MessagePack object creation
    // if you know the data structure
    // throws on wrong type
    let int = try deserializer.unpack() as UInt8
    let string = try deserializer.unpack() as String
    let double = try deserializer.unpack() as Double

```

```swift
    var unsafeDeserializer = MPDeserializer(bytesNoCopy: UnsafeBufferPointer<UInt8>(..))
    var unsafeDeserializer = MPDeserializer(bytesNoCopy: UnsafePointer<UInt8>(..), count: N)
```
