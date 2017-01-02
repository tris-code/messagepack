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
    testCase(NilTests.allTests),
    testCase(BoolTests.allTests),
    testCase(FloatTests.allTests),
    testCase(IntegerTests.allTests),
    testCase(StringTests.allTests),
    testCase(ArrayTests.allTests),
    testCase(MapTests.allTests),
    testCase(BinaryTests.allTests),
    testCase(ExtendedTests.allTests),
    testCase(StringEncodingTests.allTests),
    testCase(LiteralConvertibleTests.allTests),
    testCase(ConvenienceInitializersTests.allTests),
    testCase(ConveniencePropertiesTests.allTests),
    testCase(InitializableTests.allTests),
    testCase(DescriptionTests.allTests),
    testCase(EqualityTests.allTests),
    testCase(InitTests.allTests),
    testCase(HashValueTests.allTests),
    testCase(InsufficientDataTests.allTests),
    testCase(PackArrayTests.allTests),
    testCase(PerformanceTests.allTests),
])
