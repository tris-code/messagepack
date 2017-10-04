# MessagePack

**MessagePack** is an efficient binary serialization format. It lets you exchange data among multiple languages like JSON. But it's faster and smaller. Small integers are encoded into a single byte, and typical short strings require only one extra byte in addition to the strings themselves.

## Package.swift

```swift
.package(url: "https://github.com/tris-foundation/messagepack.git", from: "0.4.0")
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

### Basic API

```swift
let hey = MessagePack("hey there!")
let bytes = try MessagePack.encode(hey)
let original = String(try MessagePack.decode(bytes: bytes))
```

### Stream API

```swift
let hey = MessagePack("hey there!")
let stream = BufferedStream(stream: NetworkStream(socket: client))
try MessagePack.encode(hey, to: stream)
try stream.flush()
let original = String(try MessagePack.decode(from: stream))
```

### Performance optimized

```swift
var encoder = MessagePackWriter(OutputByteStream())
try encoder.encode(.string("one"))
try encoder.encode(.int(2))
try encoder.encode(.double(3.0))
let encoded = encoder.stream.bytes

var decoder = MessagePackReader(InputByteStream(encoded))
// Throws on invalid data.
let value = try decoder.decode()

// You can also avoid extra MessagePack object,
// if you sure about the structure.
// Throws on type mismatch.
decoder = MessagePackReader(InputByteStream(encoded))
let string = try decoder.decode(String.self)
let int = try decoder.decode(UInt8.self)
let double = try decoder.decode(Double.self)
print("decoded manually: \(string), \(int), \(double)")
```
