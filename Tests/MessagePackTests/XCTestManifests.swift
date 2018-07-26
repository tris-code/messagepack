#if !os(macOS)
import XCTest

extension AccessorsTests {
    static let __allTests = [
        ("testArray", testArray),
        ("testBinary", testBinary),
        ("testBool", testBool),
        ("testConversions", testConversions),
        ("testDictionary", testDictionary),
        ("testDouble", testDouble),
        ("testExtended", testExtended),
        ("testFloat", testFloat),
        ("testInt", testInt),
        ("testString", testString),
        ("testUInt", testUInt),
    ]
}

extension ArrayTests {
    static let __allTests = [
        ("testDecodeArray16", testDecodeArray16),
        ("testDecodeArray32", testDecodeArray32),
        ("testDecodeFixarray", testDecodeFixarray),
        ("testEmptyArray", testEmptyArray),
        ("testEncodeArray16", testEncodeArray16),
        ("testEncodeArray32", testEncodeArray32),
        ("testEncodeFixArray", testEncodeFixArray),
        ("testFixArraySize", testFixArraySize),
    ]
}

extension BinaryTests {
    static let __allTests = [
        ("testDecodeBin16", testDecodeBin16),
        ("testDecodeBin32", testDecodeBin32),
        ("testDecodeBin8", testDecodeBin8),
        ("testEmptyBinary", testEmptyBinary),
        ("testEncodeBin16", testEncodeBin16),
        ("testEncodeBin32", testEncodeBin32),
        ("testEncodeBin8", testEncodeBin8),
    ]
}

extension BoolTests {
    static let __allTests = [
        ("testDecodeBoolFalse", testDecodeBoolFalse),
        ("testDecodeBoolTrue", testDecodeBoolTrue),
        ("testEncodeBoolFalse", testEncodeBoolFalse),
        ("testEncodeBoolTrue", testEncodeBoolTrue),
    ]
}

extension ConvenienceInitializersTests {
    static let __allTests = [
        ("testArray", testArray),
        ("testBinary", testBinary),
        ("testBool", testBool),
        ("testDouble", testDouble),
        ("testExtended", testExtended),
        ("testFloat", testFloat),
        ("testInt", testInt),
        ("testMap", testMap),
        ("testNil", testNil),
        ("testString", testString),
        ("testUInt", testUInt),
    ]
}

extension DecodeTests {
    static let __allTests = [
        ("testArray", testArray),
        ("testBinary", testBinary),
        ("testBool", testBool),
        ("testDouble", testDouble),
        ("testExtended", testExtended),
        ("testFloat", testFloat),
        ("testInt", testInt),
        ("testMap", testMap),
        ("testString", testString),
        ("testUInt", testUInt),
        ("testUIntMaxToInt", testUIntMaxToInt),
        ("testUIntToInt", testUIntToInt),
    ]
}

extension DescriptionTests {
    static let __allTests = [
        ("testArrayDescription", testArrayDescription),
        ("testBinaryDescription", testBinaryDescription),
        ("testBoolDescription", testBoolDescription),
        ("testDoubleDescription", testDoubleDescription),
        ("testExtendedDescription", testExtendedDescription),
        ("testFloatDescription", testFloatDescription),
        ("testIntDescription", testIntDescription),
        ("testMapDescription", testMapDescription),
        ("testNilDescription", testNilDescription),
        ("testStringDescription", testStringDescription),
        ("testUIntDescription", testUIntDescription),
    ]
}

extension EncodeArrayTests {
    static let __allTests = [
        ("testEncodeBoolArray", testEncodeBoolArray),
        ("testEncodeInt16Array", testEncodeInt16Array),
        ("testEncodeInt32Array", testEncodeInt32Array),
        ("testEncodeInt64Array", testEncodeInt64Array),
        ("testEncodeInt8Array", testEncodeInt8Array),
        ("testEncodeIntArray", testEncodeIntArray),
        ("testEncodeUInt16Array", testEncodeUInt16Array),
        ("testEncodeUInt32Array", testEncodeUInt32Array),
        ("testEncodeUInt64Array", testEncodeUInt64Array),
        ("testEncodeUInt8Array", testEncodeUInt8Array),
        ("testEncodeUIntArray", testEncodeUIntArray),
    ]
}

extension EqualityTests {
    static let __allTests = [
        ("testArrayEquality", testArrayEquality),
        ("testBinaryEquality", testBinaryEquality),
        ("testBoolEquality", testBoolEquality),
        ("testExtendedEquality", testExtendedEquality),
        ("testFloatEquality", testFloatEquality),
        ("testIntEquality", testIntEquality),
        ("testMapEquality", testMapEquality),
        ("testNilEquality", testNilEquality),
        ("testStringEquality", testStringEquality),
        ("testUIntEquality", testUIntEquality),
    ]
}

extension ExtendedTests {
    static let __allTests = [
        ("testDecodeExt16", testDecodeExt16),
        ("testDecodeExt32", testDecodeExt32),
        ("testDecodeExt8", testDecodeExt8),
        ("testDecodeFixExt1", testDecodeFixExt1),
        ("testDecodeFixExt16", testDecodeFixExt16),
        ("testDecodeFixExt2", testDecodeFixExt2),
        ("testDecodeFixExt4", testDecodeFixExt4),
        ("testDecodeFixExt8", testDecodeFixExt8),
        ("testEncodeExt16", testEncodeExt16),
        ("testEncodeExt32", testEncodeExt32),
        ("testEncodeExt8", testEncodeExt8),
        ("testEncodeFixExt1", testEncodeFixExt1),
        ("testEncodeFixExt16", testEncodeFixExt16),
        ("testEncodeFixExt2", testEncodeFixExt2),
        ("testEncodeFixExt4", testEncodeFixExt4),
        ("testEncodeFixExt8", testEncodeFixExt8),
    ]
}

extension FloatTests {
    static let __allTests = [
        ("testDecodeDouble", testDecodeDouble),
        ("testDecodeFloat", testDecodeFloat),
        ("testEncodeDouble", testEncodeDouble),
        ("testEncodeFloat", testEncodeFloat),
    ]
}

extension InitTests {
    static let __allTests = [
        ("testByteStream", testByteStream),
    ]
}

extension InsufficientDataTests {
    static let __allTests = [
        ("testArrayInsufficientData", testArrayInsufficientData),
        ("testBinaryInsufficientData", testBinaryInsufficientData),
        ("testExtendedInsufficientData", testExtendedInsufficientData),
        ("testFloatInsufficientData", testFloatInsufficientData),
        ("testIntegerInsufficientData", testIntegerInsufficientData),
        ("testInvalidData", testInvalidData),
        ("testMapInsufficientData", testMapInsufficientData),
        ("testStringInsufficientData", testStringInsufficientData),
    ]
}

extension IntegerTests {
    static let __allTests = [
        ("testDecodeNegativeFixInt", testDecodeNegativeFixInt),
        ("testDecodeNegativeInt16", testDecodeNegativeInt16),
        ("testDecodeNegativeInt32", testDecodeNegativeInt32),
        ("testDecodeNegativeInt64", testDecodeNegativeInt64),
        ("testDecodeNegativeInt8", testDecodeNegativeInt8),
        ("testDecodePositiveFixInt", testDecodePositiveFixInt),
        ("testDecodeUInt16", testDecodeUInt16),
        ("testDecodeUInt32", testDecodeUInt32),
        ("testDecodeUInt64", testDecodeUInt64),
        ("testDecodeUInt8", testDecodeUInt8),
        ("testEncodeInt", testEncodeInt),
        ("testEncodeNegativeIntToFixInt", testEncodeNegativeIntToFixInt),
        ("testEncodePositiveIntToFixInt", testEncodePositiveIntToFixInt),
        ("testEncodeUInt", testEncodeUInt),
    ]
}

extension InvalidHeaderTests {
    static let __allTests = [
        ("testArrayHeader", testArrayHeader),
        ("testBinaryHeader", testBinaryHeader),
        ("testExtendedHeader", testExtendedHeader),
        ("testMapHeader", testMapHeader),
        ("testStringHeader", testStringHeader),
    ]
}

extension KeyedDecodingContainerTests {
    static let __allTests = [
        ("testKeyedContainer", testKeyedContainer),
        ("testNestedKeyedContainer", testNestedKeyedContainer),
        ("testNestedUnkeyedContainer", testNestedUnkeyedContainer),
    ]
}

extension KeyedEncodingContainerTests {
    static let __allTests = [
        ("testKeyedContainer", testKeyedContainer),
        ("testNestedKeyedContainer", testNestedKeyedContainer),
        ("testNestedUnkeyedContainer", testNestedUnkeyedContainer),
    ]
}

extension LiteralConvertibleTests {
    static let __allTests = [
        ("testArrayLiteralConvertible", testArrayLiteralConvertible),
        ("testBooleanLiteralConvertible", testBooleanLiteralConvertible),
        ("testDictionaryLiteralConvertible", testDictionaryLiteralConvertible),
        ("testFloatLiteralConvertible", testFloatLiteralConvertible),
        ("testNilLiteralConvertible", testNilLiteralConvertible),
        ("testSignedIntegerLiteralConvertible", testSignedIntegerLiteralConvertible),
        ("testStringLiteralConvertible", testStringLiteralConvertible),
        ("testUnsignedIntegerLiteralConvertible", testUnsignedIntegerLiteralConvertible),
    ]
}

extension ManualHeadersTests {
    static let __allTests = [
        ("testDecodeArray", testDecodeArray),
        ("testDecodeMap", testDecodeMap),
        ("testEncodeArray", testEncodeArray),
        ("testEncodeMap", testEncodeMap),
    ]
}

extension MapTests {
    static let __allTests = [
        ("testDecodeFixMap", testDecodeFixMap),
        ("testDecodeMap16", testDecodeMap16),
        ("testDecodeMap32", testDecodeMap32),
        ("testEmptyMap", testEmptyMap),
        ("testEncodeFixMap", testEncodeFixMap),
        ("testEncodeMap16", testEncodeMap16),
        ("testEncodeMap32", testEncodeMap32),
        ("testFixMapSize", testFixMapSize),
    ]
}

extension MessagePackCodersTests {
    static let __allTests = [
        ("testDecodable", testDecodable),
        ("testEncodable", testEncodable),
    ]
}

extension MessagePackInitializableTests {
    static let __allTests = [
        ("testArray", testArray),
        ("testArrayOfInt", testArrayOfInt),
        ("testArrayOfString", testArrayOfString),
        ("testBinary", testBinary),
        ("testDictionary", testDictionary),
        ("testExtended", testExtended),
    ]
}

extension NilTests {
    static let __allTests = [
        ("testDecodeNil", testDecodeNil),
        ("testEncodeNil", testEncodeNil),
        ("testHasValue", testHasValue),
    ]
}

extension StringEncodingTests {
    static let __allTests = [
        ("testASCIIString", testASCIIString),
        ("testEnglishString", testEnglishString),
        ("testJapaneseString", testJapaneseString),
        ("testRussianString", testRussianString),
        ("testSwedishString", testSwedishString),
    ]
}

extension StringTests {
    static let __allTests = [
        ("testDecodeFixStr", testDecodeFixStr),
        ("testDecodeStr16", testDecodeStr16),
        ("testDecodeStr32", testDecodeStr32),
        ("testDecodeStr8", testDecodeStr8),
        ("testEncodeFixStr", testEncodeFixStr),
        ("testEncodeStr16", testEncodeStr16),
        ("testEncodeStr32", testEncodeStr32),
        ("testEncodeStr8", testEncodeStr8),
    ]
}

extension TimestampTests {
    static let __allTests = [
        ("testDecode12", testDecode12),
        ("testDecode4", testDecode4),
        ("testDecode8", testDecode8),
        ("testEncode12", testEncode12),
        ("testEncode4", testEncode4),
        ("testEncode8", testEncode8),
    ]
}

extension UnkeyedDecodingContainerTests {
    static let __allTests = [
        ("testNestedKeyedContainer", testNestedKeyedContainer),
        ("testNestedUnkeyedContainer", testNestedUnkeyedContainer),
        ("testUnkeyedContainer", testUnkeyedContainer),
    ]
}

extension UnkeyedEncodingContainerTests {
    static let __allTests = [
        ("testNestedKeyedContainer", testNestedKeyedContainer),
        ("testNestedUnkeyedContainer", testNestedUnkeyedContainer),
        ("testUnkeyedContainer", testUnkeyedContainer),
    ]
}

public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(AccessorsTests.__allTests),
        testCase(ArrayTests.__allTests),
        testCase(BinaryTests.__allTests),
        testCase(BoolTests.__allTests),
        testCase(ConvenienceInitializersTests.__allTests),
        testCase(DecodeTests.__allTests),
        testCase(DescriptionTests.__allTests),
        testCase(EncodeArrayTests.__allTests),
        testCase(EqualityTests.__allTests),
        testCase(ExtendedTests.__allTests),
        testCase(FloatTests.__allTests),
        testCase(InitTests.__allTests),
        testCase(InsufficientDataTests.__allTests),
        testCase(IntegerTests.__allTests),
        testCase(InvalidHeaderTests.__allTests),
        testCase(KeyedDecodingContainerTests.__allTests),
        testCase(KeyedEncodingContainerTests.__allTests),
        testCase(LiteralConvertibleTests.__allTests),
        testCase(ManualHeadersTests.__allTests),
        testCase(MapTests.__allTests),
        testCase(MessagePackCodersTests.__allTests),
        testCase(MessagePackInitializableTests.__allTests),
        testCase(NilTests.__allTests),
        testCase(StringEncodingTests.__allTests),
        testCase(StringTests.__allTests),
        testCase(TimestampTests.__allTests),
        testCase(UnkeyedDecodingContainerTests.__allTests),
        testCase(UnkeyedEncodingContainerTests.__allTests),
    ]
}
#endif
