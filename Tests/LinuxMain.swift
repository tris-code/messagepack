/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

import XCTest
@testable import MessagePackTests

XCTMain([
    testCase(AccessorsTests.allTests),
    testCase(ArrayTests.allTests),
    testCase(BinaryTests.allTests),
    testCase(BoolTests.allTests),
    testCase(ConvenienceInitializersTests.allTests),
    testCase(DecodeTests.allTests),
    testCase(DescriptionTests.allTests),
    testCase(EncodeArrayTests.allTests),
    testCase(EqualityTests.allTests),
    testCase(ExtendedTests.allTests),
    testCase(FloatTests.allTests),
    testCase(HashValueTests.allTests),
    testCase(InitTests.allTests),
    testCase(InsufficientDataTests.allTests),
    testCase(IntegerTests.allTests),
    testCase(InvalidHeaderTests.allTests),
    testCase(LiteralConvertibleTests.allTests),
    testCase(ManualHeadersTests.allTests),
    testCase(MapTests.allTests),
    testCase(MessagePackInitializableTests.allTests),
    testCase(NilTests.allTests),
    testCase(StringEncodingTests.allTests),
    testCase(StringTests.allTests),
    testCase(TimestampTests.allTests),

    testCase(KeyedDecodingContainerTests.allTests),
    testCase(KeyedEncodingContainerTests.allTests),
    testCase(MessagePackCodersTests.allTests),
    testCase(UnkeyedDecodingContainerTests.allTests),
    testCase(UnkeyedEncodingContainerTests.allTests),
])
