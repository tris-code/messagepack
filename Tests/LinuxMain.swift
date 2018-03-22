import XCTest

import MessagePackTests

var tests = [XCTestCaseEntry]()
tests += MessagePackTests.__allTests()

XCTMain(tests)
