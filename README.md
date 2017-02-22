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

### Convenience API

```swift
let hey = MessagePack("hey there!")
let bytes = MessagePack.encode(hey)
let original = String(try MessagePack.decode(bytes: bytes))
```

### Performance optimized

```swift
var encoder = Encoder()
encoder.encode(.string("one"))
encoder.encode(.int(2))
encoder.encode(.double(3.0))
let encoded = encoder.bytes
// be careful, we use raw pointer here
var decoder = Decoder(bytes: encoded, count: encoded.count)
// throws on invalid data
let value = try decoder.decode() as MessagePack
// reuse decoder
decoder.rewind()
// you can avoid extra MessagePack object if you sure about structure
// throws on wrong type
let string = try decoder.decode() as String
let int = try decoder.decode() as UInt8
let double = try decoder.decode() as Double
```
