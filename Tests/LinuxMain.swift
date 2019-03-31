import XCTest

import HeapTests

var tests = [XCTestCaseEntry]()
tests += HeapTests.allTests()
XCTMain(tests)
